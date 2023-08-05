--actors for film and replacement cost for rental
select  f.title, a.first_name, a.last_name, a.actor_id
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
group by a.actor_id, a.first_name, a.last_name,f.title
Having sum(replacement_cost) > 10

;
