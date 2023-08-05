--window function to show rental duration for different films with description
SELECT    f.film_id,f.title, cg.name as category_name, f.description, rental_duration,
avg (rental_duration) over ()As Duration
FROM film f
JOIN film_category fcg ON f.film_id = fcg.film_id
JOIN category cg ON  cg.category_id= fcg.category_id
Order by rental_duration

;

