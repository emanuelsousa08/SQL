SELECT name FROM world 
WHERE population > (SELECT population FROM world WHERE name='Russia')

SELECT name FROM world 
WHERE continent = 'Europe' AND (gdp/population) > (SELECT (gdp/population) FROM world WHERE name = 'United Kingdom')

SELECT name,continent FROM world
WHERE continent IN(SELECT continent FROM world WHERE name IN('Argentina', 'Australia')) ORDER BY name ASC

SELECT name, population FROM world  
WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom') AND population < (SELECT population FROM world WHERE name = 'Germany')

SELECT name,CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany')), '%') AS percentage FROM world
WHERE continent = 'Europe'

SELECT name FROM world WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe')

SELECT continent, name, area FROM world w1 
WHERE area >= ALL(SELECT area FROM world w2 WHERE w1.continent=w2.continent AND population>0)

SELECT continent, name FROM world w1
WHERE name <= ALL(SELECT name FROM world w2 WHERE w1.continent = w2.continent)

SELECT name, continent, population FROM world w1
WHERE continent = ALL(SELECT continent FROM world w2 WHERE population <= 25000000)

SELECT name, continent FROM world w1  
WHERE NOT EXISTS (  
    SELECT * FROM world w2  
    WHERE w1.continent = w2.continent  
      AND w1.name != w2.name  
      AND w1.population <= 3 * w2.population)
