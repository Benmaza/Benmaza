seg = 1042
minutos = seg // 60
segundos = seg % 60

print (minutos)
print(segundos)

# cuando se quiere redondear hacia arriba o hacia abajo
from math import ceil, floor

round_up = ceil(12.5)
print(round_up)
round_down = floor(12.5)
print(round_down)
