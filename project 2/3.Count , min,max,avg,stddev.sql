SELECT  count( customer_id) as NumberOfCustomers, Avg (amount) as Average_payment, Min (amount) as MIn_payment, Max (amount) as Max_payment, Stddev  (amount) as Standerd_dev_payment
from payment
group by customer_id
Order by NumberOfCustomers Asc
;
