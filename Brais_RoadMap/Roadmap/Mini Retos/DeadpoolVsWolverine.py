# EJERCICIO #32
# Deadpool y Wolverine se enfrentan en una batalla a muerte. Cada uno tiene una barra de vida que se va reduciendo
# con cada golpe que recibe. 
# - Deadpool tiene 100 de vida 
# - Wolverine tiene 200 de vida. 
# Cada personaje puede realizar un daño aleatorio
# - Deadpool entre 10 y 100
# - Wolverine entre 10 y 120 
# Cada personaje puede evitar el daño contrario
# - Deadpool tiene un 25% de posibilidades de evitar.
# - Wolverine tiene un 20% de posibilidades de evitar.
# se repite hasta que uno de los dos se queda sin vida. En ese momento, se mostrará un mensaje por pantalla indicando
# quién ha ganado la batalla. Deadpool y Wolverine tienen la misma probabilidad de acertar un golpe.

import random

# Datos de los personajes
golpe_deadpool = random.randint(10, 100)
golpe_wolverine = random.randint(10, 120)
deadpool_evitar = 0.25
wolverine_evitar = 0.20
vida_deadpool = 100
vida_wolverine = 200

# Bucle de la batalla
def batalla(vida_deadpool, vida_wolverine):
    while vida_deadpool > 0 and vida_wolverine > 0:
        if random.random() > deadpool_evitar:
            vida_wolverine -= golpe_deadpool
            print(f"Deadpool golpea a Wolverine con {golpe_deadpool} puntos de daño")
        else:
            print("Deadpool falla el golpe")
        if vida_wolverine <= 0:
            print("Deadpool ha ganado la batalla")
            break
        if random.random() > wolverine_evitar:
            vida_deadpool -= golpe_wolverine
            print(f"Wolverine golpea a Deadpool con {golpe_wolverine} puntos de daño")
        else:
            print("Wolverine falla el golpe")
        if vida_deadpool <= 0:
            print("Wolverine ha ganado la batalla")
            break
        print(f"Deadpool tiene {vida_deadpool} puntos de vida")
        print(f"Wolverine tiene {vida_wolverine} puntos de vida")
        print("")

print("Comienza la batalla")
batalla(vida_deadpool, vida_wolverine)
