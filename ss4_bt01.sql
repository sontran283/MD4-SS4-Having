CREATE DATABASE SS4_BT01;
USE SS4_BT01;

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

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM Subject
ORDER BY Credit DESC
LIMIT 1;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select Subject.*, Mark.Mark as DiemLonNhat
from Subject
join Mark
on Subject.SubId = Mark.id_sub
order by Mark.Mark desc
limit 1;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select S.StudentId,S.StudentName, AVG(Mark) as DiemTrungBinh
from Student S
Join Mark M
on S.StudentId = M.id_student
group by S.StudentId,S.StudentName 
order by DiemTrungBinh desc;
