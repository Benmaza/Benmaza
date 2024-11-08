num = int (input ("Ingrese un número: "))
flag = 0
print ("El número ingresado es: ", num)

for i in range (num):
    if i * i == num:
        flag = 1
        break

print ("Razonando el número....")

if flag == 1:
    print ("El número es un cuadrado perfecto")
else:
    print ("El número no es un cuadrado perfecto")