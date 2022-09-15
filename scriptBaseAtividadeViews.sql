create table vendas.categories
(
    categoryID   int          not null
        primary key,
    categoryName varchar(255) not null,
    description  varchar(255) null
);

create table vendas.customer
(
    customerID   int          not null
        primary key,
    customerName varchar(255) not null,
    contactName  varchar(255) not null,
    address      varchar(255) not null,
    city         varchar(255) not null,
    country      varchar(255) not null,
    phone        varchar(255) not null
);

create table vendas.employees
(
    employeeID int          not null
        primary key,
    lastName   varchar(255) not null,
    firstName  varchar(255) not null,
    birthDate  datetime     not null,
    notes      longtext     null
);

create table vendas.orders
(
    orderID    int      not null
        primary key,
    orderDate  datetime not null,
    customerID int      not null,
    employeeID int      not null,
    constraint orders_ibfk_1
        foreign key (customerID) references vendas.customer (customerID),
    constraint orders_ibfk_2
        foreign key (employeeID) references vendas.employees (employeeID)
);

create index customerID
    on vendas.orders (customerID);

create index employeeID
    on vendas.orders (employeeID);

create table vendas.shippers
(
    shipperID int          not null
        primary key,
    phone     varchar(255) not null
);

create table vendas.suppliers
(
    supplierID   int          not null
        primary key,
    supplierName varchar(255) not null,
    contactName  varchar(255) not null,
    address      varchar(255) not null,
    city         varchar(255) not null,
    country      varchar(255) not null,
    phone        varchar(255) not null
);

create table vendas.products
(
    productID   int            not null
        primary key,
    productName varchar(255)   not null,
    unit        varchar(255)   not null,
    price       decimal(10, 2) not null,
    supplierID  int            not null,
    categoryID  int            not null,
    constraint products_ibfk_1
        foreign key (supplierID) references vendas.suppliers (supplierID),
    constraint products_ibfk_2
        foreign key (categoryID) references vendas.categories (categoryID)
);

create table vendas.orderDetails
(
    orderDetailID int not null
        primary key,
    orderID       int not null,
    productID     int not null,
    constraint orderDetails_ibfk_1
        foreign key (orderID) references vendas.orders (orderID),
    constraint orderDetails_ibfk_2
        foreign key (productID) references vendas.products (productID)
);

create index orderID
    on vendas.orderDetails (orderID);

create index productID
    on vendas.orderDetails (productID);

create index categoryID
    on vendas.products (categoryID);

create index supplierID
    on vendas.products (supplierID);


