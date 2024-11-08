planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]

print ("Primer planeta es", planets[0])
print ("cuarto planeta es", planets[3])
print ("sexto planeta es", planets[5])

# se puede cambiar el contenido de la lista por elementos
planets[3] = "planeta rojo"
print ("cuarto planeta es", planets[3])

#conocer la cantidad de elementos
num_planets = len(planets)
print ("son" , num_planets, " planetas en el sistema solar")

#agregar elementos y quitarlos
planets.append("pluto")
num_planets = len(planets)
print ("son" , num_planets, " planetas en el sistema solar \n")
# planets.pop para eliminar el ultimo elemento 

gravity_on_planets = [0.378, 0.907, 1, 0.377, 2.36, 0.916, 0.889, 1.12]
bus_weight = 12650 # in kilograms, on Earth
print("On Earth, a double-decker bus weighs", bus_weight, "kg")
print("The lightest a bus would be in the solar system is", bus_weight * min(gravity_on_planets), "kg")
print("The heaviest a bus would be in the solar system is", bus_weight * max(gravity_on_planets), "kg")

# cuando se escribe planets [0:3] se toman del elemento 0 hasta el 3 pero no se agrega el 3 solo 0,1,2
# planets[3:] se imprime apartir del elemento 3 al final de la lista
# .sort ordena la lista en orden Alfabetico y .sort(reverse=true) al reves
