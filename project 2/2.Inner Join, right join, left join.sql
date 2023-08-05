-- Which Country has 0 customer for DVD rental
 
select c.customer_id,a.address_id, CityWithCountry.country
from address a

inner join customer c on c.address_id = a.address_id
right join 
(
			select ct.city_id, ct.city, cy.country_id, cy.country
		    from city ct
		    left join country cy on ct.country_id = cy.country_id
) As CityWithCountry

 on CityWithCountry.city_id = a.city_id
 where customer_id is null
 Group by CityWithCountry.country,c.customer_id, a.address_id
 ;



