
# Reto #0
# EL FAMOSO "FIZZ BUZZ"
# Fecha publicación enunciado: 27/12/21
# Fecha publicación resolución: 03/01/22
# Dificultad: FÁCIL
# Enunciado: Escribe un programa que muestre por consola (con un print) los números de 1 a 100 (ambos incluidos y con un salto de línea entre cada impresión), sustituyendo los siguientes:
# - Múltiplos de 3 por la palabra "fizz".
# - Múltiplos de 5 por la palabra "buzz".
# - Múltiplos de 3 y de 5 a la vez por la palabra "fizzbuzz".

# Generar lista de 0 a 100
lista = list(range(101))

for i in range(len(lista)):
    if lista[i] % 3 == 0:
        lista[i] = "Fizz"
    elif lista[i] % 5 == 0:
        lista[i] = "Buzz"
    else:
        lista[i] % 3 == 0 and lista[i] % 5 == 0
        lista[i] = "FizzBuzz"
print(lista)
