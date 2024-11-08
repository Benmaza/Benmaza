prueba = """ para probar si sale
el texto en varias
lineas sin necesidad del
comando"""
print(prueba)

t2 = " deberia poner \n para salto de linea \n"
print(t2)

# para poner el texto en forma de titulo
print (t2.title())

#busca informacion y la devuelve
temperatura= "la temperatura del sol es millones de grados, mientras la luna es de 50°"
print (temperatura.find("Marte")) # si sale -1 quiere decir que el texto no se encuentra
print (temperatura.find("sol")) #regresa la posicion donde inicia la palabra

# busca en el texto una condicion y la devuelve
temp_marte=" la temperatura mas alta de marte es de 30 C"
for item in temp_marte.split():
    if item.isnumeric():
        print(item)

#reemplazar texto
print(temp_marte.replace("C", "Celsius"))

#uso del signo de %
mass_porcentaje="1/6"
print("el peso corresponde al %s de la masa en la tierra" % mass_porcentaje)
print(f"el peso corresponde al {round(100/6,1)}% de la masa en la tierra")
