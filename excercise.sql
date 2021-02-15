SELECT populatiON FROM wORld
  WHERE name = 'Germany'

SELECT name, populatiON FROM wORld
  WHERE name IN ('Sweden', 'NORway', 'Denmark')

SELECT name, area FROM wORld
  WHERE area BETWEEN 200000 AND 250000

SELECT name FROM wORld
  WHERE name LIKE 'Y%'

SELECT name FROM wORld
  WHERE name LIKE '%y'

SELECT name FROM wORld
  WHERE name LIKE '%x%'

SELECT name FROM wORld
  WHERE name LIKE '%lAND'

SELECT name FROM wORld
  WHERE name LIKE 'C%ia'

SELECT name FROM wORld
  WHERE name LIKE '%oo%'

SELECT name FROM wORld
  WHERE name LIKE '%a%a%a%'

SELECT name FROM wORld
 WHERE name LIKE '_t%'
ORDER BY name

SELECT name FROM wORld
 WHERE name LIKE '%o__o%'

SELECT name FROM wORld
 WHERE name LIKE '____'

SELECT name
  FROM wORld
 WHERE name LIKE capital

SELECT name
  FROM wORld
 WHERE capital LIKE cONcat(name,' city')

SELECT capital, name
FROM wORld
WHERE capital LIKE cONcat(name,'%')

SELECT capital, name
FROM wORld
WHERE capital LIKE cONcat(name,'_%')

SELECT name, replace(capital, name, '')
FROM wORld
WHERE capital LIKE cONcat(name,'_%')

SELECT name, cONtinent, populatiON FROM wORld

SELECT name FROM wORld
WHERE populatiON >= 200000000

SELECT name, (gdp / populatiON) AS per_capita_gdp FROM wORld
WHERE populatiON >= 200000000

SELECT name, (populatiON / 1000000) populatiON_in_milliONs
FROM wORld
WHERE cONtinent = 'South America'

SELECT name, populatiON
FROM wORld
WHERE name in('France', 'Germany', 'Italy')

SELECT name
FROM wORld
WHERE name LIKE '%United%'

SELECT name, populatiON, area
FROM wORld
WHERE area >= 3000000
OR populatiON >= 250000000

SELECT name, populatiON, area
FROM wORld
WHERE area >= 3000000
xOR populatiON >= 250000000

SELECT name, round(populatiON/1000000, 2), round(gdp/1000000000, 2)
FROM wORld
WHERE cONtinent= 'South America'

SELECT name, round(gdp / populatiON, -3)
FROM wORld
WHERE gdp >= 1000000000000

SELECT name, capital
  FROM wORld
 WHERE LENGTH(name) = LENGTH(capital)

SELECT name, capital
FROM wORld
WHERE LEFT(name, 1) = LEFT(capital, 1)
AND name != capital

SELECT name
   FROM wORld
WHERE name not LIKE '% %'
AND name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

SELECT winner
FROM nobel
WHERE subject = 'Peace'
AND yr >= 2000

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature'
AND yr between 1980 AND 1989

SELECT * FROM nobel
 WHERE winner IN ('TheodORe Roosevelt', 'Woodrow WilsON', 'Jimmy Carter', 'Barack Obama')

SELECT winner FROM nobel
WHERE winner LIKE 'John %'

SELECT yr, subject, winner FROM nobel
WHERE (yr = 1980 AND subject = 'Physics')
OR (yr = 1984 AND subject = 'Chemistry')

SELECT yr, subject, winner FROM nobel
WHERE yr = 1980
AND subject not in ('Chemistry', 'Medicine')

SELECT yr, subject, winner FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910)
OR (subject = 'Literature' AND yr >= 2004)

SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'

SELECT * FROM nobel
WHERE winner = "EUGENE O\'NEILL"

SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr desc,winner

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner

SELECT name FROM wORld
  WHERE populatiON >
     (SELECT populatiON FROM wORld
      WHERE name='Russia')

SELECT name
FROM wORld
WHERE cONtinent = 'Europe' AND
gdp/populatiON > ( select gdp/populatiON FROM wORld WHERE name = 'United Kingdom' )

SELECT name, cONtinent FROM wORld
WHERE cONtinent = (SELECT cONtinent FROM wORld WHERE name = 'Argentina')
OR cONtinent = (SELECT cONtinent FROM wORld WHERE name = 'Australia')
ORDER BY name

SELECT name, populatiON FROM wORld
WHERE populatiON > (SELECT populatiON FROM wORld WHERE name = 'Canada')
AND populatiON < (SELECT populatiON FROM wORld WHERE name = 'PolONia')

SELECT name, 
cONcat(round(100*populatiON/(select populatiON FROM wORld WHERE name = 'Germany')),'%')
FROM wORld
WHERE cONtinent = 'Europe'

SELECT name FROM wORld 
WHERE gdp > (select max(gdp) FROM wORld WHERE cONtinent = 'Europe')

SELECT cONtinent, name, area FROM wORld x
  WHERE area >= ALL
    (SELECT area FROM wORld y
        WHERE y.cONtinent=x.cONtinent
          AND area>0)

SELECT cONtinent, min(name) AS name FROM wORld
GROUP BY cONtinent
ORDER BY cONtinent

SELECT cONtinent, sum(populatiON) AS pop FROM wORld a
GROUP BY cONtinent

SELECT SUM(populatiON)
FROM wORld

SELECT cONtinent FROM wORld
GROUP BY cONtinent

SELECT sum(gdp) FROM wORld
WHERE cONtinent = 'Africa'

SELECT count(name) FROM wORld
WHERE area >= 1000000

SELECT sum(populatiON) FROM wORld
WHERE name in('EstONia', 'Latvia', 'Lithuania')

SELECT cONtinent, count(name) FROM wORld
GROUP BY cONtinent

SELECT cONtinent, count(name) FROM wORld
WHERE populatiON >= 10000000
GROUP BY cONtinent

SELECT cONtinent FROM wORld a
WHERE 
(SELECT sum(populatiON) FROM wORld WHERE cONtinent = a.cONtinent GROUP BY cONtinent) >= 100000000
GROUP BY cONtinent

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE goal.teamid = 'GER'

SELECT team1, team2, player FROM game
JOIN goal ON id=matchid
WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid=id
 WHERE gtime<=10

SELECT mdate, teamname FROM game
JOIN eteam ON team1=eteam.id
WHERE coach = 'FernANDo Santos'

SELECT player FROM goal
JOIN game ON matchid=id
WHERE stadium = 'NatiONal Stadium, Warsaw'

SELECT distinct(player)
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER')
AND teamid != 'GER'

SELECT teamname, count(gtime)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
 ORDER BY teamname

select stadium, count(gtime) FROM game
JOIN goal ON id=matchid
GROUP BY stadium

SELECT matchid,mdate, count(gtime)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

SELECT matchid,mdate, count(gtime)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'GER' OR team2 = 'GER')
AND teamid = 'GER'
GROUP BY matchid, mdate

SELECT id,mdate,
  team1,
  CASE WHEN teamid=team1 THEN 
  (SELECT count(gtime) FROM goal WHERE teamid = team1 AND matchid = id) ELSE 0
  END scORe1,
  team2,
  CASE when teamid=team2 then 
  (SELECT count(gtime) FROM goal WHERE teamid = team2 AND matchid = id) ELSE 0
  end scORe2
  FROM game x JOIN goal ON matchid = id
GROUP BY id, mdate, team1, teamid, team2
ORDER BY mdate

SELECT id, title
 FROM movie
 WHERE yr=1962

SELECT yr FROM movie
WHERE title = 'Citizen Kane'

SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

SELECT id FROM actOR
WHERE name = 'Glenn Close'

SELECT id FROM movie
WHERE title = 'CASablanca'

SELECT name FROM movie a
JOIN cASting b ON a.id=b.movieid
JOIN actOR c ON b.actORid=c.id
WHERE a.id=11768

SELECT name FROM movie a
JOIN cASting b ON a.id=b.movieid
JOIN actOR c ON b.actORid=c.id
WHERE a.title = 'Alien'

SELECT title FROM movie a
JOIN cASting b ON a.id=b.movieid
JOIN actOR c ON b.actORid=c.id
WHERE c.name = 'HarrisON FORd'

SELECT title FROM movie a
JOIN cASting b ON a.id=b.movieid
JOIN actOR c ON b.actORid=c.id
WHERE c.name = 'HarrisON FORd'
AND b.ORd !=1

SELECT a.title, c.name FROM movie a
JOIN cASting b ON a.id=b.movieid
JOIN actOR c ON b.actORid=c.id
WHERE b.ORd = 1

SELECT yr,COUNT(title) FROM
  movie JOIN cASting ON movie.id=movieid
        JOIN actOR   ON actORid=actOR.id
WHERE name='Rock HudsON'
GROUP BY yr
HAVING COUNT(title) > 2

SELECT name FROM teacher
WHERE dept is null

SELECT teacher.name, dept.name
 FROM teacher JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher

SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE questiON='Q01'
   AND institutiON='Edinburgh Napier University'
   AND subject='(8) Computer Science'

SELECT institutiON, subject
  FROM nss
 WHERE questiON='Q15'
   AND scORe>=100

SELECT institutiON,scORe
  FROM nss
 WHERE questiON='Q15'
   AND scORe<50
   AND subject='(8) Computer Science'

SELECT subject, sum(respONse)
  FROM nss
 WHERE questiON='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts AND Design')
GROUP BY subject

SELECT subject, sum(respONse*A_STRONGLY_AGREE*.01) 
  FROM nss
 WHERE questiON='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts AND Design')
GROUP BY subject

SELECT subject, round(sum(respONse*A_STRONGLY_AGREE/100)/sum(respONse)*100,0)
  FROM nss
 WHERE questiON='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts AND Design')
GROUP BY subject

SELECT institutiON, ROUND(SUM(respONse*scORe/100)/SUM(respONse)*100,0)
  FROM nss
 WHERE questiON='Q22'
   AND (institutiON LIKE '%Manchester%')
GROUP BY institutiON
ORDER BY institutiON

SELECT institutiON, sum(sample),
(SELECT sample FROM nss y
WHERE subject='(8) Computer Science'
AND x.institutiON = y.institutiON
AND questiON='Q01')
  FROM nss x
 WHERE questiON='Q01'
   AND (institutiON LIKE '%Manchester%')
GROUP BY institutiON

SELECT lAStName, party, votes
  FROM ge
 WHERE cONstituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC

SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) AS posn
  FROM ge
 WHERE cONstituency = 'S14000024' AND yr = 2017
ORDER BY party

SELECT yr,party, votes,
      RANK() OVER (PARTITION BY yr ORDER BY votes DESC) AS posn
  FROM ge
 WHERE cONstituency = 'S14000021'
ORDER BY party,yr

SELECT cONstituency, party
FROM ge x 
WHERE cONstituency BETWEEN 'S14000021' AND 'S14000026'
AND yr  = 2017 AND votes >= ALL(SELECT votes FROM ge y  WHERE x.cONstituency = y. cONstituency AND y.yr = 2017)
ORDER BY cONstituency,votes DESC

SELECT party , COUNT(*)
FROM ge x 
WHERE cONstituency LIKE 'S%'
AND yr  = 2017 AND votes >= ALL(SELECT votes FROM ge y  WHERE x.cONstituency = y. cONstituency AND y.yr = 2017)
GROUP BY party

SELECT count(id) FROM stops

SELECT id FROM stops WHERE name = 'Craiglockhart'

SELECT id, name FROM stops, route
WHERE id=stop
AND company='LRT'
AND num='4'