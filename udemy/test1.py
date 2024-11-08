import numpy as np

a = np.arange(10,17) 
print (a)
b= np.arange(10,48,4)
print (b)
c= np.random.randint(3,30)
print (c)

mat1 = np.ones((4,5), dtype=int)
mat2 = np.zeros((4,5), dtype=int)

print (mat1)
print (mat2)

#apilando matrices verticalmente y hstack para horizontal
m1= np.vstack((mat1, mat2)) 
print (m1)
# matriz diagonal
mat3 = np.diag ([1,2,3])
# copia la matriz 3 veces
print (np.tile(mat3, 3))
print (mat3 >2) # compara cada elemento de la matriz con 2
