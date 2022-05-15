-- Init
CREATE SCHEMA library;
-- Specify the schema
use library;
-- ----------------------------------------------------------------------------------------------------------------------
-- 1. Create PERSON table
CREATE TABLE PERSON(
    PID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- PK
    fname VARCHAR(20) NOT NULL,         --
    minitial VARCHAR(1),                -- Only initial
    lname VARCHAR(20) NOT NULL,         --
    street VARCHAR(50),                 --
    city VARCHAR(20),                   --
    state CHAR(2),                      --
    zip INT(5),                         --
    DoB DATE NOT NULL,                  -- YYYY-MM-DD (e.g 1990-09-01)
    gender VARCHAR(1) NOT NULL,         -- 'M' (male) or 'F' (female)
    CHECK (gender in ('M', 'F'))        --
);
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
-- 2. Create MEMBER (and library card) table
CREATE TABLE MEMBER(
	CID INT NOT NULL PRIMARY KEY,		-- CID for Card ID with be MEMBER's primary key
    DoI DATE NOT NULL,					-- date of issue
    mem_level VARCHAR(25),
  	FOREIGN KEY (CID) REFERENCES PERSON(PID),
    CHECK (mem_level in ("Gold", "Silver"))
);
-- ----------------------------------------------------------------------------------------------------------------------

-- ----------------------------------------------------------------------------------------------------------------------
-- 3. Create CONTACT table
CREATE TABLE CONTACT(
  	PID INT NOT NULL,
  	phone_number VARCHAR(10) NOT NULL,       -- '1234567890'
  	FOREIGN KEY (PID) REFERENCES PERSON(PID) -- FK reference from PERSON table
);
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
-- 4. Create EMPLOYEE table
CREATE TABLE EMPLOYEE(
    EID INT NOT NULL PRIMARY KEY,
    start_date DATE NOT NULL,
    employee_type VARCHAR(20) NOT NULL,
    FOREIGN KEY (EID) REFERENCES PERSON(PID),
    CHECK (employee_type in ('Library Supervisor', 'Catalog Manager', 'Receptionist'))
);
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
-- 5. Create BOOK table
CREATE TABLE BOOK(
    BID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    b_title VARCHAR(20) NOT NULL,
    book_type CHAR(7) NOT NULL,
    CHECK (book_type in ("class 1", "class 2"))
);
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
-- 6. Create PAYMENT table
CREATE TABLE PAYMENT(
    PayID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    p_amount FLOAT(4) NOT NULL,
    p_method VARCHAR(20) NOT NULL,
    p_time DATE NOT NULL
);
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
-- 7. Create BORROW table
CREATE TABLE BORROW(
    BID INT NOT NULL,     -- book id
    borrow_date DATE,
    return_date DATE,
    PID INT NOT NULL,     -- person id
    EID INT NOT NULL,     -- employee id
    PayID INT NOT NULL,   -- payment id
    FOREIGN KEY (BID) REFERENCES BOOK(BID),
    FOREIGN KEY (PID) REFERENCES PERSON(PID),
    FOREIGN KEY (EID) REFERENCES EMPLOYEE(EID),
    FOREIGN KEY (PayID) REFERENCES PAYMENT(PayID),
    CHECK(return_date >= borrow_date)
);

-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
-- 8. Create PUBLISHER table
CREATE TABLE PUBLISHER(
    PubID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Pub_name VARCHAR(20) NOT NULL
);
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
-- 9. Create PUBLISH_BY table
CREATE TABLE PUBLISH_BY(
    BID INT NOT NULL,
    PubID INT NOT NULL,
    FOREIGN KEY (BID) REFERENCES BOOK(BID),
    FOREIGN KEY (PubID) REFERENCES PUBLISHER(PubID)
);
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
-- 10. Create AUTHOR table
CREATE TABLE AUTHOR(
    AID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    A_name VARCHAR(20) NOT NULL
);
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
-- 11. Create WRITTEN_BY table
CREATE TABLE WRITTEN_BY(
    BID INT NOT NULL,
    AID INT NOT NULL,
    FOREIGN KEY (BID) REFERENCES BOOK(BID),
    FOREIGN KEY (AID) REFERENCES AUTHOR(AID)
);

-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
-- 12. Create GUEST_LOG table
CREATE TABLE GUEST_LOG(
    CID INT NOT NULL,
    GID INT NOT NULL,
    guest_address VARCHAR(70) NOT NULL,
    guest_name VARCHAR(41) NOT NULL,
    contact_info CHAR(12) NOT NULL,
    FOREIGN KEY (CID) REFERENCES MEMBER(CID)
);
-- ----------------------------------------------------------------------------------------------------------------------
--
