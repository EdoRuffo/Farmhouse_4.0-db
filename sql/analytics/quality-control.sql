WITH DifferenzeProcessoProduttivo as(
SELECT P.CodProdotto, P.CodLotto, FL.nFase,
ABS(FL.Durata - FLI.Durata) as DiffDurata, ABS(FL.Temperatura - FLI.Temperatura) as DiffTemp, ABS(FL.TempoDiRiposo - FLI.TempoDiRiposo) as DiffTdR
FROM Prodotto P 
	INNER JOIN FasiLavorazione FL ON P.CodProdotto = FL.CodProdotto
	INNER JOIN FasiLavorazioneIdeale FLI on FL.nFase = FLI.nFase and p.tipoFormaggio = FLI.NomeFormaggio
),
Coefficienti as(
SELECT DPP.CodLotto, SUM(DPP.DiffDurata)*3 + SUM(DPP.DiffTdR)+ SUM(DPP.DiffTemp)*5 AS Theta
FROM DifferenzeProcessoProduttivo DPP
GROUP BY DPP.CodLotto
)

SELECT CodLotto, Theta, 
IF(Theta < 200, 'Eccellente', IF(Theta < 250, 'Ottimo', IF(Theta < 300, 'Buono', IF(Theta < 350, 'Discreto', 'DaScartare')))) as Giudizio
FROM Coefficienti
ORDER BY CodLotto;