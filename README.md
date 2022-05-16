# CS4347 Database Systems Group Project

UT Dallas CS4347 Database Systems Group Project

###### Environment
- MySQL 8.0.28-arm64
- Sequel Ace (GUI)
- macOS 12 (OS)

###### What I Learned
- MySQL
- Design the database in conceptual data model and implement the actual database
- Convert relational algebra into SQL queries
- CURD the database using basic & advanced query techniques


## Project Description
Wonder Library is a library for all ages. Wonder Library would like one relational database to be able to smoothly carry out their work in an organized way. The library has following important modules: Person, Employee, Member, Books, Publishers, Authors and Payment.
A Person can be an Employee or a Member. Employee can also be a Member. Details of a person such as Person ID, Name (First, Middle, Last), Address, Gender, Date of Birth, and Phone number (one person can have more than one phone number) are recorded. The Person ID should have the format “PXXX” where X is a number from 0 to 9 (Hint: you can use regexp_like() function).

Each member is issued a library card. The library card details such as card ID, date of issue, membership level (Silver or Gold) and other information are stored. Employee can be one of three classes: Library Supervisors, Cataloging Managers or Receptionists. The start date of employment is recorded.

Each member is classified as a Silver or Gold. A Guest log is maintained for the Gold members, which stores information such as the Gold member’s Card ID, guest ID, guest name, guest address, and guest contact information. There are temporary IDs that a person gets when they visit as a guest of a Gold member. Each guest ID is not unique in whole system, and only unique among all guest of a Gold member.
Books details such as book ID, book title and other information are stored. Books are classified as Class 1 books or Class 2 books. A publisher can publish more than one book, but a book is assumed to be published by a single publisher. The publisher details such as publisher ID and publisher name and other information (you can add assumptions) are stored. Author details such as author ID, author name and other information is stored. One book can have multiple authors and one author can write more than one book.

A receptionist maintains records of borrow details. Borrowing details are stored containing information about the borrowed book, the date of issue and due date of return, the details about the person borrowing the book, details of the receptionist and payment detail. Borrowed details are stored only when a person borrows a book. Payment detail such as Payment ID, payment method (cash, debit/credit card), payment time and amount are stored.



## EER Diagram
![eer diagram](https://raw.githubusercontent.com/cheblankenshipUTD/CS-4347-Database-Systems/main/img/eer-diagram.png)

## Relational Schema
![relational schema](https://raw.githubusercontent.com/cheblankenshipUTD/CS-4347-Database-Systems/main/img/relational-schema.png)

## Dependency Diagram
![dependency diagram](https://raw.githubusercontent.com/cheblankenshipUTD/CS-4347-Database-Systems/main/img/dependency-diagram.png)
