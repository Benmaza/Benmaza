#busca un correo parecido a gmail.com
SELECT *
FROM users
WHERE email like '%gmail.com';

#busca un correo que contenga una @
SELECT *
FROM users
WHERE email like '%@%';
