planet = {
    'name' : "tierra",
    'moons' : 1
}

print (planet.get('name'))

#se puede actualizar o cambiar el nombre de una categoria dentro del diccionario
#con .update y se pueden actualizar mas valores

planet.update({
    'name':'marte',
    'moons':0
})

print (planet.get('moons'))

planet['orbital period'] = 1000

print(planet)

rainfall = {
    'octubre':4.5,
    'julio':2.7,
    'abril':0.5,
    'mayo':0.2
}

for key in rainfall.keys():
    print(f'{key}:{rainfall[key]}cm')

# buscar una key en el diccionario y agregar un dato nuevo

if 'mayo' in rainfall:
    rainfall['mayo']= rainfall['mayo']+1
else:
    rainfall['mayo'] =1
print (rainfall)