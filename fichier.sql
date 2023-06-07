create table students(id int,last_name varchar(50),first_name varchar(50),birth_day date);
insert into students(id,last_name,first_name,birth_day) values(1, 'Marc', 'Benichou', '1998-11-02'),
  (2, 'Yoan', 'Cohen', '2010-12-03'),
  (3, 'Lea', 'Benichou', '1987-07-27'),
  (4, 'Amelia', 'Dux', '1996-04-07'),
  (5, 'David', 'Grez', '2003-06-14'),
  (6, 'Omer', 'Simpson', '1980-10-03'),
  (7,'aya','jafir','12-11-2004');
  select*from students;
  select last_name, first_name from students;
  select last_name, first_name from students where id=2;
  select*from students where first_name='Benichou' and last_name='Marc';
  select*from students where first_name='Benichou' or last_name='Marc';
  select * from students where last_name like '%a%';
  select * from students where last_name like 'a%';
  select * from students where last_name like '%a';
  select* from students where substring(last_name, -2, 1) = 'a';
  select last_name, first_name from students where id IN(1,3);
  SELECT * FROM students WHERE birth_day >= '2000-01-01';

  
  
  
  
  
  
  
  
  
  
  