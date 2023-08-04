--how much payment was recieved by which staff in which month
SELECT st.staff_id, EXTRACT(MONTH FROM p.payment_date) AS month, SUM(p.amount) AS total_payment
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN rental r ON r.rental_id = p.rental_id
JOIN staff st ON r.staff_id = st.staff_id
GROUP BY st.staff_id, EXTRACT(MONTH FROM p.payment_date)
ORDER BY total_payment DESC;
