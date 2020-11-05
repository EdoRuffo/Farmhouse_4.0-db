WITH RecStanze AS(
	SELECT PS.NumeroStanza, SUM(IF(RS.Valutazione = 0,60,IF(RS.Valutazione = 1, 30,10))) AS Peso
    FROM RecensioniSoggiorno RS
		INNER JOIN Prenotazione P ON P.CodPrenotazione = RS.CodPrenotazione
        INNER JOIN PrenotazioneStanze PS ON PS.CodPrenotazione = RS.CodPrenotazione
	WHERE RS.Valutazione < 3
    GROUP BY PS.NumeroStanza
)
SELECT *, RANK() OVER(ORDER BY RS.Peso DESC) AS RankingStanze
FROM RecStanze RS;
