--Shows Address table with City and Country information
with CityWithCountry as (
			select ct.city_id, ct.city, cy.country_id, cy.country
		    from city ct
		    left join country cy on ct.country_id = cy.country_id
) 

select * from address 
natural join CityWithCountry;
