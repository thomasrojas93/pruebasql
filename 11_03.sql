create schema alke_wallet;

use alke_wallet;

create table usuarios(
user_id int primary key auto_increment,
nombre varchar(100) not null,
correo varchar(100) not null,
clave varchar(100) not null,
saldo int not null,
fecha_de_creacion datetime not null
);

create table transaction(
transaction_id int primary key auto_increment,
sender_user_id int not null,
receiver_user_id int not null,
valor int not null,
transaction_date datetime not null,
foreign key (sender_user_id)
	references usuarios(user_id),
foreign key (receiver_user_id)
	references usuarios(user_id)
);

create table currency(
currency_id int primary key,
currency_name varchar(100),
currency_symbol varchar(100)	
);

insert into usuarios
('user_id',
'nombre',
'correo',
'clave',
'saldo',
'fecha_de_creacion')
value
('1','claudio tapia','123@email','asdf','200',12-23-2000)
--pato