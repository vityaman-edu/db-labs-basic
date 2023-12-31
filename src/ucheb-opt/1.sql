-- Сделать запрос для получения атрибутов из указанных таблиц, 
-- применив фильтры по указанным условиям:
-- Таблицы: Н_ЛЮДИ, Н_ВЕДОМОСТИ.
-- Вывести атрибуты: Н_ЛЮДИ.ФАМИЛИЯ, Н_ВЕДОМОСТИ.ЧЛВК_ИД.
-- Фильтры (AND):
--   a) Н_ЛЮДИ.ОТЧЕСТВО < Владимирович.
--   b) Н_ВЕДОМОСТИ.ИД > 39921.
-- Вид соединения: RIGHT JOIN.

EXPLAIN ANALYZE
SELECT Н_ЛЮДИ.ФАМИЛИЯ, Н_ВЕДОМОСТИ.ЧЛВК_ИД
FROM Н_ЛЮДИ
RIGHT JOIN Н_ВЕДОМОСТИ ON Н_ЛЮДИ.ИД = Н_ВЕДОМОСТИ.ЧЛВК_ИД
WHERE Н_ЛЮДИ.ОТЧЕСТВО < 'Владимирович'
  AND Н_ВЕДОМОСТИ.ИД > 39921;

-- Output:
                                                        QUERY PLAN                                                         
---------------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=190.28..7621.16 rows=91444 width=20) (actual time=3.487..78.519 rows=92403 loops=1)
   Hash Cond: ("Н_ВЕДОМОСТИ"."ЧЛВК_ИД" = "Н_ЛЮДИ"."ИД")
   ->  Seq Scan on "Н_ВЕДОМОСТИ"  (cost=0.00..6846.50 rows=222439 width=4) (actual time=0.012..36.782 rows=222439 loops=1)
         Filter: ("ИД" > 39921)
         Rows Removed by Filter: 1
   ->  Hash  (cost=163.97..163.97 rows=2104 width=20) (actual time=3.454..3.456 rows=2104 loops=1)
         Buckets: 4096  Batches: 1  Memory Usage: 143kB
         ->  Seq Scan on "Н_ЛЮДИ"  (cost=0.00..163.97 rows=2104 width=20) (actual time=0.009..3.083 rows=2104 loops=1)
               Filter: (("ОТЧЕСТВО")::text < 'Владимирович'::text)
               Rows Removed by Filter: 3014
 Planning Time: 0.491 ms
 Execution Time: 82.916 ms
(12 строк)
