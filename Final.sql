create database Project_Gladiator
use Project_Gladiator


--------------------------------------------------------------

Insurance Details
Vehicle Info
-----------------------------------------------------------

create table tbl_VehicleInfo(id int identity(15,1) primary key,type varchar(20) constraint ck_veh_vt check (type in('Two Wheeler','Four Wheeler')) not null,manufacturer nvarchar(40) not null,model nvarchar(20) not null,drivingLicence nvarchar(20)not null,purchaseDate date not null,registrationNumber nvarchar(20) not null,engineNo nvarchar(30) not null,chasisNo nvarchar(30) not null,cid int references tbl_Register(id) on delete cascade on update cascade)

insert into tbl_VehicleInfo values ('Four Wheeler','Honda','City','10000003','2020-02-21','R21321','E20202','C0002',15)
insert into tbl_VehicleInfo values ('Four Wheeler','Hyundai','Verna','9800003','2010-12-11','R21000','E30200','C0003',16)
insert into tbl_VehicleInfo values ('Four Wheeler','Hyundai','Creta','6674443','2008-06-29','R45678','E502211','C0004',17)
insert into tbl_VehicleInfo values ('Two Wheeler','RoyalEnfield','Bullet','564422','2020-06-13','R56734','E90202','C0005',18)




----------------------------------------------------------
Register User

-----------------------------------

create table tbl_Register(id int primary key identity(15,1),name varchar(20) not null,email varchar(20) not null ,dob date not null,Contact varchar(20) not null,address varchar(50) not null,password varchar(20) not null)


insert into tbl_Register values ('Aadi','ad@gmail.com','2002-02-21','989080','Delhi','123qwe')
  insert into tbl_Register values ('PJ','PJ@gmail.com','2011-07-11','983222','Ggn','qweabc')
   insert into tbl_Register values ('Monu','monu@gmail.com','2009-01-13','90000','Faridabad','axcv')
    insert into tbl_Register values ('Sonu','sonu@gmail.com','2006-09-10','7890888','Dehradun','abc')

	select * from tbl_Register

	delete from tbl_Register where id IN (19,20,21,22)

------	---------------------------------------------------------------------------------------------

---------	----------------------------------------------------------------
User Table
For Login
----------------

create table tbl_Users(Id int primary key identity(10,1),registeredUser_Id int references tbl_Register(id) on delete cascade on update cascade,username varchar(20) not null ,password varchar(20) not null );


insert into tbl_Users values (15,'prateek@gmail.com','qwe123')
insert into tbl_Users values (16,'abc@gmail.com','1234iop')
insert into tbl_Users values (17,'monu@gmail.com','qwe1237fd')
insert into tbl_Users values (18,'sonu@gmail.com','qwe123qe')

select * from tbl_Users

drop table tbl_Users




select * from tbl_Users



------------------------------------------------------------


--------------------------------------------

	Policy 

	----------------------------------------------

	create table tbl_Policies(policy_Id int primary key identity(100,1),type varchar(20) constraint ck_policy_type check (type in('Third Party','Comprehensive')) not null,time int constraint ck_policy_time check (time in(1,2,3))  not null,cid int references tbl_Register(id) on delete cascade on update cascade)

	insert into tbl_Policies values ('Third Party',1,15)
	insert into tbl_Policies values ('Comprehensive',2,16)
	insert into tbl_Policies values ('Third Party',3,17)
	insert into tbl_Policies values ('Comprehensive',1,18)

	drop table tbl_Policy

====	==============================================================

----	---------------------------------
PAYMENT
---------------------------------

create table payments (payment_Id int primary key identity (15,1),customer_Id int references tbl_Register(id) on delete cascade on update cascade,policy_Id int references tbl_Policy(policy_Id) on delete cascade on update cascade)

insert into payments values (15,100)
insert into payments values (16,101)
insert into payments values (17,102)
insert into payments values (18,103)

select * from payments



===========================
Claim
===========================

create table claim (claim_Id int primary key identity(100,1),dateOfClaim date not null,Approved varchar(10) not null constraint ck_approval_type check (Approved in('Yes','No')),Amount int not null,customer_Id int references tbl_Register(id))