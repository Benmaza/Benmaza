horas_trabajadas = float(input("Ingrese las horas trabajadas: ")) 
tarifa_hora= float(input("Ingrese la tarifa por hora: "))

turno = horas_trabajadas * tarifa_hora
turno_normal = 40 * tarifa_hora
turno_extra = turno_normal + (horas_trabajadas - 40) * (tarifa_hora * 1.1)
turno_doble = turno_normal + (10 * tarifa_hora * 1.1) + (horas_trabajadas - 50) * (tarifa_hora * 1.2)

print('Las horas laboradas por el trabajador son: ', horas_trabajadas)
print('La tarifa por hora es: ', tarifa_hora)
if horas_trabajadas <= 40:  #Si el trabajador labora menos de 40 horas
    salario = turno
    print('El salario del trabajador es: ', salario)
elif horas_trabajadas <50:    #Si el trabajador labora mas de 40 horas y menos de 50
    salario = turno_extra
    print('El salario del trabajador es: ', salario)
elif horas_trabajadas > 50: #Si el trabajador labora mas de 50 horas
    salario = turno_doble
    print('El salario del trabajador es: ', salario)
else: print('Parametros incorrectos') #Si el usuario ingresa un valor erroneo