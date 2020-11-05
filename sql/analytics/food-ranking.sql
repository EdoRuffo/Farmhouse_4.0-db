
	SELECT P.CodMangiatoia, P.Fibre, P.Proteine, P.Glucidi, 
		RANK() OVER(PARTITION BY P.CodMangiatoia ORDER BY SM.ForaggioResiduo) AS Ranking
    FROM Pasto P 
		INNER JOIN Mangiatoia M ON P.CodMangiatoia = M.Codice
		INNER JOIN StatoMangiatoia SM ON M.Codice = SM.CodMangiatoia
	WHERE P.TimeStamp + INTERVAL 6 HOUR = SM.TimeStamp	/*Consideriamo il residuo rilevato nell'ultimo controllo successivo a un pasto */
    ;