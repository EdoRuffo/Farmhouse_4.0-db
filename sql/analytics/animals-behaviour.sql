WITH DistanzaAnimali as(
SELECT g1.CodAnimale as CA1, g2.CodAnimale as CA2, g1.TimeStamp, 
	FLOOR( SQRT( (g1.x - g2.x)*(g1.x - g2.x) + (g1.y - g2.y)*(g1.y - g2.y))) as Distanza
FROM GPS g1
	INNER JOIN GPS g2 on g1.TimeStamp = g2.TimeStamp
where g1.codanimale != g2.codAnimale),

DistanzeMedie as(
	SELECT DISTINCT least(CA1, CA2) as Animale1, greatest(CA1, CA2) as Animale2, AVG(Distanza) 
		OVER (Partition by CA1, CA2) as DistanzaMedia
	FROM DistanzaAnimali)

SELECT *, RANK() OVER(ORDER BY DM.DistanzaMedia) as Ranking,
	IF(DM.DistanzaMedia <= 3, 'Ottimo', IF(DM.DistanzaMedia <= 5, 'Buono', IF(DM.DistanzaMedia <=7, 'Discreto', 'Indifferente'))) as Giudizio
FROM DistanzeMedie DM;