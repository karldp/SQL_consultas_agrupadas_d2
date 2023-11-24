CREATE TABLE registered (quantity INT, date DATE, source VARCHAR); /* create table */

INSERT INTO registered (quantity, date, source) VALUES ( 44, '01/01/2021', 'Blog' ), ( 56, '01/01/2021', 'Página' ), ( 39, '01/02/2021', 'Blog' ), ( 81, '01/02/2021', 'Página' ), ( 12, '01/03/2021', 'Blog' ), ( 91, '01/03/2021', 'Página' ), ( 48, '01/04/2021', 'Blog' ), ( 45, '01/04/2021', 'Página' ), ( 55, '01/05/2021', 'Blog' ), ( 33, '01/05/2021', 'Página' ), ( 18, '01/06/2021', 'Blog' ), ( 12, '01/06/2021', 'Página' ), ( 34, '01/07/2021', 'Blog' ), ( 24, '01/07/2021', 'Página' ), ( 83, '01/08/2021', 'Blog' ), ( 99, '01/08/2021', 'Página' );

1. ¿Cuántos registros hay?

SELECT COUNT(*) FROM registered; /* to count the number of registries (16) 1---checked*/

2. ¿Cuántos inscritos hay en total?

SELECT SUM(quantity) FROM registered; /* to sum the total of registered people (774) 2---checked*/

3. ¿Cuál o cuáles son los registros de mayor antigüedad?

SELECT * FROM registered ORDER BY date ASC LIMIT 2; /* to get the older registered people 3---checked ALBA*/ 

4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta deahora en adelante)

SELECT date, SUM(quantity) FROM registered GROUP BY date; /* registered people per day 4---checked*/

5. ¿Cuántos inscritos hay por fuente?

SELECT source, SUM(quantity) FROM registered GROUP BY source; /* registered people by source 5---checked*/

6. ¿Qué día se inscribió la mayor cantidad de personas? Y ¿Cuántas personas se
inscribieron en ese día?

SELECT date, SUM(quantity) as total FROM registered GROUP BY date ORDER BY total DESC LIMIT 1; /* most registered in one day 6---checked*/

7. ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog? ¿Cuántas personas fueron?

SELECT date, quantity FROM registered WHERE source = 'Blog' ORDER BY quantity DESC LIMIT 1; /* most regitered with blog 7---checked*/

8. ¿Cuál es el promedio de personas inscritas por día?

SELECT AVG(result.registered_by_day) FROM (SELECT date, SUM (quantity) AS registered_by_day FROM registered
GROUP BY date ORDER BY date) AS result;

9. ¿Qué días se inscribieron más de 50 personas?

SELECT date FROM registered WHERE quantity > 50; /* days with more than 50 registered 9---checked*/

10. ¿Cuál es el promedio diario de personas inscritas a partir del tercer día en adelante, considerando únicamente las fechas posteriores o iguales a la indicada?

SELECT date, AVG(quantity) AS daily_avg FROM registered WHERE date >= '01/03/2021' GROUP BY date;



