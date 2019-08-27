/* Tutorial */
/* 1 */
SELECT COUNT(*)
  FROM stops

/* 2 */
SELECT id
  FROM stops
 WHERE name = 'Craiglockhart'

/* 3 */
SELECT id, name
  FROM stops
  JOIN route ON route.stop = stops.id
 WHERE num = 4
   AND company = 'LRT'
 ORDER BY pos

/* 4 */
SELECT company, num, COUNT(*) AS count
  FROM route WHERE stop=149 OR stop=53
 GROUP BY company, num
HAVING count = 2

/* 5 */
SELECT a.company, a.num, a.stop, b.stop
  FROM route a JOIN route b ON
      (a.company=b.company AND a.num=b.num)
 WHERE a.stop=53
   AND b.stop=149

/* 6 */
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON
      (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Craiglockhart'
   AND stopb.name='London Road'

/* 7 */
SELECT a.company, a.num
  FROM route a JOIN route b ON
      (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.id='115'
   AND stopb.id='137'
 GROUP BY company, num

/* 8 */
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
  AND stopb.name='Tollcross'
GROUP BY company, num

/* 9 */
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'

/* 10 */
SELECT first.num, first.company, first.name, second.num, second.company
FROM
  (SELECT stops.name, a.num, a.company FROM route a
     JOIN route b ON (a.num=b.num AND a.company=b.company)
     JOIN stops ON (stops.id=a.stop)
    WHERE b.stop = (SELECT id FROM stops
                    WHERE name = 'Craiglockhart')) AS first
  JOIN
  (SELECT stops.name, a.num, a.company FROM route a
     JOIN route b ON (a.num=b.num AND a.company=b.company)
     JOIN stops ON (stops.id=a.stop)
    WHERE b.stop = (SELECT id FROM stops
                    WHERE name = 'Lochend')) AS second
WHERE first.name=second.name

/* Quiz
# 1 - answer 3
# 2 - answer 5
# 3 - answer 4 */
