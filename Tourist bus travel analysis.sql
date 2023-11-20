create database Bus_Travel;
use bus_travel;

Create table Passenger(
Passenger_id int,
Passenger_name varchar(50),
Category varchar(50),
Gender enum('M','F'),
Boarding_City varchar(50),
Destination_City varchar(50),
Distance int,
Bus_Type varchar(50)
);
CREATE TABLE Price(
id int,
Bus_type varchar(20),
Distance int,
Price int
);

INSERT INTO Passenger 
VALUES(101,'Sakshi','Non-AC','F','Bengaluru','Chennai',350,'Sitting'),
(102,'Anoop','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(103,'Pankaj','AC','M','Panaji','Bengaluru',600,'Sleeper'),
(104,'Kajal','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(105,'Uday','Non-AC','M','Trivandrum','Panaji','1000','Sitting'),
(106,'Avinash','AC','M','Nagpur','Hyderabad',500,'Sleeper'),
(107,'Hitesh','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(108,'Mona','Non-AC','F','Hyderabad','Bengaluru',500,'Sleeper'),
(109,'Preeti','AC','F','Pune','Nagpur',700,'Sitting'),
(110,'Ritika','Non-AC','F','Raipur','Jagdalpur',300,'Sleeper');


INSERT INTO Price VALUES
(101,'Sleeper',350,770),
(102,'Sleeper',550,1100),
(103,'Sleeper',600,1320),
(104,'Sleeper',700,1540),
(105,'Sleeper',1000,2200),
(106,'Sleeper',1200,2640),
(107,'Sleeper',1500,2700),
(108,'Sitting',500,620),
(109,'Sitting',600,744),
(110,'Sitting',700,868),
(111,'Sitting',1000,1240),
(112,'Sitting',1200,1488);


SET sql_safe_updates = 0;

# a. How many female passengers traveled a minimum distance of 600 KMs?
select count(*) as `total female passengers` from passenger 
where gender = 'F' and distance >= 600 ;


# b. Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.
select * from passenger where Distance > 500 and Bus_Type = 'Sleeper';


 # c. Select passenger names whose names start with the character 'S'.
 select passenger_name from passenger where Passenger_name like ('s%');
 
 
 # d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City, Destination City, Bus type, and Price in the output. 
 select p.passenger_name, p.boarding_city, p.destination_city, p.bus_type, pr.price from passenger p inner join price pr using (distance,bus_type);
 
 
 # e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus? 
 select passenger_name , price from passenger p join price pr using (distance,bus_type)
 where p.Distance >= 1000 and p.Bus_Type = 'Sitting';
 
 
 # f. What will be the Sitting and Sleeper bus charge for Pankaj to travel from Bangalore to Panaji ?
 select bus_type, price from price 
 where Distance =  (select Distance from passenger where Passenger_name = 'Pankaj');
 
 
 # g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper ?
update passenger
set category = 'Non-AC'
where bus_type = 'Sleeper';


# h. Delete an entry from the table where the passenger name is Preeti and commit this change in the database. 
delete from passenger
where Passenger_name = 'preeti';

commit;


# i. Truncate the table passenger and comment on the number of rows in the table (explain if required).
truncate table passenger;

# after truncate each and every row in the table will get deleted. Now no. of records is zero.


# j. Delete the table passenger from the database.
drop table passenger;