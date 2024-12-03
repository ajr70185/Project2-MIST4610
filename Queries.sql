use cs_ajr70185;

# Query 1
CREATE VIEW AverageGenreRating AS
SELECT Genre.genreName, AVG(Rating.score) AS average_rating
FROM Movie
JOIN Genre ON Movie.idGenre = Genre.idGenre
JOIN Rating ON Movie.idMovie = Rating.idMovie
GROUP BY Genre.genreName;

select * from AverageGenreRating;

# Query 2
CREATE PROCEDURE ActorsCollaborations(
	IN firstName VARCHAR(45),
    IN lastName VARCHAR(45))
SELECT concat(Actor1.firstName, " ", Actor1.lastName) as 'actor 1 name', 
	   concat(Actor2.firstName, " ", Actor2.lastName) as 'actor 2 name', 
       Actor_Collaboration.movieCount as 'total movies together'
FROM Actor Actor1
JOIN Actor_Collaboration ON Actor1.idActor = Actor_Collaboration.idActor1
JOIN Actor Actor2 ON Actor2.idActor = Actor_Collaboration.idActor2
WHERE Actor1.firstName = firstName AND Actor1.lastName = lastName
OR Actor2.firstName = firstName AND Actor2.lastName = lastName;

CALL ActorsCollaborations('Leonardo', 'DiCaprio');

# Query 3
CREATE PROCEDURE GetMoviesByGenreAndYear(
	IN genreName VARCHAR(45),
	IN startYear INT, 
	IN endYear INT)
SELECT movieName, releaseDate
FROM Movie
JOIN Genre ON Movie.idGenre = Genre.idGenre
WHERE Genre.genreName = genreName
AND YEAR(releaseDate) BETWEEN startYear AND endYear
ORDER BY releaseDate;

CALL GetMoviesByGenreAndYear('Action', 1990, 2020);

# Query 4 - which movies are on which streaming platform
CREATE PROCEDURE StreamingPlatform (IN movieName VARCHAR(45))
SELECT Movie.movieName, Streaming_Platform.platformName
FROM Movie, Streaming_Platform, Movie_Platform
WHERE Movie_Platform.idMovie = Movie.idMovie
AND Movie_Platform.idStreamingPlatform = Streaming_Platform.idStreamingPlatform
AND Movie.movieName = movieName;

CALL StreamingPlatform("The Matrix");

# Query 5 - procedure where after inputting an actor's name it tells you who their mentor is
CREATE PROCEDURE ActorMentor (
	IN firstName VARCHAR(45),
    IN lastName VARCHAR(45))
SELECT concat(actor.firstName, " ", actor.lastName) as 'actor name', 
	   concat(mentor.firstName, " ", mentor.lastName) as 'mentor name'
FROM Actor actor, Actor mentor
WHERE actor.idMentor = mentor.idActor
AND actor.firstName = firstName AND actor.lastName = lastName;

CALL ActorMentor("Natalie", "Portman");
    