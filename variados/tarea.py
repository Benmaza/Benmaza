import math
from collections import Counter

lista = [10, 15, 12, 8, 17, 14, 20, 8, 12, 16, 14]
lista = lista.sort()
print("Lista ordenada: ", lista)

promedio = sum(lista) / len(lista)
print("El Promedio de esta lista es : ", promedio)

# Calcular la moda
data = Counter(lista)
Moda = data.most_common(1)[0][0]
print("La Moda de esta lista es : ", Moda)

# Calcular la mediana
lista_ordenada = sorted(lista)
n = len(lista_ordenada)
if n % 2 == 0:
    mediana = (lista_ordenada[n//2 - 1] + lista_ordenada[n//2]) / 2
else:
    mediana = lista_ordenada[n//2]
print("La Mediana de esta lista es : ", mediana)

# Calcular la varianza
varianza = sum((xi - promedio) ** 2 for xi in lista) / len(lista)
print("La Varianza de esta lista es : ", varianza)

# Calcular la desviación estándar
desviacion_estandar = varianza ** 0.5
print("La Desviacion Estandar de esta lista es : ", desviacion_estandar)
