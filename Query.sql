/* 1. List the students of a department D in form [studentId, student name, e-mail(s), grad or undergrad] */
select s.studentID ,s.sname as "Student Name", e.email as "e-mail" ,c.gradorugrad 
from student s , emails e, curricula c,department d 
where s.currCode=c.currCode and s.sssn=e.sssn and c.dname=d.dname and d.dname='D';

/* 2. List the advisors of students of a department D in form [studentId, student name, advisor name]. */
select s.studentID, s.sName as "Student Name",i.IName as "Advisor Name" 
from student s, Instructor i, department d, curricula c 
where s.advisorSsn=i.ssn and s.currCode=c.currCode and c.dname=d.dname and d.dname='D';

/* 3. List the instructors of a department D. */
select i.iName 
from instructor i, department d
where i.dname=d.dname and d.dname='D';

/* 4. List the courses of an instructor I in year Y, semester S in form [course Code, coursename, ects]. */
select c.courseCode, c.coursename, ects 
from course c, sectionn s, instructor i
where s.issn=i.ssn and s.coursecode=c.coursecode and s.yearr="2020" and s.semester="spring" and i.iname="Beyza Tekin";

/* 5. List the instructors who are not offering any course in year Y, semester S. */
select i.iname 
from instructor i , sectionn s 
where i.ssn=s.issn and s.yearr != '2020' and s.semester != 'spring';

/* 6. List the students taking course C in a given year Y and semester S, such as students taking COMP2222 in Spring 2022. */
select s.sname AS "Student Name"
from student s, curricula cu, curriculacourses cc, course co, sectionn se, enrolled e
where co.courseCode="COMP1111" and se.coursecode=co.courseCode 
and co.courseCode=cc.courseCode and cc.currCode=cu.currCode
and cu.currCode=s.currCode and se.courseCode=e.courseCode 
and e.sssn=s.sssn and e.sectionId=se.sectionId
and se.yearr="2022" and se.semester="fall";

/* 7. List the students taking a particular section S. Note that, particular section means that all the compound key fields of section is fixed, course C, instructor I, year Y, semester SE, section id ID. */
select s.sname
from student s, curricula cu, curriculacourses cc, course co, sectionn se, department d, instructor i
Where s.currCode=cu.currCode and cu.currCode=cc.currCode
and cc.courseCode=co.courseCode and co.courseCode=se.courseCode
and se.yearr="2022" and se.semester="fall" and se.sectionId="COMP1111.1"
and co.courseName="Fundamentals of Programming" 
and cu.dname=d.dName and d.dName=i.dname and i.iName="Melin Çetinoğlu";

/* 8. Given a student S, list all courses in his/her curriculum in form [course code, course name, ects]. */
select co.courseCode, co.courseName, co.ects
from student s, curricula cu, curriculacourses cc, course co
Where s.currCode=cu.currCode and cu.currCode=cc.currCode 
and cc.courseCode=co.courseCode and s.sName="Birkan Kaya"

/* 9. Given a student S, semester SE, year Y, display timetable in the form [coursecode, section id, day, hour]. */
select co.courseCode, se.sectionId, e.dayy, e.hourr
from student s, curricula cu, curriculacourses cc, course co, sectionn se, enrolled e
Where s.currCode=cu.currCode and cu.currCode=cc.currCode 
and cc.courseCode=co.courseCode and co.courseCode=se.coursecode
and se.coursecode=e.coursecode and s.sName="Birkan Kaya" and se.semester="fall" and se.yearr="2022";

/* 10. Given a student S, display his/her grade report in form [CourseCode, year, semester, grade] including the courses s/he has no grades yet. */
select co.courseCode, se.yearr, se.semester, e.lettergrade
from student s, curricula cu, curriculacourses cc, course co, sectionn se, enrolled e
Where s.currCode=cu.currCode and cu.currCode=cc.currCode 
and cc.courseCode=co.courseCode and co.courseCode=se.coursecode
and e.sssn=s.sssn and e.sectionId=se.sectionId
and se.coursecode=e.coursecode and s.sName="Birkan Kaya";

/* 11. Display all grades of a course C in year Y semester S. */
select e.lettergrade
from student s, curricula cu, curriculacourses cc, course co, sectionn se, enrolled e
Where s.currCode=cu.currCode and cu.currCode=cc.currCode 
and cc.courseCode=co.courseCode and co.courseCode=se.coursecode
and se.coursecode=e.coursecode and e.sssn=s.sssn 
and e.sectionId=se.sectionId and co.courseCode="COMP1111"
and se.yearr="2022" and se.semester="fall";

/* 12. Display all scores of a student S of a course C in the form [examname, score] */
select e.ename as "Exam Name", a.score
from student s, curricula cu, curriculacourses cc, course co, sectionn se, exam e, attends a
where s.currCode=cu.currCode and cu.currCode=cc.currCode
and cc.courseCode=co.courseCode and co.courseCode=se.coursecode
and se.coursecode=e.coursecode and e.coursecode=a.coursecode 
and a.sssn=s.sssn and se.sectionId=e.sectionId and se.semester=e.semester
and se.yearr=e.yearr and e.sectionId=a.sectionId and e.ename=a.ename
and s.sssn="1006" and co.courseCode="COMP1112";

/* 13. List the projects controlled by a department D. */
select p.prName
from project p, department d
where p.controlDName=dName and p.controlDName="D";

/* 14. List all people working in a project P. */ 
select s.sName as "Student Name", i.iName as "Instructor Name"
from project p, department d, gradsinprojects g, instrinprojects ii, gradstudent gs, student s, instructor i
where p.prName="A" and 
p.prName=ii.prName or g.prName
and ii.issn=i.ssn and g.gradsssn=gs.sssn and gs.sssn=s.sssn;

/* 15. Calculate average base salary of instructors of each department. */ 
SELECT baseSalary ,AVG(baseSalary) AS "average base salary" 
FROM instructor GROUP BY baseSalary;
