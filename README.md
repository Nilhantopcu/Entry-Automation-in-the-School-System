# Entry Automation in the School System

## Table of Contents
- [Introduction](#introduction)
- [Project Parts](#project-parts)
- [ER Diagram and Database Schema](#er-diagram-and-database-schema)
- [MySQL Database Implementation](#mysql-database-implementation)
- [Graphical User Interface (GUI)](#graphical-user-interface-gui)
- [About GUI](#about-gui)

## Introduction

The "Entry Automation in the School System" project aims to create a student and teacher login database system to handle various school-related operations. The project is divided into three parts, each serving a specific purpose in achieving this goal.

## Project Parts

The project consists of three parts:

1. **Entity Relationship (ER) Diagram and Database Schema**: In this part, an ER Diagram was drawn for the database system. A Relation Database Schema report was prepared, identifying Candidate Keys, Primary Keys, and Foreign Keys within the ER diagram.

2. **MySQL Database Implementation**: The ER diagram from the first part was implemented as a relational schema in MySQL. Data was entered into the created tables, and SQL queries were used to retrieve data.
 
3. **Graphical User Interface (GUI)**: A user interface was designed to connect to the remote database. HTML and CSS were employed to create this interface, while PHP was used to establish a connection with the database. This part focuses on providing specific services to end-users based on the database.

## ER Diagram and Database Schema

In the first part of the project, an Entity Relationship (ER) Diagram was crafted to visualize the structure of the database system. This diagram served as the foundation for the project's database schema. The Relationship Database Schema report detailed the Candidate Keys, Primary Keys, and Foreign Keys identified within the ER diagram.

![image](https://github.com/Nilhantopcu/Entry-Automation-in-the-School-System/assets/118310685/edfc9ec9-b988-421f-a79a-1ab95ff63882)
[Relation Database Schema.pdf](https://github.com/Nilhantopcu/Entry-Automation-in-the-School-System/files/13317873/Relation.Database.Schema.pdf)

## MySQL Database Implementation

The second part of the project saw the implementation of the ER diagram as a relational schema in MySQL. Data was populated in the tables, and a set of 18 SQL queries were utilized to retrieve information from the database. These queries formed the basis for providing essential functionality in the Graphical User Interface (GUI) described in the third part.

## Graphical User Interface (GUI)

In the third and final part of the project, a Graphical User Interface (GUI) was designed to interact with the remote database. The GUI enables users to perform various operations, including but not limited to:

1. **Login Page**: Users are prompted to log in by providing their Social Security Number (SSN) and password. Upon successful authentication, users are directed to the relevant role's page (instructor or student).

2. **Instructor Page**: Information related to the courses being taught, weekly schedules, students in each course, projects led or participated in, students advised, and graduate students supervised can be accessed by instructors. Instructors can also generate free hours reports for the courses they teach and manage exams for their courses.

3. **Student Page**: Students can view details such as their student status (graduate or undergraduate), the courses being taken, grade reports (transcripts), exam grades for courses, weekly schedules, advisors, the list of required courses, the department studied in, and, for graduate students, the projects being worked on.

The GUI primarily facilitates the execution of queries developed in Part 2. It provides a user-friendly interface for accessing and interacting with the database's information.


