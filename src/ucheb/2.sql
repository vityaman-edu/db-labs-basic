SELECT 
  Н_ЛЮДИ.ИД AS ЧЛВК_ИД, 
  Н_ВЕДОМОСТИ.ИД AS ВЕД_ИД, 
  Н_СЕССИЯ.ИД AS СЕССИЯ_ИД
FROM Н_ЛЮДИ
RIGHT JOIN Н_ВЕДОМОСТИ ON Н_ЛЮДИ.ИД = Н_ВЕДОМОСТИ.ЧЛВК_ИД
RIGHT JOIN Н_СЕССИЯ ON Н_ЛЮДИ.ИД = Н_СЕССИЯ.ЧЛВК_ИД
WHERE Н_ЛЮДИ.ИМЯ > 'Николай'
  AND Н_ВЕДОМОСТИ.ДАТА < '2010-06-18'::date;
