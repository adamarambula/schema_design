--Populate location table
/*
insert into location (city, state, country) values
('Nashville', 'Tennessee', 'United States'),
('Memphis', 'Tennessee', 'United States'),
('Phoenix', 'Arizona', 'United States'),
('Denver', 'Colorado', 'United States');
*/

--Table check -> location
--select * from location

--Populate person table
/*
insert into person (first_name, second_name, age, location_id) values
('Chickie', 'Ourtic', 21, 1),
('Hilton', 'O Hanley', 37, 1),
('Barbe', 'Purver', 50, 3),
('Reeta', 'Sammons', 34, 2),
('Abbot', 'Fisbburne', 49, 1),
('Winnie', 'Whines', 19, 4),
('Samantha', 'Leese', 35, 2),
('Edouard', 'Lorimer', 29, 1),
('Mattheus', 'Shaplin', 27, 3),
('Donnell', 'Corney', 25, 3),
('Wallis', 'Kauschke', 28, 3),
('Melva', 'Lanham', 20, 2),
('Amelina', 'McNirlan', 22, 4),
('Courtney', 'Holley', 22, 1),
('Sigismond', 'Vala', 21, 4),
('Jacquelynn', 'Halfacre', 24, 2),
('Alanna', 'Spino', 25, 3),
('Isa', 'Slight', 32, 1),
('Kakalina', 'Renne', 26, 3);
*/

--Table check -> person
--select * from person

--Populate interest table
/*
insert into interest (title) values
('Programming'),
('Gaming'),
('Computers'),
('Music'),
('Cooking'),
('Sports');
*/

--Table check -> interest
--select * from interest

--Populate person_interest table
/*
insert into person_interest (person_id, interest_id) values
(1,1),
(1,2),
(1,6),
(2,1),
(2,7),
(2,4),
(3,1),
(3,3),
(3,4),
(4,1),
(4,2),
(4,7),
(5,6),
(5,3),
(5,4),
(6,2),
(6,7),
(6,1),
(7,1),
(7,3),
(8,2),
(8,4),
(9,5),
(9,6),
(10,7),
(10,5),
(11,1),
(11,2),
(11,5),
(12,1),
(12,4),
(12,5),
(13,2),
(13,3),
(13,7),
(14,4),
(14,6),
(14,1),
(15,1),
(15,5),
(15,7),
(16,3),
(16,4),
(16,1),
(17,3),
(17,5),
(17,7),
(18,2),
(18,4),
(18,6),
(19,),
(19,1),
(19,2),
(19,3),
(19,4),
(19,5),
(19,6),
(19,7);
*/

--Table check -> person_interest
--select * from person_interest

--Update birthdays
/*
update person set age = 22 where first_name = 'Chickie';
update person set age = 20 where first_name = 'Winnie';
update person set age = 30 where first_name = 'Edouard';
update person set age = 23 where first_name = 'Courtney';
update person set age = 21 where first_name = 'Melva';
update person set age = 33 where first_name = 'Isa';
update person set age = 50 where first_name = 'Abbott';
update person set age = 35 where first_name = 'Reeta';
*/

--Birthday Check
/*
select first_name, age from person where
first_name = 'Chickie' or
first_name = 'Winnie' or
first_name = 'Edouard' or
first_name = 'Courtney' or
first_name = 'Melva' or
first_name = 'Isa' or
first_name = 'Abbott' or
first_name = 'Reeta'
*/


--Delete Accounts

--Select id from person where first_name = 'Hilton';
--Hilton O'Hanley's id = 2

--Delete records in person_interest table
--delete from person_interest where person_id = 2;
--Check deletion in person_interest
--select * from person_interest where person_id = 2;

--Delete records from persson table
--delete from person where id = 2;
--Check deletion in person table
--select * from person where id = 2;

--Select id from person where first_name = 'Alanna';
--Alanna Spino's id = 17

--Delete records in person_interest table
--delete from person_interest where person_id = 17;
--Check deletion in person_interest
--select * from person_interest where person_id = 17;

--Delete records from persson table
--delete from person where id = 17;
--Check deletion in person table
--select * from person where id = 17;

--Get first and last names
--select first_name, last_name from person;

--Get the people that live in Nashville, TN
--select * from person
--select * from location
/*
select p.first_name, l.city 
from person p inner join location l 
on p.location_id = l.id 
where city = 'Nashville';
*/

--Count how many people live in the four cities
/*
select l.city, count (p.location_id) 
from person p inner join location l 
on p.location_id = l.id 
group by l.city, p.location_id;
*/

--count how many people are interested in the 7 interests
--select * from interest
--select * from person_interest
/*
select i.title, count(pi.interest_id) 
from interest i inner join person_interest pi
on i.id = pi.interest_id group by i.title, pi.interest_id
*/

--Lives in Nashville and interested in programming
--select * from person
--select * from person_interest
--select * from interest
/*
select distinct p.first_name, last_name, l.city, l.state, i.title
from person p inner join location l 
on p.location_id = l.id 
inner join person_interest pi
on p.id = pi.person_id
inner join interest i
on pi.interest_id = i.id
where l.city = 'Nashville'
and pi.interest_id = 1;
*/

/*
OPTIONAL BONUS: Use GROUP BY with cases to determine how many people there are in each of the following age 
ranges: 20-30, 30-40, 40-50 
(Resulting Columns: range & count)
*/

--select age as "20-30" from person where age between 20 and 30;
--select * from person where age between 30 and 40;
--select * from person where age between 40 and 50;

/*
select 
count(age) filter(where age between 20 and 30) as "Ages between 20 - 30",
count(age) filter(where age between 30 and 40) as "Ages between 30 - 40",
count(age) filter(where age between 40 and 50) as "Ages between 40 - 50" 
from person;
*/