create Procedure InsertEmployee5

@Name varchar(30) ,@NGO int ,@Branch int ,@Conatact varchar(20) ,@Email varchar(255)
as 
begin
SET IDENTITY_INSERT [Employee] OFF
Insert into Employee (Name,NGO,Branch,Contact_Number,Email_Address) values (@Name,@NGO,@Branch,@Conatact,@Email)
end
delete from Employee

 exec InsertEmployee5 'Ahmed',2077,65787,'03346786505','ad1@gmail.com';
 exec InsertEmployee5 'Muhammad Ali',2071,65789,'03366786589','ma2@gmail.com';
 exec InsertEmployee5 'Sara',2076,65786,'03312689045','sa3@gmail.com';
 exec InsertEmployee5 'Mishal',2074,65785,'03312898903','mi4@gmail.com';
 exec InsertEmployee5 'Anusha',2073,65788,'03332461055','an5@gmail.com';
 select * from Employee
 

 /*ALTER TABLE Employee
ALTER COLUMN Contact_Number varchar(20);*/
 create Procedure InsertCity5
  @Name varchar(55)
 as
 begin
 Insert into City (Name) values(@Name)
 end
 
 exec InsertCity5 'Karachi';
 exec InsertCity5 'Lahore';
 exec InsertCity5 'Islamabad';
 exec InsertCity5 'Rawalpindi';
 exec InsertCity5 'Multan';
 exec InsertCity5 'Hyderabad';
 exec InsertCity5 'Faislabad';
 select * from City

 /*ALTER TABLE NGO
DROP COLUMN Head_Quarter*/
 create Procedure NGO1
 @username varchar(255), @password varchar(255),@name varchar(255),@number varchar(255), @hq int
 as
 begin
 Insert into NGO(username,password,NGO_Name,Contact_Number,City) Values(@username,@password,@name,@number,@hq)
 end
 exec NGO1 'Chhippa1020@gmail.com','savee','Chippa','021-32267854',7808
  exec NGO1 'khidmat1231@gmail.com','helpkhi','AL-Khidmat','021-32226786',7812
   exec NGO1 'JDC@3452@gmail.com','havepeople','JDC','021-35560932',7813
    exec NGO1 'Edhi678@gmail.com','childlife','Edhi Foundation','021-35558789',7810
	 exec NGO1 'Ansar457@gmail.com','lifeimp','Ansar Burney Trust','021-66789041',7809
	 select * from NGO
	 

create procedure Branch1 
 @ngo int, @city int
as
begin
Insert into Branch_of_NGO(NGO,City) values (@ngo,@city)
end
exec Branch1 65789,7811
exec Branch1 65789,7813
exec Branch1 65788,7812
exec Branch1 65788,7810
exec Branch1 65785,7807
exec Branch1 65785,7809
exec Branch1 65786,7811
exec Branch1 65787,7813
select * from Branch_of_NGO

create procedure Projectinfo
 @name varchar(105), @ngo int, @start date, @end date, @collected float, @goal float, @lead int, @branch int, @cat int,@area int, @des varchar(355)
as
begin
Insert into Project(Name,NGO,Start_Date,End_Date,Amount_Collected,Goal,Lead_Id,Branch_id,Category,Area,Description) values(@name,@ngo,@start,@end,@collected,@goal,@lead,@branch,@cat,@area,@des)
end


create procedure Area
 @city int, @pro varchar(50), @affected int
as
begin
Insert into Areas_In_Need(City,Province,Affected) values(@city,@pro,@affected)
end
exec Area 7813,'Sindh',54
exec Area 7807,'Sindh',670
exec Area 7809,'Punjab',95
exec Area 7811,'Quetta',146
exec Area 7808,'Punjab',220
select * from Areas_In_Need


create procedure cat
 @name varchar(60)
as
begin
Insert into Category (Category_Name) values(@name)
end
exec cat 'Flood Donation'
exec cat 'School Donation'
exec cat 'Food Donation'
exec cat 'Clothes Donation'
exec cat 'Medicine Donation'
select * from Category
select * from NGO

create procedure Category_Ngo
@cat int, @ngo int
as
begin
Insert into Category_Per_NGO(Category_id,NGO_Id) values(@cat,@ngo)
end
alter table Category_Per_NGO add constraint Category_id  primary key (Category_id, int)
exec Category_Ngo 3504, 65785
exec Category_Ngo 3500, 65785
exec Category_Ngo 3502, 65785
exec Category_Ngo 3501, 65786
exec Category_Ngo 3504, 65786
exec Category_Ngo 3503, 65786
exec Category_Ngo 3502, 65787
exec Category_Ngo 3504, 65787
exec Category_Ngo 3502, 65788
exec Category_Ngo 3503, 65789

create Procedure donor
@userName varchar(255), @password varchar(50), @no varchar(25), @email varchar(255), @province varchar(255), @city int
as 
begin
Insert into Donor 



