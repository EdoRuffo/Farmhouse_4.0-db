CREATE TEMPORARY TABLE IF NOT EXISTS TabellaConclusiva(
	CodProdotto INT NOT NULL,
    Valutazione INT,
    CodCantina INT,
    CodMagazzino INT,
    CodSilos INT,
    GiudizioProcProd CHAR(100),
    DiffDurata DOUBLE,
    DiffTemp DOUBLE, 
    DiffTdR DOUBLE,
    Peso DOUBLE,
    PRIMARY KEY(CodProdotto));

TRUNCATE TABLE TabellaConclusiva;

INSERT INTO TabellaConclusiva
	WITH ProdottiCantina as(
		SELECT P.CodProdotto, SC.CodCantina
		FROM Prodotto P 
			INNER JOIN ScaffalaturaCantina SC ON P.CodProdotto = SC.CodProdotto
	), 
	ProdottiMagazzino as(
		SELECT P.CodProdotto, SM.CodMagazzino
		FROM Prodotto P 
			INNER JOIN ScaffalaturaMagazzino SM ON SM.CodProdotto = P.CodProdotto
	),
	ProdottiSilos as(
		SELECT P.CodProdotto, PL.CodSilos
		FROM Prodotto P 
			INNER JOIN PrelievoLatte PL ON PL.CodLotto = P.CodLotto
	),

	/*Controllo Qualita Processo PER PRODOTTO*/
	DifferenzeProcessoProduttivo as(
		SELECT P.CodProdotto, P.CodLotto, FL.nFase,
		ABS(FL.Durata - FLI.Durata) as DiffDurata, ABS(FL.Temperatura - FLI.Temperatura) as DiffTemp, ABS(FL.TempoDiRiposo - FLI.TempoDiRiposo) as DiffTdR
		FROM Prodotto P natural join FasiLavorazione FL
			Inner join FasiLavorazioneIdeale FLI on FL.nFase = FLI.nFase and p.tipoFormaggio = FLI.NomeFormaggio
	),
	Coefficienti as(
		SELECT DPP.CodProdotto, SUM(DPP.DiffDurata)*3 + SUM(DPP.DiffTdR)+ SUM(DPP.DiffTemp)*5 AS Theta
		FROM DifferenzeProcessoProduttivo DPP
		GROUP BY DPP.CodProdotto
	),
	ControlloQualitaProcesso as(
		SELECT CodProdotto, Theta, 
		IF(Theta < 200, 'Eccellente', IF(Theta < 250, 'Ottimo', IF(Theta < 300, 'Buono', IF(Theta < 350, 'Discreto', 'DaScartare')))) as Giudizio
		FROM Coefficienti
	)
	/*FINE ControlloQualitaProcesso PER PRODOTTO*/

	SELECT RP.CodProdotto, RP.Valutazione, 
		PC.CodCantina, PM.CodMagazzino, PS.CodSilos, 
		CQP.Giudizio as GiudizioProcProd, AVG(DPP.DiffDurata), AVG(DPP.DiffTemp), AVG(DPP.DiffTdR), (IF(RP.Valutazione = 0,60,IF(RP.Valutazione = 1, 30,10))) AS Peso
	FROM RecensioniProdotti RP
		LEFT OUTER JOIN ProdottiCantina PC ON PC.CodProdotto = RP.CodProdotto
		LEFT OUTER JOIN ProdottiMagazzino PM ON PM.CodProdotto = RP.CodProdotto
		INNER JOIN ProdottiSilos PS ON PS.CodProdotto = RP.CodProdotto
		INNER JOIN ControlloQualitaProcesso CQP ON CQP.CodProdotto = RP.CodProdotto
		INNER JOIN DifferenzeProcessoProduttivo DPP ON DPP.CodProdotto = RP.CodProdotto
	WHERE RP.Valutazione < 3		/*Recensioni negative */
	GROUP BY RP.CodProdotto;
/*Fine Temporary Table*/
    
SELECT * FROM TabellaConclusiva;

WITH PesiTotaliCantina AS(
	SELECT*, SUM(TC.Peso) AS PesoTotale
    FROM TabellaConclusiva TC
    GROUP BY TC.CodCantina
)
SELECT PTC.CodCantina, PTC.PesoTotale, RANK() OVER(ORDER BY PTC.Peso DESC) AS RankingPesato
FROM PesiTotaliCantina PTC
WHERE PTC.CodCantina IS NOT NULL;

WITH PesiTotaliSilos AS(
	SELECT*, SUM(TC.Peso) AS PesoTotale
    FROM TabellaConclusiva TC
    GROUP BY TC.CodSilos
)
SELECT PTS.CodSilos, PTS.PesoTotale, RANK() OVER(ORDER BY PTS.Peso DESC) AS RankingPesato
FROM PesiTotaliSilos PTS;

WITH PesiTotaliMagazzini AS(
	SELECT*, SUM(TC.Peso) AS PesoTotale
    FROM TabellaConclusiva TC
    GROUP BY TC.CodMagazzino
)
SELECT PTM.CodMagazzino, PTM.PesoTotale, RANK() OVER(ORDER BY PTM.Peso DESC) AS RankingPesato
FROM PesiTotaliMagazzini PTM
WHERE PTM.CodMagazzino IS NOT NULL
;

