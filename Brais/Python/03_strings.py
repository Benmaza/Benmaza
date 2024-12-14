name, surname, age = "Ruben", "Maza", 40

print('Mi nombre es {} {} y tengo {} años'.format(name, surname, age))
print('Mi nombre es %s %s y tengo %d años'%(surname, name, age))
print(f'Mi nombre es {name} {surname} y tengo {age} años')
print('Mi nombre es ' + name + ' ' + surname + ' y tengo ' + str(age) + ' años')
print('Mi nombre es', name, surname, 'y tengo', age, 'años')

# Desempaquetado de strings

language = 'Python'
a,b,c,d,e,f = language
print(a)
print(e)

# Slicing

language_slice = language[0:3]
print(language_slice)

language_slice = language[1:]
print(language_slice)

language_slice = language[1:2:4]
print(language_slice)

language_slice = language[-2]
print(language_slice)

# Reversa

language_slice = language[::-1]
print(language_slice)

# Funciones de strings

print(language.upper())
print(language.lower())
print(language.find('t'))
print(language.count('t'))
print(language.replace('t', 'T'))
print(language.split('t'))
print(language.isnumeric())
print(language.startswith('Py'))
print('py' == 'py')

