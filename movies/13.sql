SELECT DISTINCT people.name
FROM movies
JOIN stars ON movies.id = stars.movie_id
JOIN stars stars2 ON movies.id = stars2.movie_id
JOIN people ON stars.person_id = people.id
JOIN people people2 ON stars2.person_id = people2.id
WHERE people2.name = 'Kevin Bacon' AND people2.birth = 1958 AND people.name != 'Kevin Bacon'
