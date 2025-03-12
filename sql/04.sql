/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

SELECT film.title
FROM film
WHERE film_id IN (
	SELECT film.film_id
	FROM film
	JOIN inventory USING(film_id)
	JOIN rental USING(inventory_id)
	JOIN customer USING(customer_id)
	WHERE customer_id = 1
	GROUP BY film.film_id
	HAVING count(*) > 1
)
ORDER BY title;
