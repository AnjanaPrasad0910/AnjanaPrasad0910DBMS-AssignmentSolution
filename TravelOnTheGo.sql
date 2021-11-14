create database if not exists `TravelOnTheGo_directory3`;
use TravelOnTheGo_directory3;

create table if not exists PASSENGER(PASSENGER_NAME VARCHAR(20) NULL DEFAULT NULL, CATEGORY VARCHAR(60) NOT NULL ,GENDER VARCHAR(10), BOARDING_CITY VARCHAR(50) NOT NULL, DESTINATION_CITY VARCHAR(50),DISTANCE INT NOT NULL, BUSTYPE VARCHAR(20) NOT NULL);
create table if not exists PRICE(BUSTYPE VARCHAR(20) NOT NULL,DISTANCE INT NOT NULL,PRICE INT NOT NULL);

INSERT INTO PASSENGER VALUES("SEJAL" ,"AC","F","BENGALURU", "CHENNAI",350,"SLEEPER");
INSERT INTO PASSENGER VALUES("ANMOL" ,"NON-AC","M","MUMBAI", "HYDERABAD",700,"SITTING");
INSERT INTO PASSENGER VALUES("PALLAVI" ,"AC","F","PANAJI", "BENGALURU",600,"SLEEPER");
INSERT INTO PASSENGER VALUES("KHUSHBOO" ,"AC","F","CHENNAI", "MUMBAI",1500,"SLEEPER");
INSERT INTO PASSENGER VALUES("UDIT" ,"NON-AC","M","TRIVANDRUM", "PANAJI",1000,"SLEEPER");
INSERT INTO PASSENGER VALUES("ANKUR" ,"AC","M","NAGPUR", "HYDERABAD",500,"SITTING");
INSERT INTO PASSENGER VALUES("HEMANT" ,"NON-AC","M","PANAJI", "MUMBAI",700,"SLEEPER");
INSERT INTO PASSENGER VALUES("MANISH" ,"NON-AC","M","HYDERABAD", "BENGALURU",500,"SITTING");
INSERT INTO PASSENGER VALUES("PIYUSH" ,"AC","M","PUNE", "NAGPUR",700,"SITTING");

INSERT INTO PRICE VALUES("SLEEPER", 350,770);
INSERT INTO PRICE VALUES("SLEEPER", 500,1100);
INSERT INTO PRICE VALUES("SLEEPER", 600,1320);
INSERT INTO PRICE VALUES("SLEEPER", 700,1540);
INSERT INTO PRICE VALUES("SLEEPER", 1000,2200);
INSERT INTO PRICE VALUES("SLEEPER", 1200,2640);
INSERT INTO PRICE VALUES("SLEEPER", 350,434);
INSERT INTO PRICE VALUES("SITTING", 500,620);
INSERT INTO PRICE VALUES("SITTING", 500,620);
INSERT INTO PRICE VALUES("SITTING", 600,744);
INSERT INTO PRICE VALUES("SITTING", 700,868);
INSERT INTO PRICE VALUES("SITTING", 1000,1240);
INSERT INTO PRICE VALUES("SITTING", 1200,1488);
INSERT INTO PRICE VALUES("SITTING", 1500,1860); 

SELECT COUNT(CASE WHEN (Gender) = 'F' THEN 1 END)female,count(case when (gender)="M" then 1 end)male FROM passenger WHERE Distance >=600;
select min(price)from price where bustype="sleeper";
SELECT passenger_name FROM passenger WHERE Passenger_name LIKE 's%';
SELECT Passenger_name , passenger.Boarding_City, passenger.Destination_city, passenger.BusType, price.Price FROM passenger, price WHERE passenger.Distance = price.Distance and passenger.Bustype = price.Bustype;
SELECT passenger.Passenger_name,price.Price FROM passenger,price WHERE passenger.Distance = 1000 and passenger.Bustype = 'Sitting' and passenger.Distance = 1000 and passenger.Bustype = 'Sitting';
SELECT DISTINCT passenger.Passenger_name, passenger.Boarding_city as Destination_city, passenger.Destination_city as Boardng_city, passenger.Bustype, price.Price FROM passenger, price WHERE Passenger_name = 'Pallavi' and passenger.Distance = price.Distance;
SELECT DISTINCT distance FROM passenger ORDER BY Distance desc;
SELECT Passenger_name, Distance * 100.0/ (SELECT SUM(Distance) FROM passenger)FROM passenger GROUP BY Distance;
call nproc()