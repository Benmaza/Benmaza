import numpy as np

m1 = np.random.randint (1, 100, size=(3,3))
m2 = np.random.randint (1, 100, size=(3,3))

print (m1)

idx = np.argmax(m1, axis=0) #sacar el indice del maximo valor de cada columna
print (idx)

print (np.max(m1)) #entregar el valor maximo de la matriz

print("impresion de la matriz")
dot= np.dot(m1,m2)
print (dot)

array1 = [88, 23, 39, 41]  
print (array1)  
print (np.size(array1))
print (np.shape(array1)) #
print (np.ndim(array1))
print (type(array1))

