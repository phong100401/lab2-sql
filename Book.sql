if Exists (Select * from sys.databases where Name = 'BookLibrary')
drop database BookLibrary
Go

Create database BookLibrary

Go

use BookLibrary

Go

create table Book (
BookCode int,
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
constraint BC foreign key (BookCode) references Book(BookCode),
constraint MC foreign key (MemberCode) references Member(MemberCode)
)
Go
--Xóa bỏ ràng buộc khóa ngoại của bảng issuedetails
alter table IssueDetails
drop constraint BC, MC
Go
--Xóa bỏ ràng buộc khóa chính của bảng member và book
alter table Member
drop constraint MC_PK
Go

alter table Book
drop constraint BC_PK
Go
--Thêm ràng buộc khóa chính bảng book và member
alter table Member
add constraint MC_PK primary key (MemberCode)
Go

alter table Book
add constraint BC_PK primary key (BookCode)
GO
--Thêm ràng buộc Khóa ngoại cho bảng issuedetails
alter table IssueDetails
add constraint BC foreign key (BookCode) references Book(BookCode)
Go

alter table IssueDetails
add constraint MC foreign key (MemberCode) references Member(MemberCode)
Go
--Bổ sung thêm Ràng buộc giá bán sách >0 và <200
alter table Book
add constraint CHK_BP check (BookPrice > 0 and BookPrice < 200)
Go
--Bổ xung ràng buộc duy nhất cho PhoneNumber của bảng member
alter table Member
add constraint PhoneNumber unique
Go
--Bổ sung thêm ràng buộc NOT NULL cho BookCode, MemberCode trong bảng IssueDetails
alter table IssueDetails
alter column BookCode int NOT NULL
Go

alter table IssueDetails
alter column MemberCode int NOT NULL
Go
--Tạo khóa chính gồm 2 cột BookCode, MemberCode cho bảng IssueDetails
alter table IssueDetails
ADD CONSTRAINT BCMC_PK PRIMARY KEY ( BookCode, MemberCode )
Go
