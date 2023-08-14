SELECT
  f.film_id,ac.actor_id,ac.first_name,
  f.title,
  f.rental_rate,count (ac.actor_id) as actor_count,
  RANK() OVER (ORDER BY f.rental_rate DESC) AS rank 
FROM
  film f
  Join film_actor fa on f.film_id = fa.film_id
  Join actor ac on ac.actor_id = fa.actor_id
  
  group by f.film_id,ac.actor_id,ac.first_name,
  f.title,
  f.rental_rate
  ;