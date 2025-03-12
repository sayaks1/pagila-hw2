/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT title
FROM (
	SELECT title
	FROM (
		SELECT title, unnest(special_features) AS feature	
		FROM film
	) AS film_features
	WHERE feature = 'Behind the Scenes'
) AS behind_films
JOIN (
	SELECT title
        FROM (
                SELECT title, unnest(special_features) AS feature
                FROM film
        ) AS film_features
        WHERE feature = 'Trailers'
) AS trailer_films USING(title)
ORDER BY title;
