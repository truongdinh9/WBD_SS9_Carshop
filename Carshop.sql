create schema if not exists Car_shop collate latin1_swedish_ci;

create table if not exists Offices
(
  officecode  int auto_increment
    primary key,
  adress      varchar(50) not null,
  phonenumber int         not null,
  Region      varchar(50) not null,
  constraint Offices_adress_uindex
    unique (adress)
);

create table if not exists Employees
(
  Employee_id    int auto_increment
    primary key,
  Employee_name  varchar(50)  not null,
  email          varchar(200) not null,
  job_name       varchar(200) not null,
  Manager_ID     int          null,
  Office_work_ID int          null,
  constraint Employees_Employees_Employee_id_fk
    foreign key (Manager_ID) references Employees (Employee_id),
  constraint Employees_Offices_officecode_fk
    foreign key (Office_work_ID) references Offices (officecode)
);

create table if not exists Customer
(
  Customer_id      int auto_increment
    primary key,
  fullname         varchar(50) not null,
  phone_number     int         null,
  adress           varchar(50) null,
  Employee_care_ID int         not null,
  constraint Customer_Employees_Employee_id_fk
    foreign key (Employee_care_ID) references Employees (Employee_id)
);

create table if not exists Orders
(
  order_id              int auto_increment
    primary key,
  require_date          date not null,
  buy_date              date not null,
  delivery_reality_date date not null,
  quantityOderdetail    int  not null,
  priceEach             int  not null,
  Customer_id           int  not null,
  constraint Orders_Customer_Customer_id_fk
    foreign key (Customer_id) references Customer (Customer_id)
);

create table if not exists Payments
(
  payment_id   int auto_increment
    primary key,
  payment_date date not null,
  amount       int  not null,
  Customer_id  int  not null,
  constraint Payments_Customer_Customer_id_fk
    foreign key (Customer_id) references Customer (Customer_id)
);

create table if not exists Productline
(
  Productline_ID int auto_increment
    primary key,
  type           varchar(20) not null,
  describe_line  text        not null,
  column_4       int         null,
  constraint Productline_type_uindex
    unique (type)
);

create table if not exists Product
(
  Product_id       int auto_increment
    primary key,
  Productline_id   int         not null,
  Product_name     varchar(20) not null,
  Product_describe text        null,
  constraint Product_Product_name_uindex
    unique (Product_name),
  constraint Product_Productline_id_uindex
    unique (Productline_id),
  constraint Product_Productline_Productline_ID_fk
    foreign key (Productline_id) references Productline (Productline_ID)
);

create table if not exists Order_detail
(
  Order_id   int not null,
  Product_id int not null,
  primary key (Order_id, Product_id),
  constraint Order_detail_Orders_order_id_fk
    foreign key (Order_id) references Orders (order_id),
  constraint Order_detail_Product_Product_id_fk
    foreign key (Product_id) references Product (Product_id)
);

