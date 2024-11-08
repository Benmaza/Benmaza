import tensorflow as tf
import numpy as np

Celsius_q = np.array([-40, -10, 0, 8, 15, 22, 38], dtype=float)
Fahrenheit_a = np.array([-40, 24, 32, 46, 59, 72, 100], dtype=float)

# capa = tf.keras.layers.Dense(units=1, input_shape=[1])
# modelo = tf.keras.Sequential([capa])
oculta1 = tf.keras.layers.Dense(units=3, input_shape=[1])
oculta2 = tf.keras.layers.Dense(units=3)
oculta3 = tf.keras.layers.Dense(units=3)
salida = tf.keras.layers.Dense(units=1)
modelo = tf.keras.Sequential([oculta1, oculta2, oculta3, salida])

modelo.compile(
    optimizer=tf.keras.optimizers.Adam(0.1),
    loss='mean_squared_error'
)

print ("Entrenando...")
historial = modelo.fit(Celsius_q, Fahrenheit_a, epochs=300, verbose=False)
print ("Modelo entrenado")

import matplotlib.pyplot as plt
plt.xlabel('Epoca')
plt.ylabel('Magnitud de perdida')
plt.plot(historial.history['loss'])

print ("Hagamos una prediccion!")
resultado = modelo.predict([50.0])
print ("El resultado es " + str(resultado) + " Fahrenheit!")

#print ("Estos son los valores de la capa")
# print (capa.get_weights())
#print (oculta1.get_weights())
#print (oculta2.get_weights())
#print (salida.get_weights())


