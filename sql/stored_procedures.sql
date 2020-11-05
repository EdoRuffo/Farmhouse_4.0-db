DROP PROCEDURE IF EXISTS Operazione_1;
DELIMITER $$

CREATE PROCEDURE Operazione_1(IN _CodDocumento char(100))
	BEGIN
		DECLARE _CodPagamento INT;
        SET _CodPagamento = (	SELECT U.CodPagamento
								FROM Utente U
								WHERE U.CodDocumento = _CodDocumento);
                                
		DELETE FROM Utente
        WHERE CodDocumento = _CodDocumento;
        
        DELETE FROM Cliente
        WHERE CodPagamento = _CodPagamento;
        
        DELETE FROM PrenotazioneServiziAggiuntivi
        WHERE CodPrenotazione IN(
					SELECT CodPrenotazione
                    FROM Prenotazione
                    WHERE CodPagamento = _CodPagamento
                    );
		
        DELETE FROM PrenotazioneStanze
        WHERE CodPrenotazione IN(
					SELECT CodPrenotazione
                    FROM Prenotazione
                    WHERE CodPagamento = _CodPagamento
                    );
        
        DELETE FROM Pagamento 
        WHERE CodPrenotazione IN(
					SELECT CodPrenotazione 
					FROM Prenotazione
                    WHERE CodPagamento = _CodPagamento
                    );
		
        DELETE FROM PrenotazioneEscursione
        WHERE CodPrenotazione  IN(
					SELECT CodPrenotazione 
					FROM Prenotazione
                    WHERE CodPagamento = _CodPagamento
                    );
                    
		DELETE FROM Prenotazione
        WHERE CodPagamento = _CodPagamento;
	END$$
    
DROP PROCEDURE IF EXISTS Operazione_2;
CREATE PROCEDURE Operazione_2(IN _CodPrenotazione INT, _CodPagamento INT,
								_DataPartenza Date, _Acconto INT)
	BEGIN
		INSERT INTO Prenotazione VALUES(
		_CodPagamento, _CodPrenotazione, current_date, _DataPartenza, _Acconto);
	END$$
    
DROP PROCEDURE IF EXISTS Operazione_3;
CREATE PROCEDURE Operazione_3(	IN _CodPrenotazione INT,
								IN _CodCarta INT)
	BEGIN
		DECLARE CostoSoggiorno INT DEFAULT 0;
        DECLARE Acconto INT DEFAULT 0;
        DECLARE CostoStanza INT DEFAULT 0;
        
        SET Acconto = (
								SELECT Acconto
                                FROM Prenotazione
                                WHERE CodPrenotazione = _CodPrenotazione
						);
                        
		SET CostoStanza = (		SELECT SUM(S.Costo)
								FROM PrenotazioneStanze PS INNER JOIN Stanza S ON PS.NumeroStanza = S.NumeroStanza
                                WHERE PS.CodPrenotazione = _CodPrenotazione
							);
        
        SET CostoSoggiorno = (	
								SELECT SUM(SA.Costo)
								FROM PrenotazioneServiziAggiuntivi PSA
									INNER JOIN ServiziAggiuntivi SA ON PSA.NomeServizio = SA.NomeServizio
								WHERE PSA.CodPrenotazione = _CodPrenotazione
                                ) - Acconto + CostoStanza;

		INSERT INTO Pagamento 
		Values(_CodPrenotazione, current_date, HOUR(Current_timestamp), CostoSoggiorno, _CodCarta);
    END$$
        
DROP PROCEDURE IF EXISTS Operazione_4;
CREATE PROCEDURE Operazione_4(IN _CodProdotto INT)
	BEGIN
		SELECT D.Nome, D.Cognome
        FROM Prodotto P
			INNER JOIN Impiego I ON I.CodLotto = P.CodLotto
            INNER JOIN Dipendente D ON I.CodDipendente = D.CodDipendente
		WHERE P.CodProdotto = _CodProdotto;
	END$$

DROP PROCEDURE IF EXISTS Operazione_5;
CREATE PROCEDURE Operazione_5()
	BEGIN 
		SELECT P.CodAnimale, A.CodLocale, timediff(P.OrarioRientro, Date_ADD(P.OrarioInizio, INTERVAL 2 HOUR)) as Ritardo
        FROM Pascolo P
			INNER JOIN Animale A on A.CodAnimale = P.CodAnimale
        WHERE P.OrarioRientro > Date_ADD(P.OrarioInizio, INTERVAL 2 HOUR)  /* una sessione di pascolo ha una durata di 2 ore */
		GROUP BY P.CodAnimale
        HAVING MAX(P.OrarioInizio);
	END$$

DROP PROCEDURE IF EXISTS Operazione_6;
CREATE PROCEDURE Operazione_6()
	BEGIN 
		SELECT DISTINCT A.CodAnimale
        FROM StatoMangiatoia SM 
			INNER JOIN Mangiatoia M ON SM.CodMangiatoia = M.Codice
            INNER JOIN Animale A ON A.CodLocale = M.CodLocale
        WHERE SM.ForaggioResiduo != 0 AND 
			SM.TimeStamp = (
							SELECT MAX(SM1.TimeStamp)
                            FROM StatoMangiatoia SM1
                            );
    END$$

DROP PROCEDURE IF EXISTS Operazione_7;
CREATE PROCEDURE Operazione_7(IN _CodAnimale INT)
	BEGIN
		SELECT R.Madre, R.Padre
        FROM Nati N
			INNER JOIN Riproduzione R ON N.CodRiproduzione = R.Codice
		WHERE N.CodAnimale = _CodAnimale;
    END$$
    
DROP PROCEDURE IF EXISTS Operazione_8; /*CON RIDONDANZA*/
CREATE PROCEDURE Operazione_8(IN _CodLotto INT)
	BEGIN
		SELECT Durata
        FROM Lotto
		WHERE CodLotto = _CodLotto;
    END$$

DROP PROCEDURE IF EXISTS Operazione_9;	/*CON RIDONDANZA*/
CREATE PROCEDURE Operazione_9()
	BEGIN
		SELECT S.CodScaffalaturaC, S.NomeFormaggio
        FROM Stagionature S
        ;
    END$$

/*Operazione 10*/
DROP PROCEDURE IF EXISTS Operazione_10;
CREATE PROCEDURE Operazione_10 (IN _timeStamp TIMESTAMP,
										_CodAnimale INT,
										_x INT,
										_y INT,
										_z INT)
	BEGIN
		INSERT INTO GPS VALUES
		(_timeStamp, _CodAnimale, _x, _y_z);
    END$$
