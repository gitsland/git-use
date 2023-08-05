WITH short_film AS (
	SELECT*FROM film
	LIMIT 20	   	   )
select rating, STRING_AGG(description, '   WONDERFUL  ')
FROM short_film
GROUP BY rating;

