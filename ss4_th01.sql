CREATE DATABASE SS4_TH01;
USE SS4_TH01;

CREATE TABLE Class(
 ClassId int primary key auto_increment,
 ClassName varchar(50),
 StartDate date,
 Status bit(1)
);

CREATE TABLE Student(
StudentId int primary key auto_increment,
StudentName varchar(50),
Address varchar(50),
Phone varchar(50),
Status bit(1),
id_class int,
foreign key(id_class) references Class(ClassId)
);

CREATE TABLE Subject(
SubId int primary key auto_increment,
SubName varchar(50),
Credit double,
Status bit(1)
);

CREATE TABLE Mark(
MarkID int primary key auto_increment,
Mark double,
ExamTimes int,
id_sub int,
id_student int,
foreign key(id_sub) references Subject(SubId),
foreign key(id_student) references Student(StudentId)
);

insert into Class(ClassId,ClassName,StartDate,Status) values (1,'A1','2023-11-11',1);
insert into Class(ClassId,ClassName,StartDate,Status) values (2,'A2','2023-11-11',1);
insert into Class(ClassId,ClassName,StartDate,Status) values (3,'A3','2023-11-11',0);

insert into Student(StudentId,StudentName,Address,Phone,Status,id_class) values (1,'hung','ha noi',0232232323,1,1);
insert into Student(StudentId,StudentName,Address,Phone,Status,id_class) values (2,'tam','hcm',0232232323,1,1);
insert into Student(StudentId,StudentName,Address,Phone,Status,id_class) values (3,'manh','da nang',0232232323,0,2);

insert into Subject(SubId,SubName,Credit,Status) values (1,'CF',5,1);
insert into Subject(SubId,SubName,Credit,Status) values (2,'C',6,1);
insert into Subject(SubId,SubName,Credit,Status) values (3,'EWEWW',5,1);
insert into Subject(SubId,SubName,Credit,Status) values (4,'QYQYQ',10,1);

insert into Mark(MarkID,id_sub,id_student,Mark,ExamTimes) values (1,1,1,8,1);
insert into Mark(MarkID,id_sub,id_student,Mark,ExamTimes) values (2,1,2,10,2);
insert into Mark(MarkID,id_sub,id_student,Mark,ExamTimes) values (3,2,1,12,1);

--  Hiển thị số lượng sinh viên ở từng nơi
select Address, sum(StudentId) as SL_HocVien
from Student
group by Address;

-- Tính điểm trung bình các môn học của mỗi học viên
select S.StudentId,S.StudentName,AVG(Mark) as DiemTrungBinh
from Student S
join Mark M
on s.StudentId = M.id_student
group by S.StudentId,S.StudentName;

-- Hiển thị những bạn học viên có điểm trung bình các môn học lớn hơn 15
select S.StudentId,S.StudentName,AVG(Mark) as DiemTrungBinh
from Student S
join Mark M
on S.StudentId = M.id_student
group by S.StudentId,S.StudentName
having AVG(Mark)>15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất
select S.StudentId,S.StudentName , AVG(Mark)  as DiemTrungBinhLonNhat
from Student S
join Mark M
on s.StudentId = M.id_student
group by S.StudentId,S.StudentName
having AVG(Mark) >= ALL(select AVG(Mark) from Mark group by Mark.id_student);

