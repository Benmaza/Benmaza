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





# ejemplo de Agenda
contactos: dict = {
    "Brais": "229123456",
    "Rubén": "229123453",
    "Maria": "229334467",
    "Juan": "229478683",
    "Ana": "229678345",
}

def mostrar_contactos():
    for contacto in contactos:
        print(contacto, contactos[contacto])

def buscar_contacto():
    nombre = input("\nIntroduce el nombre del contacto: ")
    if nombre in contactos:
        print("\nAqui tiene la informacion del contacto")
        print(nombre, contactos[nombre])
    else:
        print("No existe el contacto")
        print("¿Quieres añadirlo?")
        print("1. Sí")
        print("2. No")
        opcion = input("Elige una opción: ")
        if opcion == "1":
            telefono = input("Introduce el teléfono: ")
            if len(telefono) <= 10:
                print("El número de teléfono es correcto")
                contactos[nombre] = telefono                      
                print("Contacto añadido") 
            else:
                print("El número de teléfono es incorrecto")
                return
        else:
            print("Continuar"), 
        return
        
def añadir():
    nombre = input("\nIntroduce el nombre del contacto: ")
    if nombre in contactos:
        print("El contacto ya existe")
        return
    else:
        telefono = input("Introduce el teléfono: ")
        if len(telefono) <= 10:
            print("El número de teléfono es correcto")
            contactos[nombre] = telefono                      
            print("Contacto añadido") 
        else:
            print("El número de teléfono es incorrecto")
            return
        
def Actualizar():
    nombre = input("\nIntroduce el nombre del contacto a actualizar: ")
    if nombre in contactos:
        print("El contacto existe")
        telefono = input("Introduce nuevo teléfono: ")
        if len(telefono) <= 10:
            print("El número de teléfono es correcto")
            contactos[nombre] = telefono                      
            print("Contacto actualizado") 
        else:
            print("El número de teléfono es incorrecto")
            return
    else:
        print("El contacto no existe")
        return
    
def eliminar():
    nombre = input("\nIntroduce el nombre del contacto a eliminar: ")
    if nombre in contactos:
        print("El contacto existe")
        del contactos[nombre]
        print("Contacto eliminado")
    else:
        print("El contacto no existe")
        return
    
            
            


while True:
    print("""\nLista de contactos
                Acciones :
                1.Contactos
                2.Buscar contactos
                3.Añadir contactos
                4.Actualizar contactos
                5.Eliminar contactos
                6.Cerrar""")
    opcion = int(input("eliga segun el indice : "))

    try :

        if opcion == 1 :
            print("lista de contactos---- \n")
            mostrar_contactos()

        elif opcion == 2 :
            buscar_contacto()

        elif opcion == 3 :
            añadir()

        elif opcion == 4 :
            actualizacion()

        elif opcion == 5 :
            eliminar()

        elif opcion == 6 :
            print("---Cerrando---")
            break
        
        else :
            print("la opcion no es valida")

    except Exception as error :
        print("a sucedido un error , Error : " , error)