def exponente(n):
    if not n.isdigit() or float(n) != int(float(n)) or int(n) < 1:
        return "Error de captura"
    else:
        n = int(n)
        resultado = 1
        k = 0
        while resultado < n:
            resultado *= 2
            k += 1
        if resultado == n:
            return k
        else:
            return None

n = input("Ingresa un número entero positivo: ")
k = exponente(n)
if k == "Error de captura":
    print(f'Error de captura para el número {n}')
elif k is None:
    print(f'El número {n} no puede ser expresado como una potencia de 2')
else:
    print(f'Si n = {n}, puede ser expresado como 2^{k} = {2**k}')
    