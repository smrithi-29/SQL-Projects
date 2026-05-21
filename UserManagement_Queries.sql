create database UserManagement;
use UserManagement;

create table Role(
RoleId int primary key, RoleName varchar(50) not null
);

create table Status (
StatusID int primary key, StatusName varchar(50) not null
);

create table Users (
UserID int primary key, FirstName varchar(50) not null, 
LastName varchar(50) not null, Email varchar(100) not null
);

create table UserAccount (
AccountID int primary key,
UserID int not null,
RoleID int not null,
StatusID int not null,
CreatedDate date not null,
foreign key (UserID) references Users(UserID),
foreign key (RoleID) references Role(RoleID),
foreign key (StatusID) references Status(StatusID)
);

insert into Role values (1, 'Admin');
insert into Role values (2, 'User');

insert into Status values (1, 'Active');
insert into Status values (2, 'Inactive');

insert into Users values(1, 'Gustavo', 'Achong', 'gustavo@email.com');
insert into Users values(2, 'Smrithi', 'VR', 'smrithi@email.com');

insert into UserAccount values(1,1,1,1,'2026-01-01');
insert into UserAccount values(2,2,2,2,'2026-02-15');

select * from Role;
select * from Status;
select * from Users;
select * from UserAccount;

delete from UserAccount;
delete from Users;
delete from Role;
delete from Status;

select * from Role;
select * from Status;
select * from Users;
select * from UserAccount;