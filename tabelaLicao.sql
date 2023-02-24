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
salesRepEmployeeNumber varchar(50) not null,
creditLimit varchar(20),
primary key (customerNumber)
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
orderNumber bigint not null auto_increment,
productCode bigint not null,
quantilyOrdered numeric (10) not null,
priceEach numeric(10) not null,
orderLineNumber numeric(10) not null, 
primary key (orderNumber),
foreign key (productCode) references products (productCode)
);