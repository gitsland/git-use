SELECT  cy.country, COUNT(cy.country_id) AS country_count,  SUM(p.amount) AS total_payment,
		r.rental_id , r.inventory_id, r.return_date, r.customer_id
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
join country cy on ct.country_id = cy.country_id
join rental r on r.customer_id = c.customer_id
GROUP BY cy.country, r.rental_id , r.inventory_id, r.return_date, r.customer_id

order by cy.country Desc;
