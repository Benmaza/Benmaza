# EJERCICIO:
# Muestra ejemplos de creación de todas las estructuras soportadas por defecto en tu lenguaje.
# Utiliza operaciones de inserción, borrado, actualización y ordenación.
# DIFICULTAD EXTRA (opcional):
# Crea una agenda de contactos por terminal.
# Debes implementar funcionalidades de búsqueda, inserción, actualización
# y eliminación de contactos.
# Cada contacto debe tener un nombre y un número de teléfono.
# El programa solicita en primer lugar cuál es la operación que se quiere realizar,
#  y a continuación los datos necesarios para llevarla a cabo.
# El programa no puede dejar introducir números de teléfono no númericos y con más
#  de 11 dígitos (o el número de dígitos que quieras).
# También se debe proponer una operación de finalización del programa.

# listas
print("EJEMPLOS DE LISTAS")
mi_lista = [10, 4, 3, 8, 5, 6,1] # se genera una lista con los elementos que se le pasan
mi_lista.append(7) # se añade un elemento a la lista
mi_lista.insert(0, 0) # se añade un elemento en la posición indicada
print("\nAntes de eliminar un elemento",mi_lista) 
mi_lista.pop() # se elimina el último elemento de la lista
mi_lista.sort() # se ordena la lista de mayor a menor
print("Ordenada de menor a mayor", mi_lista)
mi_lista.reverse() # se ordena de la lista de menor a mayor
print("Ordenada de mayor a menor", mi_lista)

# tuplas
print("\nEJEMPLOS DE TUPLAS")


