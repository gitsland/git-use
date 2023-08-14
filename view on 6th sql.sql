create or replace view films_in_inventory as
select f.film_id, f.title, f.description, i.inventory_id from film f
inner join inventory i on i.film_id = f.film_id;

select * from films_in_inventory;

Drop view films_in_inventory;
create or replace view films_in_inventory as
select distinct f.film_id, f.title, f.description from film f
inner join inventory i on i.film_id = f.film_id;

select * from films_in_inventory
order by title;

select * from film;


--Rank
SELECT
  film_id,
  title,
  rental_rate,
  RANK() OVER (ORDER BY rental_rate DESC) AS rank
FROM
  film;

SELECT
  film_id,
  title,
  length,
  RANK() OVER (ORDER BY length DESC) AS length_rank
FROM
  film;


-------
  SELECT
  film_id,
  title,
  length,
  Desc_RANK() OVER (ORDER BY length DESC) AS length_rank
FROM
  film;
  --------------
  --didnt work
  CREATE OR REPLACE VIEW movies_rental_count AS 
SELECT
  f.title AS movie_title,
  COUNT(r.rental_id) AS rental_count
FROM
  film f
JOIN
  inventory i ON f.film_id = i.film_id
JOIN
  rental r ON i.inventory_id = r.inventory_id
GROUP BY
  f.title
ORDER BY COUNT(r.rental_id) DESC;

 
 
 SELECT
  movie_title,
  rental_count,
  DENSE_RANK() OVER (ORDER BY rental_count DESC) AS rank
FROM
  movies_rental_count;

  
 
 
 
 
 SELECT
  customer_id,
  rental_id,
  rental_date,
  LAG(rental_date) OVER (PARTITION BY customer_id ORDER BY rental_date) AS previous_rental_date,
  rental_date - LAG(rental_date) OVER (PARTITION BY customer_id ORDER BY rental_date) AS rental_time_diff
FROM rental
ORDER BY
  customer_id, rental_date;

  
  
  SELECT
  p.customer_id,
  r.rental_id,
  r.rental_date, p.amount,
  SUM(p.amount) OVER my_window AS cumulative_revenue,
  AVG(p.amount) OVER my_window AS average_revenue,
  MAX(p.amount) OVER my_window AS max_payment
FROM
  payment p
JOIN rental r ON p.rental_id = r.rental_id
WINDOW
  my_window AS (PARTITION BY p.customer_id ORDER BY r.rental_date)
ORDER BY
  customer_id, rental_date;

--https://ubiq.co/database-blog/create-pivot-table-postgresql/




WITH RECURSIVE countUp AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n+1 FROM countUp WHERE n < 10
)
SELECT * FROM countUp;


--https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-recursive-query/