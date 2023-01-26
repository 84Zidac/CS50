SELECT movies.title FROM movies, stars, people, ratings where movies.id = stars.movie_id AND stars.person_id = people.id AND movies.id = ratings.movie_id AND people.name = "Chadwick Boseman" ORDER BY ratings.rating DESC LIMIT 5;