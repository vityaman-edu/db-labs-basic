SELECT 
  Н_УЧЕНИКИ.ИД, 
  Н_ЛЮДИ.ИМЯ,
  Н_ЛЮДИ.ФАМИЛИЯ,
  Н_ЛЮДИ.ОТЧЕСТВО,
  СР_ОЦЕНКА
FROM (
  SELECT 
    Н_УЧЕНИКИ.ИД AS ИД, 
    AVG(CAST(Н_ВЕДОМОСТИ.ОЦЕНКА AS INTEGER)) AS СР_ОЦЕНКА
  FROM Н_УЧЕНИКИ 
  RIGHT JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
  JOIN Н_ВЕДОМОСТИ ON Н_ЛЮДИ.ИД = Н_ВЕДОМОСТИ.ЧЛВК_ИД
  WHERE Н_УЧЕНИКИ.ГРУППА = '4100'
    AND Н_ВЕДОМОСТИ.ОЦЕНКА IN ('2', '3', '4', '5')
  GROUP BY Н_УЧЕНИКИ.ИД
) AS СТУДЕНТЫ_4100
JOIN Н_УЧЕНИКИ ON СТУДЕНТЫ_4100.ИД = Н_УЧЕНИКИ.ИД
RIGHT JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
WHERE СТУДЕНТЫ_4100.СР_ОЦЕНКА < (
  SELECT AVG(CAST(Н_ВЕДОМОСТИ.ОЦЕНКА AS INTEGER))
  FROM Н_УЧЕНИКИ 
  RIGHT JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
  JOIN Н_ВЕДОМОСТИ ON Н_ЛЮДИ.ИД = Н_ВЕДОМОСТИ.ЧЛВК_ИД
  WHERE Н_УЧЕНИКИ.ГРУППА = '1101'
    AND Н_ВЕДОМОСТИ.ОЦЕНКА IN ('2', '3', '4', '5')
);