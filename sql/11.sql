/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM actor
WHERE actor_id IN (
	SELECT actor_id
	FROM film_actor
	JOIN (
		SELECT film_id, unnest(special_features) AS feature
		FROM film
	) AS film_table USING(film_id)
	WHERE film_table.feature = 'Behind the Scenes'
)
ORDER BY "Actor Name";
