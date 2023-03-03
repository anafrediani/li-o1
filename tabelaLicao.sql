create database exer3;
use exer3;

create table salario(
salario numeric not null,
cargo bigint not null,
primary key (salario)
);

create table cargo(
id_cargo bigint not null auto_increment,
cargo varchar(60) not null,
data_ini date not null,
data_fi date,
salario numeric not null,
primary key (id_cargo),
foreign key (salario) references salario (salario)
);

create table funcionarios(
id bigint not null auto_increment,
nome varchar(50) not null, 
cpf varchar(50) not null unique,
data_nasc date not null,
genero varchar(1),
cargo bigint not null,
salario numeric not null,
primary key (id),
foreign key(salario) references salario(salario),
foreign key (cargo) references cargo(id_cargo)
);


create table departament0(
departament varchar(100) not null,
funcionario bigint not null,
gerente varchar (200),
primary key (departament),
foreign key (funcionario) references funcionarios(id)
);




prproximo 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------


create database email;
use email;
create table anexo(
numero_anexo bigint not null auto_increment,
link varchar(50),
nome varchar(50),
tamanho numeric(10),
primary key (numero_anexo)
);

create table ususrios(
usuario bigint not null auto_increment,
nome varchar (50),
primary key (usuario)
);
drop table ususrios;
create table status (
num_categoria bigint not null auto_increment,
categoria varchar (50),
primary key (num_categoria)
);

create table email(
assunto bigint not null,
corpo_texto text,
 numero_anexo bigint not null,
 usuario bigint not null,
 quando datetime,
 categoria bigint not null,
 primary key (assunto),
 foreign key (numero_anexo) references anexo (numero_anexo),
 foreign key (usuario) references ususrios (usuario),
 foreign key (categoria) references status (num_categoria)
);

insert into anexo(link, nome, tamanho) values ("acesse.one/99Ikb", "salsicha de oculos",  9), ("l1nk.dev/gCQfE","touca", 5),("l1nk.dev/b1R9a","fofo",4);
select *from anexo;

insert into ususrio(nome) values ("ana"),("elsa"),("olaf"),("rena");

insert into status (categoria) values ("rascunho"),("enviando"),("enviado");

insert into email(assunto, corpo_texto,numero_anexo,usuario,quando,categoria) values ("cachorros","fotos dog",1,1,2023-03-02,1);
join anexo on email.num_anexo=email.num_anexo
join ususrio on emai.usuario=ususrio.usuario
join status on email.categoria=status.num_categoria;





proximo 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------




create database diagramana;
use diagramana;

create table offices(
officeCode bigint not null auto_increment,
city varchar(20) not null,
phone numeric (11) not null,
addressLine1 varchar(30) not null,
addressLine2 varchar (30)not null,
state varchar(30) not null,
country varchar(30) not null,
postalCode varchar(30) not null,
territory varchar(30),
primary key (officeCode)
);

create table employees(
employeeNumber bigint not null auto_increment,
lastName varchar (30) not null,
firstName varchar(30) not null,
extension varchar (30) not null,
email varchar (30) not null,
officeCode bigint not null,
reportsTo varchar(30),
jobTitle varchar(30),
primary key (employeeNumber),
foreign key (officeCode) references offices (officeCode)
);

create table customers(
customerNumber bigint not null auto_increment,
customerName varchar (50) not null,
contractLastName varchar(50) not null,
contractFirstName varchar(50),
phone numeric (11) not null,
addressLine1 varchar(30) not null,
addressLine2 varchar (30)not null,
city varchar(30) not null,
state varchar(30) not null,
country varchar(30) not null,
postalCode numeric(5) not null,
salesRepEmployeeNumber bigint not null,
creditLimit varchar(20),
primary key (customerNumber),
foreign key(salesRepEmployeeNumber) references employees(employeeNumber)
);

create table payments(
customerNumber bigint not null,
checkNumber bigint not null,
paymentDate date,
amount numeric(10),
primary key (checkNumber),
foreign key (customerNumber) references customers (customerNumber)
);

create table orders(
orderNumber bigint not null auto_increment,
orderDate date,
requiredDate datetime,
shippedDate datetime,
status char(1),
comments text,
customerNumber bigint not null,
primary key (orderNumber),
foreign key(customerNumber) references customers (customerNumber)
);

create table productlines(
productLine bigint not null auto_increment,
textDescription text,
htmlDescription text,
image text,
primary key (productLine)
);

create table products(
productCode bigint not null auto_increment,
productName varchar(50) not null,
productLine bigint not null,
productScale varchar(50) not null,
productVendor varchar(50) not null,
productDescripition text not null,
quantilyInStock numeric(10) not null,
buyPrice numeric(10) not null,
msrp numeric(10) not null,
primary key (productCode),
foreign key (productLine) references productlines (productLine)
);

create table orderdetails(
orderNumber bigint not null ,
productCode bigint not null,
quantilyOrdered numeric (10) not null,
priceEach numeric(10) not null,
orderLineNumber numeric(10) not null, 
primary key (orderNumber),
foreign key (orderNumber) references orders(orderNumber),
foreign key (productCode) references products (productCode)
);
drop table orderdetails; 
drop table customers;
drop table payments;
drop table orders;

insert into productlines(textDescription,htmlDescription,image) values 
("estojo capaidade 4 lapis","l1nk.dev/oPPz2","acesse.one/99Ikb"),
("caneca","acesse.one/bdYda","l1nk.dev/gCQfE"),
("brinquedo dog","acesse.one/JoqDF","acesse.one/JoqDF"),
("capinha","l1nk.dev/mjUj9","l1nk.dev/b1R9a");
select *from productlines;

insert into products(productName,productLine,productScale,productVendor,productDescripition,quantilyInStock ,buyPrice,msrp) values
("estojo",1,1,"shein","estojo escolar",1500, 2, 40),
("caneca",2,1,"amazon", "caneca cafe", 220,15,60),
("brinquedo",3,1,"petcamp","brinquedo dog",400,7,40),
("capinha",4,1,"phonecase","capa de celular",600,3,40);
select *from products;

insert into offices(city,phone,addressLine1,addressLine2,state,country,postalCode,territory) values
("campinas",32890513,"dog fofo","esquina gato","SP","brasil",7456,"Amrica"),
("campinas",98206333,"mata pinheiro","comida mac","sp","brasil",9635,"america"),
("capminas",32885566,"maria bilac","sapo pula","sp","brasil",9963,"america"),
("campinas",14032005,"nascimento lindo","madre teo","sp","brasil",1403,"america");
select *from offices;

insert into employees(lastName,firstName,extension,email,officeCode,reportsTo,jobTitle) values 
("fred","carla","atendente","carla@gmil",1,"eu","rh"),
("frei","fel","atende","fel@gmail",2,"eu","moço"),
("tobais","cris","atende","cris@gmail",3,"eu","moço"),
("lu","rafa","atende","rafa@gmail",4,"eu","moça");
select *from employees;

insert into customers(customerName,contractLastName,contractFirstName,phone,addressLine1,addressLine2,city,state,country,postalCode,salesRepEmployeeNumber,creditLimit) values
("felipe","freitas","felipe",983895122,"maria bilac","vinte nove","valinhos","sp","brasil",1111,1,2000),
("ana","fredinhos","carla",323896365,"pinhais","portal","meia sete","barao","sp","brasil",2222,2,4000);
select *from customers;

insert into payments (custmersNumber,checkNumber,paymentDate,amount) values 
(1,403,2023-03-02,4516), (2,355,2023-03-02,45587);
select *from payments;

insert into orders(orderDate,requiredDate,shippedDate,status,comments,customerNumber) values
(2023-02-01,20233-02-06,2023-02-7,"enviado","estojo lindo",1),
(2023-01-02,2023-01-05,2023-01-06,"a enviar","brinquedo macio",2);
select *from orders

insert into orderdetails(orderNumber,productCode,quantilyOrdered ,priceEach,orderLineNumber) values 
(555,6979,455,548,8498),(555,68610,67484,8631,5461);
