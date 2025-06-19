BEGIN TRANSACTION;
CREATE TABLE ice_cream_flavors (
        Id INTEGER PRIMARY KEY,
        Flavor TEXT,
        Rating INTEGER
           );
INSERT INTO "ice_cream_flavors" VALUES(1,'Chocolate',10);
INSERT INTO "ice_cream_flavors" VALUES(2,'Vanilla',7);
INSERT INTO "ice_cream_flavors" VALUES(3,'Strawberry',8.2);
INSERT INTO "ice_cream_flavors" VALUES(4,'Arcoiris',9);
INSERT INTO "ice_cream_flavors" VALUES(5,'Banana',7.4);
INSERT INTO "ice_cream_flavors" VALUES(6,'Napolinato',5.4);
INSERT INTO "ice_cream_flavors" VALUES(7,'cacahuate',7.8);
INSERT INTO "ice_cream_flavors" VALUES(8,'Cereza',8.5);
INSERT INTO "ice_cream_flavors" VALUES(9,'Chocochips',8);
INSERT INTO "ice_cream_flavors" VALUES(10,'Menta',8.9);
CREATE TABLE toppings (
                    Id INTEGER PRIMARY KEY,
                    Name TEXT NOT NULL);
INSERT INTO "toppings" VALUES(1,'Chocolate Syrup');
INSERT INTO "toppings" VALUES(2,'Sprinkles');
INSERT INTO "toppings" VALUES(3,'Nuts');
COMMIT;
