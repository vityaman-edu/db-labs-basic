SELECT 
  Н_УЧЕНИКИ.ГРУППА,
  Н_ЛЮДИ.ИД AS НОМЕР,
  Н_ЛЮДИ.ИМЯ,
  Н_ЛЮДИ.ФАМИЛИЯ,
  Н_ЛЮДИ.ОТЧЕСТВО,
  Н_УЧЕНИКИ.ИД AS НОМЕР,
  Н_УЧЕНИКИ.СОСТОЯНИЕ AS ПРИКАЗ_СОСТОЯНИЕ
FROM Н_УЧЕНИКИ
RIGHT JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
JOIN Н_ПЛАНЫ ON Н_УЧЕНИКИ.ПЛАН_ИД = Н_ПЛАНЫ.ИД
JOIN Н_ФОРМЫ_ОБУЧЕНИЯ ON Н_ПЛАНЫ.ФО_ИД = Н_ФОРМЫ_ОБУЧЕНИЯ.ИД
WHERE Н_ФОРМЫ_ОБУЧЕНИЯ.НАИМЕНОВАНИЕ = 'Очная'
  AND Н_ПЛАНЫ.КУРС = 1 
  AND Н_УЧЕНИКИ.НАЧАЛО < '2012-09-01'::date;