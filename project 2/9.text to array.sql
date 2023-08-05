Select f.film_id, f.title, f.description, f.special_features,l.language_id,l.name

from film f

Join language l on l.language_id = f.language_id

;