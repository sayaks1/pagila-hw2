/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
SELECT DISTINCT title
FROM ( 
	SELECT film_id, title, unnest(special_features) AS features
	FROM film
	WHERE rating = 'G'
) AS g_movies 
WHERE features = 'Trailers'
ORDER BY title;
