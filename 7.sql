/* Tutorial */
/* 1 */
SELECT id, title
  FROM movie
 WHERE yr=1962

/* 2 */
SELECT yr
  FROM movie
 WHERE title='Citizen Kane'

/* 3 */
SELECT id, title, yr
  FROM movie
 WHERE title LIKE '%Star Trek%'
 ORDER BY yr

/* 4 */
SELECT id
  FROM actor
 WHERE name = 'Glenn Close'

/* 5 */
SELECT id
  FROM movie
 WHERE title = 'Casablanca'

/* 6 */
SELECT name
  FROM actor JOIN casting ON (actor.id = casting.actorid)
 WHERE movieid = 11768

/* 7 */
SELECT actor.name
  FROM casting JOIN actor ON (casting.actorid = actor.id)
 WHERE movieid = (SELECT id
                    FROM movie
                   WHERE title = 'Alien')

/* 8 */
SELECT title
  FROM movie JOIN casting ON (movie.id = movieid)
 WHERE actorid = (SELECT id
                    FROM actor
                   WHERE name = 'Harrison Ford')

/* 9 */
SELECT title
  FROM movie JOIN casting ON (movie.id = movieid)
 WHERE actorid = (SELECT id
                FROM actor
                WHERE name = 'Harrison Ford')
   AND ord != 1

/* 10 */
SELECT title, name
  FROM movie
  JOIN casting ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
 WHERE yr = 1962
   AND ord = 1

/* 11 */
SELECT yr,COUNT(title)
  FROM movie
  JOIN casting ON movie.id=movieid
  JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr
HAVING COUNT(title)=
            (SELECT MAX(c) FROM
                        (SELECT yr,COUNT(title) AS c FROM
                     movie JOIN casting ON movie.id=movieid
                           JOIN actor   ON actorid=actor.id
                          where name='John Travolta'
                          GROUP BY yr) AS t
            )

/* 12 */
SELECT title, name FROM casting
  JOIN movie ON movieid = movie.id
  JOIN actor ON actorid = actor.id
 WHERE ord = 1
   AND movieid IN (
     SELECT movieid FROM casting
      WHERE actorid IN (
          SELECT id FROM actor
           WHERE name='Julie Andrews')
     )

/* 13 */
SELECT name FROM actor
 WHERE actor.id IN(SELECT actorid FROM casting
                    WHERE ord=1
                    GROUP BY actorid
                   HAVING COUNT(actorid) >= 30)
                   
/* 14 */
SELECT title, COUNT(actorid) FROM movie
  JOIN casting ON movieid = movie.id
 WHERE yr=1978
 GROUP BY title
 ORDER BY COUNT(actorid) DESC, title

/* 15 */
SELECT name FROM actor
  JOIN casting ON actorid = actor.id
 WHERE movieid IN (SELECT movie.id FROM movie
                     JOIN casting ON movieid = movie.id
                     JOIN actor ON actorid = actor.id
                    WHERE name = 'Art Garfunkel')
   AND name != 'Art Garfunkel'

/* Quiz */
#1 3
#2 5
#3 3
#4 2
#5 4
#6 3
#7 2
