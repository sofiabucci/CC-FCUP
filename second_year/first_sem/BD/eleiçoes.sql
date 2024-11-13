1. 

SELECT f.CODIGO
FROM concelhos c, freguesias f
WHERE c.NOME='Porto' and f.NOME='Sé' and f.CONCELHO=c.CODIGO

//

SELECT f.CODIGO
FROM concelhos c join freguesias f on f.CONCELHO=c.CODIGO
WHERE c.NOME='Porto' and f.NOME='Sé' 


2.

SELECT *
FROM votacoes v
WHERE v.FREGUESIA = (1.)

3.

SELECT count(f.NOME)
FROM freguesias f
WHERE f.NOME like '%Vilar%' 

4.

SELECT *
FROM freguesias f join concelhos c on f.CONCELHO=c.CODIGO
WHERE c.NOME='Espinho'

5.

SELECT d.NOME, d.CODIGO
FROM distritos d join concelhos c join freguesias f on f.CONCELHO=c.CODIGO and c.DISTRITO=d.CODIGO
WHERE f.NOME='Sé' and c.NOME='Porto'

//

SELECT d.NOME, d.CODIGO
FROM distritos d 
WHERE d.CODIGO = (SELECT c.DISTRITO
                  FROM concelhos c join freguesias f on f.CONCELHO=c.CODIGO
                  WHERE c.NOME='Porto' and f.NOME='Sé' )

6.

SELECT l.MANDATOS, l.PARTIDO
FROM distritos d join listas l join partidos p on d.CODIGO=l.DISTRITO and l.PARTIDO=p.SIGLA
WHERE d.CODIGO = (SELECT c.DISTRITO
                  FROM concelhos c join freguesias f on f.CONCELHO=c.CODIGO
                  WHERE c.NOME='Porto' and f.NOME='Sé' )
ORDER BY l.MANDATOS desc

7.

SELECT d.NOME, p.VOTANTES, p.ABSTENCOES
FROM distritos d join participacoes p on d.CODIGO=p.DISTRITO
WHERE p.ABSTENCOES > 0.75*p.VOTANTES

8.

SELECT f.NOME, f.CODIGO
FROM votacoes v join distritos d join concelhos c join freguesias f on v.FREGUESIA=f.CODIGO and f.CONCELHO=c.CODIGO and c.DISTRITO=d.CODIGO
WHERE d.REGIAO = 'M' and v.PARTIDO='PSN' and v.VOTOS=0

9. 

SELECT p.SIGLA
from partidos p
except
SELECT l.PARTIDO
FROM listas l join distritos d on l.DISTRITO=d.CODIGO
WHERE d.NOME='Lisboa'

10.

SELECT sum(v.VOTOS), v.PARTIDO, c.NOME
FROM votacoes v join freguesias f join concelhos c on c.CODIGO=f.CONCELHO and f.CODIGO=v.FREGUESIA 
GROUP by c.NOME, v.PARTIDO

11.

SELECT sum(v.VOTOS), v.PARTIDO, d.NOME
FROM votacoes v join freguesias f join concelhos c join distritos d on d.CODIGO=c.DISTRITO and c.CODIGO=f.CONCELHO and f.CODIGO=v.FREGUESIA 
GROUP by d.NOME, v.PARTIDO

12.

SELECT sum(v.VOTOS), v.PARTIDO
FROM votacoes v join freguesias f join concelhos c join distritos d on d.CODIGO=c.DISTRITO and c.CODIGO=f.CONCELHO and f.CODIGO=v.FREGUESIA 
GROUP by v.PARTIDO

13. 

SELECT sum(v.VOTOS) as votos, v.PARTIDO
FROM votacoes v join freguesias f join concelhos c join distritos d on d.CODIGO=c.DISTRITO and c.CODIGO=f.CONCELHO and f.CODIGO=v.FREGUESIA 
GROUP by v.PARTIDO
ORDER by votos desc 
LIMIT 5

14. 

SELECT c.NOME as concelho, count(f.NOME) as freguesias
FROM freguesias f join concelhos c on f.CONCELHO=c.CODIGO
GROUP by c.NOME
ORDER by freguesias desc
LIMIT 1

SELECT d.NOME as distrito, count(c.NOME) as concelho
FROM distritos d join concelhos c on c.DISTRITO=d.CODIGO
GROUP by d.NOME
ORDER by concelho desc
LIMIT 1

15.

SELECT avg(fc) as média
FROM (SELECT count(f.NOME) as fc
    FROM freguesias f join concelhos c on f.CONCELHO = c.CODIGO
    GROUP BY c.CODIGO)

16.

WITH fc as (
    SELECT c.DISTRITO as distrito, c.CODIGO as concelho, c.NOME as concelhonome, count(f.NOME) as total
    FROM freguesias f join concelhos c on f.CONCELHO=c.CODIGO
    GROUP by concelho, distrito
    )
SELECT fc1.distrito, fc1.concelhonome, fc2.concelhonome, fc1.total
FROM fc as fc1 join fc as fc2 on fc1.distrito=fc2.distrito and fc1.total=fc2.total and fc1.concelho<fc2.concelho
ORDER by fc1.distrito, fc1.concelho

17.

SELECT c.NOME
FROM (
    SELECT d.CODIGO as distrito, p.VOTANTEs
    FROM distritos d join participacoes p on d.CODIGO=p.DISTRITO
    ORDER by p.VOTANTES desc
    LIMIT 1 
    ) as dv join concelhos c on c.DISTRITO=dv.distrito

18. 

SELECT p.SIGLA, f.NOME, v.VOTOS
FROM partidos p join freguesias f join votacoes v on f.CODIGO=v.FREGUESIA and v.PARTIDO=p.SIGLA
ORDER by v.VOTOS desc
LIMIT 1

19.

SELECT l.PARTIDO
FROM listas l join distritos d on d.CODIGO=l.DISTRITO
WHERE d.NOME like '%o%' or d.NOME like '%O%'
GROUP by l.PARTIDO
HAVING sum(l.MANDATOS)=0

20.

SELECT distrito, partido, votos
FROM (
    SELECT sum(v.VOTOS) as votos, v.PARTIDO as partido, d.NOME as distrito
    FROM votacoes v join freguesias f join concelhos c join distritos d on d.CODIGO=c.DISTRITO and c.CODIGO=f.CONCELHO and f.CODIGO=v.FREGUESIA 
    GROUP by distrito, partido
    ) 
WHERE (distrito, votos) in (
    SELECT distrito, MAX(votos)
    FROM (
        SELECT sum(v.VOTOS) as votos, v.PARTIDO as partido, d.NOME as distrito
        FROM votacoes v join freguesias f join concelhos c join distritos d on d.CODIGO=c.DISTRITO and c.CODIGO=f.CONCELHO and f.CODIGO=v.FREGUESIA 
        GROUP by distrito, partido
        )
    GROUP by distrito
    )

//

SELECT distrito, partido, votos
FROM (
    SELECT 
        d.NOME AS distrito,
        v.PARTIDO AS partido,
        SUM(v.VOTOS) AS votos,
        RANK() OVER (PARTITION BY d.NOME ORDER BY SUM(v.VOTOS) DESC) AS rnk
    FROM votacoes v
    JOIN freguesias f ON f.CODIGO = v.FREGUESIA
    JOIN concelhos c ON c.CODIGO = f.CONCELHO
    JOIN distritos d ON d.CODIGO = c.DISTRITO
    GROUP BY d.NOME, v.PARTIDO
) AS ranked
WHERE rnk = 1;


21.

