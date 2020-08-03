if Exists (Select * from sys.databases where Name = 'BookLibrary')
drop database BookLibrary
Go

Create database BookLibrary

Go

use BookLibrary

Go

create table Book (
Book
Code int,
BookTitle varchar(100) NOT NULL,
Author varchar(50) NOT NULL,
Edition int,
BookPrice money,
Copies int,
constraint BC_PK primary key (BookCode)
)
Go

create Table Member (
MemberCode int,
Name varchar(50) NOT NULL,
Address varchar(100) NOT NULL,
PhoneNumber int,
constraint MC_PK primary key (MemberCode)
)
Go

create table IssueDetails (
BookCode int,
MemberCode int,
IssueDate datetime,
ReturnDate datetime
constraint BC foreign key (BookCode) references IssueDetails(BookCode),
constraint MC foreign key (MemberCode) references IssueDetails(MemberCode)
)
Go

alter table IssueDetails
drop constraint BC, MC
Go

alter table Member
drop constraint MC_PK
Go

alter table Book
drop constraint BC_PK
Go

alter table IssueDetails
add constraint BC foreign key (BookCode) references Book(BookCode)
Go

alter table IssueDetails
add constraint MC foreign key (MemberCode) references Member(MemberCode)
Go

alter table Book
add constraint CHK_BP check (BookPrice > 0 and BookPrice < 200)
Go

alter table Member
add constraint PhoneNumber unique
Go

alter table IssueDetails
alter column BookCode int NOT NULL
Go

alter table IssueDetails
alter column MemberCode int NOT NULL
Go

alter table IssueDetails
add constraint BC_PK primary key (BookCode)
Go

alter table IssueDetails
add constraint MC_PK primary key (MemberCode)