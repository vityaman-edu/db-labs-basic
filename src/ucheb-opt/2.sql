-- Сделать запрос для получения атрибутов из указанных таблиц, 
-- применив фильтры по указанным условиям:
-- Таблицы: Н_ЛЮДИ, Н_ОБУЧЕНИЯ, Н_УЧЕНИКИ.
-- Вывести атрибуты: Н_ЛЮДИ.ИД, Н_ОБУЧЕНИЯ.ЧЛВК_ИД, Н_УЧЕНИКИ.ГРУППА.
-- Фильтры: (AND)
--   a) Н_ЛЮДИ.ИД < 163484.
--   b) Н_ОБУЧЕНИЯ.НЗК > 001000.
--   c) Н_УЧЕНИКИ.ИД > 1.
-- Вид соединения: RIGHT JOIN.

EXPLAIN ANALYZE
SELECT Н_ЛЮДИ.ИД, Н_ОБУЧЕНИЯ.ЧЛВК_ИД, Н_УЧЕНИКИ.ГРУППА
FROM Н_ЛЮДИ
RIGHT JOIN Н_ОБУЧЕНИЯ ON Н_ЛЮДИ.ИД = Н_ОБУЧЕНИЯ.ЧЛВК_ИД
RIGHT JOIN Н_УЧЕНИКИ ON Н_ОБУЧЕНИЯ.ВИД_ОБУЧ_ИД = Н_УЧЕНИКИ.ВИД_ОБУЧ_ИД
WHERE Н_ЛЮДИ.ИД < 163484
  AND Н_ОБУЧЕНИЯ.НЗК > '001000'
  AND Н_УЧЕНИКИ.ИД > 1;

-- Output:
                                                                  QUERY PLAN                                                                      
-----------------------------------------------------------------------------------------------------------------------------------------------------
 Nested Loop  (cost=0.86..641946.30 rows=100821170 width=12) (actual time=200.369..17163.743 rows=101069126 loops=1)
   ->  Nested Loop  (cost=0.56..1971.35 rows=4386 width=12) (actual time=200.339..261.747 rows=4386 loops=1)
         ->  Index Scan using "ОБУЧ_ВО_FK_I" on "Н_ОБУЧЕНИЯ"  (cost=0.28..180.40 rows=4387 width=8) (actual time=200.294..216.352 rows=4387 loops=1)
               Filter: (("НЗК")::text > '001000'::text)
               Rows Removed by Filter: 634
         ->  Index Only Scan using "ЧЛВК_PK" on "Н_ЛЮДИ"  (cost=0.28..0.41 rows=1 width=4) (actual time=0.009..0.009 rows=1 loops=4387)
               Index Cond: (("ИД" = "Н_ОБУЧЕНИЯ"."ЧЛВК_ИД") AND ("ИД" < 163484))
               Heap Fetches: 4386
   ->  Memoize  (cost=0.30..321.36 rows=11655 width=8) (actual time=0.000..1.284 rows=23044 loops=4386)
         Cache Key: "Н_ОБУЧЕНИЯ"."ВИД_ОБУЧ_ИД"
         Cache Mode: logical
         Hits: 4384  Misses: 2  Evictions: 0  Overflows: 0  Memory Usage: 970kB
         ->  Index Scan using "УЧЕН_ОБУЧ_FK_I" on "Н_УЧЕНИКИ"  (cost=0.29..321.35 rows=11655 width=8) (actual time=0.019..7.635 rows=11655 loops=2)
               Index Cond: ("ВИД_ОБУЧ_ИД" = "Н_ОБУЧЕНИЯ"."ВИД_ОБУЧ_ИД")
               Filter: ("ИД" > 1)
               Rows Removed by Filter: 0
 Planning Time: 0.619 ms
 JIT:
   Functions: 18
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 2.416 ms, Inlining 9.348 ms, Optimization 119.307 ms, Emission 71.435 ms, Total 202.506 ms
 Execution Time: 21575.820 ms
(22 строки)
