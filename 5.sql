/* Tutorial */
/* 1 */
SELECT SUM(population)
FROM world

/* 2 */
SELECT DISTINCT continent
FROM world

/* 3 */
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'

/* 4 */
SELECT count(name)
FROM world
WHERE area >= 1000000

/* 5 */
SELECT SUM(population)
FROM world
WHERE name IN('Estonia','Latvia','Lithuania')

/* 6 */
SELECT continent, COUNT(name)
  FROM world
 GROUP BY continent

/* 7 */
SELECT continent, COUNT(name)
  FROM world
 WHERE population >= 10000000
 GROUP BY continent

/* Quiz
# 1 - answer 3
# 2 - answer 1
# 3 - answer 4
# 4 - answer 2
# 5 - answer 2
# 6 - answer 5
# 7 - answer 4
# 8 - answer D */
