# Desglosa el dia
from datetime import date
date.today()
print ("La fecha de hoy es:", "" + str (date.today()))

# Entrada de texto por el usuario y lo devuelve
print("hola como te va?")
estado = input ("Como te sientes?...")
print ("Espero que te sigas sientiendo", "" + estado, "todo el dia")

# suma de dos numeros ingresados por el usuario
print("vamos a calcular dos numeros que tu quieras")
first_num = input  ( " Digita primer número :  ")
second_num =  input ( " Digita segundo número:  ")
print ("la suma de los 2 numeros es... " , (int(first_num) + int(second_num)))

# multiplicacion de 2 numeros
parsecs_input = input("Input number of parsecs:")
parsecs = int(parsecs_input)
lightyears = 3.26156 * parsecs

print(parsecs_input + " parsecs is " + str(lightyears) + " lightyears")