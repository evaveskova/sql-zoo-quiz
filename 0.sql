/* Tutorial */
/* 1 */
SELECT population
  FROM world
 WHERE name = 'Germany'

/* 2 */
SELECT name, population
  FROM world
 WHERE name IN ('Sweden', 'Norway', 'Denmark');

/* 3 */
SELECT name, area
  FROM world
 WHERE area BETWEEN 200000 AND 250000

/* Quiz
# 1 - answer 3
# 2 - answer E
# 3 - answer 5
# 4 - answer 3
# 5 - answer 3
# 6 - answer 3
# 7 - answer 3 */
