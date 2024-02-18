# Ingresa un valor a N entero y multiplica los valores de 1 a N
# utilizando un ciclo while, si existe un numero negativo o fraccionario
# desplegara un "error de captura"

def cal_fact(n):
    if not n.isdigit() or float(n) != int(float(n)) or int(n) < 0:
        return "Error de captura"
    else:
        n = int(n)
        factorial = 1
        i = 1
        while i <= n:
            factorial *= i
            i += 1
        return factorial

num_int = input('Ingrese un número entero: ')
cal_fact(num_int)
print(f'El factorial de {num_int} es: {cal_fact(num_int)}')
