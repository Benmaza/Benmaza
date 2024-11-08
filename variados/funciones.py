# se crea una funcion def y para llamarla solo se escribe su nombre ()

def rocket_parts():
    print("payload, propellant, structure")

rocket_parts()

def distance_from_earth(destination):
    if destination == "Moon":
        print ("238,855")
    else:
        print("Unable to compute to that destination")

def days_to_complete(distance, speed):
    hours = distance/speed
    print(hours/24)

distance_from_earth("Moon")

days_to_complete(238855, 75)

from datetime import timedelta, datetime

def arrival_time(hours=51):
    now = datetime.now()
    arrival = now + timedelta(hours=hours)
    print (arrival.strftime("Arrival: %A %H:%M"))

arrival_time(hours=0)

from datetime import timedelta, datetime

def arrival_time(destination, hours=51):
    now = datetime.now()
    arrival = now + timedelta(hours=hours)
    print (arrival.strftime(f"{destination} Arrival: %A %H:%M"))

arrival_time("Moon")