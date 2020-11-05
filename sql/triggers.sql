DROP TRIGGER IF EXISTS RidondanzaLotto;
delimiter $$
CREATE TRIGGER RidondanzaLotto
BEFORE INSERT ON Lotto
FOR EACH ROW
	BEGIN
        SET NEW.Durata = (
								SELECT SUM(FL1.Durata)
								FROM FasiLavorazione FL1
									INNER JOIN Prodotto P1 ON FL1.CodProdotto = P1.CodProdotto
                                WHERE P1.CodLotto = NEW.CodLotto
								GROUP BY FL1.CodProdotto
								HAVING SUM(FL1.Durata) = (
											SELECT MAX(D.DurataTot)
											FROM(
												SELECT SUM(FL.Durata) AS DurataTot
												FROM FasiLavorazione FL
													INNER JOIN Prodotto P ON FL.CodProdotto = P.CodProdotto
                                                WHERE P.CodLotto = NEW.CodLotto
												GROUP BY FL.CodProdotto
												)AS D
								)
        );
    END$$

DROP TRIGGER IF EXISTS RidondanzaStagionature;
CREATE TRIGGER RidondanzaStagionature
BEFORE INSERT ON Stagionature
FOR EACH ROW
	BEGIN
		SET NEW.NomeFormaggio = (	SELECT P.TipoFormaggio
                                    FROM ScaffalaturaCantina SC 
										INNER JOIN Prodotto P ON SC.CodProdotto = P.CodProdotto
									WHERE SC.CodScaffalaturaC = NEW.CodScaffalaturaC AND
										SC.CodCantina = NEW.CodCantina
								);
    END$$
    
/*VINCOLI DI INTEGRITA GENERICI */

DROP TRIGGER IF EXISTS VIG2;
CREATE TRIGGER VIG2
BEFORE INSERT ON Animale
FOR EACH ROW
	BEGIN
		IF(NEW.Specie != 'Bovino' AND NEW.Specie != 'Ovino' AND NEW.Specie != 'Caprino')
        THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Specie non consentita';
		END IF;
	END$$

DROP TRIGGER IF EXISTS VIG8;
CREATE TRIGGER VIG8
BEFORE INSERT ON Fornitore
FOR EACH ROW
	BEGIN
		IF(CHAR_LENGTH(NEW.PartitaIVA) != 11)
		THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'PartitaIVA non valida';
		END IF;
	END$$
    
DROP TRIGGER IF EXISTS VIG15;
CREATE TRIGGER VIG15
BEFORE INSERT ON TipoArricchimento
FOR EACH ROW 
	BEGIN
		IF(NEW.Vitamine < 0 OR NEW.Vitamine > 100)
        THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Attributo Vitamine non valido';
		END IF;
        IF(NEW.SaliMinerali < 0 OR NEW.SaliMinerali > 100)
		THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Attributo SaliMinerali non valido';
		END IF;
	END$$	

DROP TRIGGER IF EXISTS VIG25;
CREATE TRIGGER VIG25
BEFORE INSERT ON Riproduzione
FOR EACH ROW
	BEGIN
		IF(NEW.Esito != 'Positivo' AND NEW.Esito != 'Negativo')
		THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Esito non riconosciuto';
		END IF;
	END$$

DROP TRIGGER IF EXISTS VIG33;
CREATE TRIGGER VIG33
BEFORE INSERT ON PrenotazioneEscursione
FOR EACH ROW
	BEGIN
		DECLARE _DataEscursione DATE;
        DECLARE _OrarioInizioEscursione TIME;
        
        SET _DataEscursione =( 	SELECT E.Data
								FROM Escursione E
								WHERE E.CodEscursione = NEW.CodEscursione);
                                
		SET _OrarioInizioEscursione =(	 	SELECT E.OrarioInizio
											FROM Escursione E
											WHERE E.CodEscursione = NEW.CodEscursione);
                                            
		IF(DATEDIFF(DATE(current_timestamp), _DataEscursione) < 2)
			THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Prenotazione non valida';
            END IF;
		IF(DATEDIFF(DATE(current_timestamp), _DataEscursione) = 2 AND (TIME(current_timestamp) > _OrarioInizioEscursione))
			THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Prenotazione non valida';
		
            END IF;
	END$$
