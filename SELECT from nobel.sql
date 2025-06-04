SELECT yr, subject, winner FROM nobel
 WHERE yr = 1950

SELECT winner FROM nobel
 WHERE yr = 1962 AND subject = 'literature'

SELECT yr, subject FROM nobel
WHERE winner LIKE 'Albert Einstein'

SELECT winner FROM nobel
WHERE subject LIKE 'peace' AND yr >= 2000

SELECT * FROM nobel
WHERE subject = 'literature' AND yr BETWEEN 1980 AND 1989

SELECT * FROM nobel
 WHERE winner IN('Theodore Roosevelt', 'Thomas Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

SELECT winner FROM nobel WHERE winner LIKE 'John%'

SELECT yr, subject, winner FROM nobel
WHERE (subject = 'physics' AND yr = 1980) OR (subject = 'chemistry' AND yr = 1984)

SELECT yr, subject, winner FROM nobel  
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')
