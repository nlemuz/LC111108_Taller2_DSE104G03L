create database cajerobdd;

use cajerobdd;

create table Cliente
(
id_cliente int not null auto_increment PRIMARY KEY,
nombres varchar(50),
apellidos varchar(50),
dui varchar(10),
pin varchar(6)
);

create table Cuenta
(
id_cliente int not null,
id_cuenta int not null ,
saldo decimal,
fecha_creacion date,
PRIMARY KEY (id_cuenta),
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

create table Transacciones
(
id_cuenta int not null,
id_transaccion varchar(500) not null,
retiro decimal,
deposito decimal,
saldo decimal,
fecha_retiro date,
fecha_deposito date,
PRIMARY KEY (id_transaccion),
FOREIGN KEY (id_cuenta) REFERENCES Cuenta(id_cuenta)
);


insert into Cliente values (1,"Nelson","Lemus","042397003","NL8995");
insert into Cliente values (2,"Marcos","Benitez","019250489","MB2508");
insert into Cliente values (4,"Elizabeth","Martinez","087654321","EM0098");

insert into Cuenta values (1,10089710,0,'2023-10-18');
insert into Cuenta values (2,10089711,100,'2023-10-18');


select p.id_cliente as ID,p.nombres as Nombre,p.apellidos as Apellido,p.dui as DUI,c.id_cuenta as 'No-Cuenta',c.saldo as Saldo,c.fecha_creacion as Fecha from Cliente p inner join Cuenta c on p.id_cliente=c.id_cliente;
select * from cliente;
select * from cuenta;
select * from Transacciones;
select COUNT(*) from cliente p inner join cuenta c on p.id_cliente=c.id_cliente where dui="012401241";

select t.id_cuenta as 'No. Cuenta',t.id_transaccion as Transaccion,t.retiro as Retiro,t.deposito as Deposito,c.saldo as 'Saldo Actul',t.fecha_retiro as 'Fecha Retiro',t.fecha_deposito as 'Fecha Deposito',concat(p.nombres," ",p.apellidos) as Titular,p.dui as DUI from Transacciones t inner join cuenta c on t.id_cuenta=c.id_cuenta inner join cliente p on p.id_cliente=c.id_cliente where dui="042397003" and t.id_cuenta = 10089710

