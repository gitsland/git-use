Select distinct address_id, address,district, postal_code from address
where Length (postal_code) > ANY(Select  Length (postal_code) from address)
And address.address Like '%Avenue';




