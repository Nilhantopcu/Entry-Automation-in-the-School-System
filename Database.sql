create table instructor(
ssn varchar(20),
iName varchar(40),
rankk varchar(80),
baseSalary int,
extrasalary int,
dname varchar(50) Not Null,
PRIMARY KEY (ssn)
);
create table department(
dName varchar(50),
budget real,
buildingName varchar(60),
headSsn varchar(20) Not Null Unique,
PRIMARY KEY (Dname),
FOREIGN KEY (headSsn) references instructor(ssn)
);

create table project(
prName varchar(30),
budget int,
startDate date,
endDate date, 
subjectt varchar(50),
leadSsn varchar(20) Not Null,
controlDName varchar(50),
PRIMARY KEY (prName,leadSsn),
FOREIGN KEY (leadSsn) references instructor(ssn),
FOREIGN KEY (controlDName) references department(dName)
);

create table InstrInProjects(
prjleadSsn varchar(20),
prName varchar(30),
issn varchar(20),
workingHours integer,
PRIMARY KEY (prjleadSsn,prName,issn),
FOREIGN KEY (prjleadSsn) references project(leadSsn),
FOREIGN KEY (prName) references project(prName),
FOREIGN KEY (issn) references instructor(ssn)
);

create table curricula(
currCode varchar(15),
gradOrUGrad varchar(20) Not Null,
dname varchar(50) Not Null, 
PRIMARY KEY (currCode,dname),
FOREIGN KEY (dname) references department(dName)
);

create table student(
sssn varchar(20),
gradOrUgrad varchar(20) Not Null,
sName varchar(30),
studentId varchar(20) Not Null unique,
advisorSsn varchar(20) Not Null,
currCode varchar(15),
PRIMARY KEY (sssn),
FOREIGN KEY (advisorSsn) references instructor(ssn),
FOREIGN KEY (currCode) references curricula(currCode)
);

create table gradstudent(
sssn varchar(20),
advisorSsn varchar(20) NOT NULL,
PRIMARY KEY(sssn),
FOREIGN KEY (sssn) references student(sssn),
FOREIGN KEY (advisorSsn) references instructor(ssn)
);

create table GradsInProjects(
prjleadSsn varchar(20),
prName varchar(30),
gradsssn varchar(20),
workingHours integer,
PRIMARY KEY (prjleadSsn,prName,gradsssn),
FOREIGN KEY (prjleadSsn) references project(leadSsn),
FOREIGN KEY (prName) references project(prName),
FOREIGN KEY (gradsssn) references gradstudent(sssn)
);

create table prevDegrees(
college Varchar(50),
degree varchar(40),
yeaarr INT(4),
gradsssn varchar(20),
PRIMARY KEY (degree,yeaarr,college,gradsssn),
FOREIGN KEY (gradsssn) references gradstudent(sssn)
);

create table emails(
sssn varchar(20),
email varchar(40),
PRIMARY KEY (sssn,email),
FOREIGN KEY (sssn) references student(sssn)
);

create table course(
courseCode varchar(15),
ects integer,
courseName varchar(50),
numHours integer,
preRepCourseCode varchar(15),
PRIMARY KEY(courseCode),
FOREIGN KEY (preRepCourseCode) references course(courseCode) 
);

create table curriculaCourses(
courseCode varchar(15),
dName varchar(30) NOT NULL,
currCode varchar(15),
PRIMARY KEY(courseCode,dName,currCode),
FOREIGN KEY (courseCode) references course(courseCode),
FOREIGN KEY (dName) references curricula (dName),
FOREIGN KEY (currCode) references curricula (currCode)
);

create table sectionn(
qouta integer,
semester varchar(10),
coursecode varchar(15), 
yearr INT(4),
sectionId varchar(20),
issn varchar(20),
PRIMARY KEY(semester,yearr,sectionId,coursecode,issn)
);

create table exam(
datee date Not Null,
semester varchar(10),
coursecode varchar(15), 
yearr INT(4),
sectionId varchar(20),
ename varchar(30),
issn varchar(20),
PRIMARY KEY(ename,semester,yearr,sectionId,coursecode,issn)
);

create table enrolled(
semester varchar(10),
coursecode varchar(20),
yearr INT(4),
sectionId varchar(20),
issn varchar(20),
sssn varchar(20),
lettergrade varchar(2),
hourr varchar(10),
dayy varchar(10),
PRIMARY KEY (semester,yearr,sectionId,coursecode,issn,sssn)
);


create table attends(
semester varchar(10),
coursecode varchar(20),
yearr INT(4),
sectionId varchar(20),
ename varchar(30),
issn varchar(20),
sssn varchar(20),
score real,
PRIMARY KEY (semester,yearr,sectionId,coursecode,issn,ename,sssn)
);

create table timeSlot(
dayy varchar(10),
hourr varchar(10),
PRIMARY KEY (dayy,hourr)
);





alter table sectionn 
add constraint sectionn_ibfk_1 FOREIGN KEY (coursecode) references course (courseCode) 
on delete no action on update no action;
alter table sectionn 
add constraint sectionn_ibfk_2 FOREIGN KEY (issn) references instructor (ssn) 
on delete no action on update no action;

alter table exam 
add constraint exam_ibfk_1 FOREIGN KEY (semester,yearr,sectionId,courseCode,issn) references sectionn (semester,yearr,sectionId,courseCode,issn) 
on delete no action on update no action;

alter table enrolled 
add constraint enrolled_ibfk_1 FOREIGN KEY (semester,yearr,sectionId,courseCode,issn) references sectionn (semester,yearr,sectionId,courseCode,issn) 
on delete no action on update no action;
alter table enrolled 
add constraint enrolled_ibfk_2 FOREIGN KEY (sssn) references student (sssn) 
on delete no action on update no action;
alter table enrolled 
add constraint enrolled_ibfk_3 FOREIGN KEY (dayy,hourr) references timeslot (dayy,hourr) 
on delete no action on update no action;

alter table attends 
add constraint attends_ibfk_1 FOREIGN KEY (semester,yearr,sectionId,coursecode,issn,ename) references exam (semester,yearr,sectionId,coursecode,issn,ename) 
on delete no action on update no action;
alter table attends 
add constraint attends_ibfk_2 FOREIGN KEY (sssn) references enrolled (sssn) 
on delete no action on update no action;
INSERT INTO course VALUES 
 ( 'COMP1111', 6, 'Fundamentals of Programming', 3, NULL),
 ( 'COMP1112', 6, 'Object Oriented Programming ', 3, 'COMP1111'),
 ( 'COMP2502', 5, 'Human Computer Interaction', 3, 'COMP1111'),
 ( 'BUSI4573', 6, 'Busıness Project Management', 3, NULL),
 ( 'COMP2222', 7, 'Database System', 3, 'COMP1112'),
 ( 'SOFT3406', 6, 'Software Verification and Validation', 4, 'COMP1112'),
 ( 'INDE2001', 6, 'Operation Research2', 3, NULL ),
 ( 'INDE3312', 6, 'Production and service system', 3, 'INDE2001'),
 ( 'INDE2156', 6, 'Engineering Statistics', 3, NULL),
 ( 'INDE3314', 6, 'quality planning', 3, 'INDE2156'),
 ( 'INDE4412', 5, 'fundamentals of financial', 3, NULL),
 ( 'HUSS1302', 5, 'Science, technology and society', 3, NULL);

INSERT INTO instructor VALUES 
("258279", 'Kerem Koçoğlu', 'Head of Industrial Engineering', 10000, 3000, 'industrial engineering'),
("363425", 'Ayşegül Gültekin', 'Head of Computer Engineering', 10000, 2000, 'computer engineering'),
("461208", 'Dilek Bulut', 'Head of Business Administration', 10000, 1000, 'business'),
("621180", 'Atınç Kurtoğlu', 'Head of Mechatronics Engineering', 10000, 5000, 'mechatronics engineering'),
("155546", 'Beyza Tekin', 'Head of Psychology Department', 10000, 1500, 'psychology'),
("641257", 'Melek Güçlğ', 'Computer Engineering Department Lecturer', 10000, 3500, 'computer engineering'),
("125874", 'Seda Ak', 'Industrial Engineering Department Lecturer', 10000, 2500, 'industrial engineering'),
("365478", 'Oğulcan Er', 'Computer Engineering Department Research Assistant', 10000, 4000, 'computer engineering'),
("951247", 'Melin Çetinoğlu', 'Computer Engineering Department Lecturer', 10000, 6000, 'computer engineering'),
("568741", 'Gülşah alp', 'Industrial Engineering Department Research Assistant', 10000, 2000, 'industrial engineering '),
("214568", 'Buse Gökçe', 'Industrial Engineering Department Research Assistant', 10000, 3000, 'industrial engineering '),
("218745", 'Ahmet Sarı', 'Computer Engineering Department Research Assistant', 10000, 4000, 'computer engineering'),
("784569", 'Meltem Aslan', 'Psychology Department Research Assistant', 10000, 1500, 'psychology');

INSERT INTO department VALUES 
("industrial engineering", 25000, "engineering faculty", "258279"),
("computer engineering", 28000, "engineering faculty", "363425"),
("business", 26000, "faculty of economics and administrative sciences", "461208"),
("mechatronics engineering", 23000, "engineering faculty", "621180"),
("psychology", 21000, "faculty of social science", "155546");

alter table instructor 
add constraint instructor_ibfk_1 FOREIGN KEY (dname) references department (dName) 
on delete no action on update no action;

INSERT INTO project VALUES 
('A', 2000, '2021.10.06', '2022.10.06', 'Production', "214568", 'industrial engineering'),
('B', 1000, '2021.06.07', '2022.04.07', 'Software', "365478", 'computer engineering'),
('C', 1500, '2021.12.08', '2022.10.08', 'Application', "641257", 'computer engineering'),
('D', 1200, '2021.07.14', '2022.07.01', 'Quality Control', "568741", 'industrial engineering'),
('E', 1400, '2021.11.18', '2022.08.06', 'php', "363425", 'computer engineering'),
('F', 1600, '2021.09.08', '2022.04.27', 'java', "951247", 'computer engineering'),
('G', 1800, '2021.04.15', '2022.11.01', 'Production', "258279", 'industrial engineering'),
('H', 1300, '2021.01.18', '2022.06.18', 'psychology', "155546", 'psychology'),
('I', 1200, '2021.02.24', '2022.12.30', 'machine', "621180", 'mechatronics engineering'),
('J', 1400, '2021.10.08', '2022.09.07', 'Simulation', "125874", 'industrial engineering');

INSERT INTO instrinprojects VALUES 
("258279", 'G', "214568", 5),
("363425", 'E', "365478", 2),
("641257", 'C', "218745", 9),
("155546", 'H', "784569", 6),
("125874", 'J', "568741", 7);

INSERT INTO curricula VALUES 
('B1', 'undergraduation', 'business'),
('C1', 'graduation', 'computer engineering'),
('I1', 'graduation', 'industrial engineering'),
('I2', 'undergraduation', 'industrial engineering'),
('I3', 'graduation', 'industrial engineering'),
('P1', 'undergraduation', 'psychology'),
('C2', 'graduation', 'computer engineering'),
('C3', 'graduation', 'computer engineering'),
('C4', 'undergraduation', 'computer engineering'),
('C5', 'graduation', 'computer engineering');

INSERT INTO student  VALUES 
("1001", 'graduation', 'ayşe uzun', '219IE2001',"258279", 'I1'),
("1002", 'undergraduation', 'fatma kurt', '218COMP1008', "363425", 'C4'),
("1003", 'graduation', 'ahmet varoğlu', '219COMP2678', "641257", 'C1'),
("1004", 'undergraduation', 'hasan durmuş', '219IE2002', "258279", 'I2'),
("1005", 'undergraduation', 'ali samet', '218IE5678', "125874", 'B1'),
("1006", 'graduation', 'nur çelik', '218COMP1248', "363425", 'C5'),
("1007", 'undergraduation', 'ece sarma', '219IE6874', "125874", 'I2'),
("1008", 'graduation', 'ege demirkol', '2020COMP6743', "641257", 'C5'),
("1009", 'graduation', 'yiğit koçhisarlı', '2020IE2974', "258279", 'I1'),
("1010", 'graduation', 'aslı topçu', '2021IE1587', "125874", 'I3'),
("1011", 'graduation', 'birkan kaya', '218COMP1478', "951247", 'C4'),
("1012", 'undergraduation', 'şevket can', '218COMP1894', "363425", 'P1'),
("1013", 'undergraduation', 'dilara arslan', '219MEC1234', "621180", 'P1'),
("1014", 'graduation', 'emre koçer', '219COMP7123',"951247", 'C3'),
("1015", 'graduation', 'ezgi kısa', '218COMP2314',"951247", 'C2');

INSERT INTO gradstudent VALUES 
("1001", "258279"),
("1002", "363425"),
("1003", "641257"),
("1004", "258279"),
("1005", "125874"),
("1006", "363425"),
("1007", "621180"),
("1008", "641257"),
("1009", "258279"),
("1010", "125874"),
("1011", "951247"),
("1012", "363425"),
("1013", "621180"),
("1014", "951247"),
("1015", "951247");

INSERT INTO gradsinprojects VALUES 
("214568", 'A', "1004", 8),
("365478", 'B', "1003", 5),
("951247", 'F', "1006", 7),
("568741", 'D', "1010", 10),
("621180", 'I', "1013", 9);

INSERT INTO prevdegrees VALUES 
('kadıköy anadolu lisesi', 'High School', 2018, "1001"),
 ('beşiktaş anadolu lisesi', 'High School', 2017, "1002"),
 ('acıbadem anadolu lisesi', 'High School', 2018, "1003"),
 ('doğa koleji lisesi', 'High School', 2018, "1004"),
 ('istek lisesi', 'High School', 2017, "1005"),
 ('fenerbahçe anadolu lisesi', 'High School', 2017, "1006"),
 ('erenköy anadolu lisesi', 'High School', 2018, "1007"),
 ('galatasaray lisesi', 'High School', 2019, "1008"),
 ('istek lisesi', 'High School', 2019, "1009"),
 ('acıbadem anadolu lisesi', 'High School', 2020, "1010"),
 ('erenköy anadolu lisesi', 'High School', 2017, "1011"),
 ('ışık lisesi', 'High School', 2017, "1012"),
 ('fenerbahçe anadolu lisesi', 'High School', 2018, "1013"),
 ('ışık lisesi', 'High School', 2018, "1014"),
 ('kadıköy anadolu lisesi', 'High School', 2017, "1015");

INSERT INTO emails VALUES 
("1001", '219IE2001@isikun'),
("1002", '218COMP1008@isikun'),
("1003", '219COMP2678@isikun'),
("1004", '219IE2002@isikun'),
("1005", '218IE5678@isikun'),
("1006", '218COMP1248@isikun'),
("1007", '219MEC6874@isikun'),
("1008", '2020COMP6743@isikun'),
("1009", '2020IE2974@isikun'),
("1010", '2021IE1587@isikun'),
("1011", '218COMP1478@isikun'),
("1012", '218COMP1894@isikun'),
("1013", '219MEC1234@isikun'),
("1014", '219COMP7123@isikun'),
("1015", '218COMP2314@isikun');

 INSERT INTO curriculacourses VALUES 
('BUSI4573', 'business', 'B1'),
 ('COMP2222', 'computer engineering', 'C1'),
 ('INDE3312', 'industrial engineering', 'I1'),
 ('INDE3314', 'industrial engineering', 'I2'),
 ('INDE4412', 'industrial engineering', 'I3'),
 ('HUSS1302', 'psychology', 'P1'),
 ('COMP2502', 'computer engineering', 'C2'),
 ('SOFT3406', 'computer engineering', 'C3'),
 ('COMP1111', 'computer engineering', 'C4'),
 ('COMP1112', 'computer engineering', 'C5');


INSERT INTO sectionn  VALUES
 (30, 'spring', 'BUSI4573', 2020, 'BUSI4573.1', "461208"),
 (40, 'spring', 'COMP2222', 2021, 'COMP2222.1', "363425"),
 (50, 'fall', 'INDE3312', 2020, 'INDE3312.1', "125874"),
 (30, 'spring', 'INDE3314', 2022, 'INDE3314.1', "258279"),
 (30, 'fall', 'INDE4412', 2021, 'INDE4412.1', "125874"),
 (30, 'spring', 'HUSS1302', 2020, 'HUSS1302.1', "155546"),
 (30, 'spring', 'HUSS1302', 2020, 'HUSS1302.2', "155546"),
 (60, 'fall', 'COMP2502', 2021, 'COMP2502.1', "641257"),
 (60, 'fall', 'SOFT3406', 2021, 'SOFT3406.1', "641257"),
 (50, 'fall', 'COMP1111', 2022, 'COMP1111.1', "951247"),
 (50, 'spring', 'COMP1112', 2020, 'COMP1112.1', "951247"),
 (50, 'fall', 'INDE3312', 2020, 'INDE3312.2', "125874"),
 (30, 'spring', 'INDE3314', 2022, 'INDE3314.2', "258279"),
 (50, 'fall', 'COMP1111', 2022, 'COMP1111.2', "951247"),
 (50, 'spring', 'COMP1112', 2020, 'COMP1112.2', "951247");

INSERT INTO exam VALUES 
('2020.06.02', 'spring', 'BUSI4573', 2020, 'BUSI4573.1', 'Final', "461208"), 
('2021.03.05', 'spring', 'COMP2222', 2021, 'COMP2222.1', 'Midterm1', "363425"), 
('2021.04.06', 'spring', 'COMP2222', 2021, 'COMP2222.1', 'Midterm2', "363425"), 
('2021.05.08', 'spring', 'COMP2222', 2021, 'COMP2222.1', 'Project1', "363425"), 
('2021.06.10', 'spring', 'COMP2222', 2021, 'COMP2222.1', 'Final', "363425"), 
('2020.12.05', 'fall', 'INDE3312', 2020, 'INDE3312.1', 'Midterm', "125874"), 
('2020.01.08', 'fall', 'INDE3312', 2020, 'INDE3312.1', 'Final', "125874"), 
('2022.03.05', 'spring', 'INDE3314', 2022, 'INDE3314.1', 'Midterm', "258279"), 
('2022.06.11', 'spring', 'INDE3314', 2022, 'INDE3314.1', 'Final', "258279"), 
('2021.12.10', 'fall', 'INDE4412', 2021, 'INDE4412.1', 'Midterm', "125874"), 
('2021.01.18', 'fall', 'INDE4412', 2021, 'INDE4412.1', 'Final', "125874"), 
('2020.06.15', 'spring', 'HUSS1302', 2020, 'HUSS1302.1','Final',"155546"),
('2021.12.15', 'fall', 'COMP2502', 2021, 'COMP2502.1', 'Midterm1', "641257"),
('2021.01.04', 'fall', 'COMP2502', 2021, 'COMP2502.1', 'Midterm2', "641257"),
('2021.02.19', 'fall', 'COMP2502', 2021, 'COMP2502.1', 'Final', "641257"),
('2021.11.13', 'fall', 'SOFT3406', 2021, 'SOFT3406.1', 'Midterm1', "641257"),
('2021.12.03', 'fall', 'SOFT3406', 2021, 'SOFT3406.1', 'Midterm2', "641257"),
('2021.01.09', 'fall', 'SOFT3406', 2021, 'SOFT3406.1', 'Project1', "641257"),
('2021.02.21', 'fall', 'SOFT3406', 2021, 'SOFT3406.1', 'Final', "641257"),
('2022.11.19', 'fall', 'COMP1111', 2022, 'COMP1111.1', 'Midterm1', "951247"),
('2022.12.13', 'fall', 'COMP1111', 2022, 'COMP1111.1', 'Midterm2', "951247"),
('2022.01.07', 'fall', 'COMP1111', 2022, 'COMP1111.1', 'Project1', "951247"),
('2022.02.25', 'fall', 'COMP1111', 2022, 'COMP1111.1', 'Final', "951247"),
('2020.03.01', 'spring', 'COMP1112', 2020, 'COMP1112.1', 'Midterm1',"951247"),
('2020.03.30', 'spring', 'COMP1112', 2020, 'COMP1112.1', 'Midterm2', "951247"),
('2020.04.15', 'spring', 'COMP1112', 2020, 'COMP1112.1', 'Project1', "951247"),
('2020.06.16', 'spring', 'COMP1112', 2020, 'COMP1112.1', 'Final', "951247"),
('2020.12.05', 'fall', 'INDE3312', 2020, 'INDE3312.2', 'Midterm', "125874"),
('2020.01.08', 'fall', 'INDE3312', 2020, 'INDE3312.2', 'Final', "125874"),
('2022.03.05', 'spring', 'INDE3314', 2022, 'INDE3314.2', 'Midterm', "258279"),
('2022.06.11', 'spring', 'INDE3314', 2022, 'INDE3314.2', 'Final', "258279"),
('2022.11.19', 'fall', 'COMP1111', 2022, 'COMP1111.2', 'Midterm1', "951247"),
('2022.12.13', 'fall', 'COMP1111', 2022, 'COMP1111.2', 'Midterm2', "951247"),
('2022.01.07', 'fall', 'COMP1111', 2022, 'COMP1111.2', 'Project1', "951247"),
('2022.02.25', 'fall', 'COMP1111', 2022, 'COMP1111.2', 'Final', "951247"),
('2020.03.01', 'spring', 'COMP1112', 2020, 'COMP1112.2', 'Midterm1', "951247"),
('2020.03.30', 'spring', 'COMP1112', 2020, 'COMP1112.2', 'Midterm2', "951247"),
('2020.04.15', 'spring', 'COMP1112', 2020, 'COMP1112.2', 'Project1', "951247"),
('2020.06.16', 'spring', 'COMP1112', 2020, 'COMP1112.2', 'Final', "951247"),
('2020.06.15', 'spring', 'HUSS1302', 2020, 'HUSS1302.2', 'Final', "155546");

INSERT INTO timeslot VALUES 
 ('TTT','123'),
 ('ThThTh','456'),
 ('FFF','789'),
 ('MMM','123'),
 ('WWW','234'),
 ('TTT','567'),
 ('MMM','456'),
 ('ThThTh','345'),
 ('FFF','678'),
 ('WWW','456'),
 ('TTT','234'),
 ('ThThTh','123'),
 ('MMM','678'),
 ('FFF','456'),
 ('TTT','789');
 
INSERT INTO enrolled VALUES 
('spring', 'BUSI4573', 2020, 'BUSI4573.1', '461208', '1005', 'BB', 123, 'TTT'), 
('spring', 'COMP2222', 2021, 'COMP2222.1', '363425', '1003', 'BA', 456, 'ThThTh'), 
('fall', 'INDE3312', 2020, 'INDE3312.1', '125874', '1001', 'AA', 789, 'FFF'), 
('spring', 'INDE3314', 2022, 'INDE3314.1', '258279', '1004', 'BA', 123, 'MMM'), 
('fall', 'INDE4412', 2021, 'INDE4412.1', '125874', '1010', 'CB', 234, 'WWW'), 
('spring', 'HUSS1302', 2020, 'HUSS1302.1', '155546', '1013', 'CC', 567, 'TTT'), 
('spring', 'HUSS1302', 2020, 'HUSS1302.2', '155546', '1012', 'BA', 456, 'MMM'), 
('fall', 'COMP2502', 2021, 'COMP2502.1', '641257', '1015', 'BB', 345, 'ThThTh'),
('fall', 'SOFT3406', 2021, 'SOFT3406.1', '641257', '1014', 'AA', 678, 'FFF'), 
('fall', 'COMP1111', 2022, 'COMP1111.1', '951247', '1011', 'BA', 456, 'WWW'), 
('spring', 'COMP1112', 2020, 'COMP1112.1', '951247', '1008', 'CC', 234, 'TTT'),
('fall', 'INDE3312', 2020, 'INDE3312.2', '125874', '1009', 'DC', 123, 'ThThTh'),
('spring', 'INDE3314', 2022, 'INDE3314.2', '258279', '1007', 'CC', 678, 'MMM'),
('fall', 'COMP1111', 2022, 'COMP1111.2', '951247', '1002', 'DD', 456, 'FFF'),
('spring', 'COMP1112', 2020, 'COMP1112.2', '951247', '1006', 'CB', 789, 'TTT');

INSERT INTO attends VALUES 
('spring', 'BUSI4573', 2020, 'BUSI4573.1', 'Final', '461208', '1005', 50),
('spring', 'COMP2222', 2021, 'COMP2222.1', 'Midterm1', '363425', '1003', 60),
('spring', 'COMP2222', 2021, 'COMP2222.1', 'Midterm2', '363425', '1003', 77),
('spring', 'COMP2222', 2021, 'COMP2222.1', 'Project1', '363425', '1003', 80),
('spring', 'COMP2222', 2021, 'COMP2222.1', 'Final', '363425', '1003', 40),
('fall', 'INDE3312', 2020, 'INDE3312.1', 'Midterm', '125874', '1001', 35),
('fall', 'INDE3312', 2020, 'INDE3312.1', 'Final', '125874', '1001', 70),
('spring', 'INDE3314', 2022, 'INDE3314.1', 'Midterm', '258279', '1004', 68),
('spring', 'INDE3314', 2022, 'INDE3314.1', 'Final', '258279', '1004', 71),
('fall', 'INDE4412', 2021, 'INDE4412.1', 'Midterm', '125874', '1010', 79),
('fall', 'INDE4412', 2021, 'INDE4412.1', 'Final', '125874', '1010', 80),
('spring', 'HUSS1302', 2020, 'HUSS1302.1', 'Final', '155546', '1013', 85),
('spring', 'HUSS1302', 2020, 'HUSS1302.2', 'Final', '155546', '1012', 83),
('fall', 'COMP2502', 2021, 'COMP2502.1', 'Midterm1', '641257', '1015', 64),
('fall', 'COMP2502', 2021, 'COMP2502.1', 'Midterm2', '641257', '1015', 72),
('fall', 'COMP2502', 2021, 'COMP2502.1', 'Final', '641257', '1015', 64),
('fall', 'SOFT3406', 2021, 'SOFT3406.1', 'Midterm1', '641257', '1014', 65),
('fall', 'SOFT3406', 2021, 'SOFT3406.1', 'Midterm2', '641257', '1014', 78),
('fall', 'SOFT3406', 2021, 'SOFT3406.1', 'Project1', '641257', '1014', 94),
('fall', 'SOFT3406', 2021, 'SOFT3406.1', 'Final', '641257', '1014', 64),
('fall', 'COMP1111', 2022, 'COMP1111.1', 'Midterm1', '951247', '1011', 35),
('fall', 'COMP1111', 2022, 'COMP1111.1', 'Midterm2', '951247', '1011', 28),
('fall', 'COMP1111', 2022, 'COMP1111.1', 'Project1', '951247', '1011', 90),
('fall', 'COMP1111', 2022, 'COMP1111.1', 'Final', '951247', '1011', 78),
('spring', 'COMP1112', 2020, 'COMP1112.1', 'Midterm1', '951247', '1008', 75),
('spring', 'COMP1112', 2020, 'COMP1112.1', 'Midterm2', '951247', '1008', 40),
('spring', 'COMP1112', 2020, 'COMP1112.1', 'Project1', '951247', '1008', 61),
('spring', 'COMP1112', 2020, 'COMP1112.1', 'Final', '951247', '1008', 68),
('fall', 'INDE3312', 2020, 'INDE3312.2', 'Midterm', '125874', '1009', 72),
('fall', 'INDE3312', 2020, 'INDE3312.2', 'Final', '125874', '1009', 84),
('spring', 'INDE3314', 2022, 'INDE3314.2', 'Midterm', '258279', '1007', 83),
('spring', 'INDE3314', 2022, 'INDE3314.2', 'Final', '258279', '1007', 91),
('fall', 'COMP1111', 2022, 'COMP1111.2', 'Midterm1', '951247', '1002', 62),
('fall', 'COMP1111', 2022, 'COMP1111.2', 'Midterm2', '951247', '1002', 64),
('fall', 'COMP1111', 2022, 'COMP1111.2', 'Project1', '951247', '1002', 68),
('fall', 'COMP1111', 2022, 'COMP1111.2', 'Final', '951247', '1002', 54),
('spring', 'COMP1112', 2020, 'COMP1112.2', 'Midterm1', '951247', '1006', 53),
('spring', 'COMP1112', 2020, 'COMP1112.2', 'Midterm2', '951247', '1006', 78),
('spring', 'COMP1112', 2020, 'COMP1112.2', 'Project1', '951247', '1006', 87),
('spring', 'COMP1112', 2020, 'COMP1112.2', 'Final', '951247', '1006', 54); 
