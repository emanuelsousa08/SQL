SELECT matchid,player FROM goal 
WHERE teamid LIKE 'GER'

SELECT id,stadium,team1,team2 FROM game
WHERE id = 1012

SELECT player,teamid,stadium,mdate
FROM game JOIN goal ON (id=matchid) WHERE teamid LIKE 'GER'

SELECT team1,team2,player FROM game JOIN goal ON(id=matchid)
WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime FROM goal JOIN eteam ON(teamid=id)
WHERE gtime<=10

SELECT mdate, teamname FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach LIKE 'Fernando Santos'

SELECT player FROM goal JOIN game ON(goal.matchid = game.id)
WHERE game.stadium = 'National Stadium, Warsaw'

SELECT DISTINCT player FROM goal JOIN game ON(goal.matchid = game.id)
WHERE teamid != 'GER' AND (team1 = 'GER' OR team2 = 'GER')

SELECT teamname, COUNT(*) FROM eteam JOIN goal ON id=teamid 
GROUP BY teamname

SELECT stadium, COUNT(matchid) FROM game JOIN goal ON id=matchid
GROUP BY stadium

SELECT id,mdate, COUNT(matchid) FROM game JOIN goal ON id = matchid
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY id,mdate,team1,team2

SELECT id,mdate, COUNT(matchid) FROM game JOIN goal ON id=matchid
WHERE teamid='GER'
GROUP BY id,mdate,team1,team2

SELECT mdate,team1,SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END),team2,SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END)
FROM game LEFT JOIN goal ON id = matchid
GROUP BY mdate,id,team1,team2
ORDER BY mdate,id,team1,team2
