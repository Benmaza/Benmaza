SELECT MAX(age)
FROM users
group by age;

#agrupar por edad y contar cuantos hay de cada edad
SELECT MAX(age), COUNt(age)
FROM users
group by age;

#agrupar por edad y contar cuantos hay de cada edad y ordenar por edad
SELECT MAX(age), COUNt(age)
FROM users
group by age
ORDER BY age ASC;