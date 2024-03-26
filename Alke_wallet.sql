Create schema Alke_Wallet ;
use Alke_Wallet;

create table User(
user_id int primary key auto_increment, 
name varchar(60) not null,
email varchar(20) not null,
password varchar(50) not null,
balance decimal(10,2)
);

create table Currency (
currency_id int primary key auto_increment,
currency_name varchar(15) not null,
currency_symbol varchar(2) not null
);

create table transaction (
transaction_id int primary key auto_increment,
import_amount int ,
transaction_date date, 
sender_user_id int,  
receiver_user_id int,
currency_id int,
foreign key(sender_user_id)
	references User(user_id),
foreign key(receiver_user_id)
	references User(user_id),
foreign key(currency_id)
	references Currency(currency_id)
);



insert into User (name, email, password , balance) 
values  ('Pablo Perez', 'pablo@email.com','pablo123',90000),
		('Carlos Mella', 'carlo@email.com','holahola',68000),
        ('Clara Lima', 'clara@email.com',12345,50000),
        ('Daniel Jimenez', 'dani@email.com','patito',80000),
        ('Camila Duran', 'cami@email.com',1234567,60000),
        ('Claudia Medina', 'clau@email.com','mamatequiero',54000),
        ('Pedro Lara', 'pedro@email.com',54321,42000),
        ('Romina Rojas', 'romi@email.com','contrasena',30000);
insert into Currency (currency_name,currency_symbol) 
values  ('dolar','U$'),
		('peso','$'),
        ('euro','€'),
        ('real ','R$'),
        ('yuan chino','C¥'),
        ('won','₩'),
        ('rupia','₹'),
        ('yen','¥');
insert into Transaction (import_amount,transaction_date, sender_user_id ,receiver_user_id,currency_id) 
values 	(1000,'2016-2-12','1','2','2'),
		(5000,'2018-4-2','3','1','1'),
        (4000,'2018-10-10','3','2','3'),
        (5000,'2018-11-23','4','1','2'),
        (3000,'2019-2-7','7','6','5'),
        (2500,'2019-2-9','5','4','1'),
        (6000,'2019-3-5','2','7','4'),
        (5000,'2019-3-12','1','3','2');



select* from User;
select* from Transaction;
select* from Currency;

truncate table User ;
truncate table Currency ;
truncate table Transaction ;


drop table Transaction;
drop table User;
drop table currency;

/*Consulta para obtener el nombre de la moneda elegida por un
usuario específico*/
create view currencyname_x_user as
select  u.name, cu.currency_name from User u
inner join Transaction t on u.user_id=t.sender_user_id
inner join currency cu on t.currency_id=cu.currency_id
where u.name ='Camila Duran';/*escriba nombre de usuario*/


/*Consulta para obtener todas las transacciones registradas
*/
create view All_transactions as
select * 
from transaction;

/*Consulta para obtener todas las transacciones realizadas por un
usuario específico*/
create view Transactions_x_user as
select * 
from transaction t
inner join User u on t.sender_user_id=u.user_id
where u.name='Clara Lima'
order by u.name;/*inserte nombre de usuario*/



/*Sentencia DML para modificar el campo correo electrónico de un
usuario específico*/

update User set email='clau2@email.com' where email='claunuevo@gmail.com';
/*(or)*/
update User set email = replace (email,'clau@email.com','claunuevo@gmail.com');


/*Sentencia para eliminar los datos de una transacción (eliminado de
la fila completa)*/

delete from Transaction
where  transaction_id = '8'/*inserte id de la transacion a borrar*/;


