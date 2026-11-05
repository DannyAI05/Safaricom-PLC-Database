
USE safaricom_management;

CREATE TABLE SERVICE_CENTRE (
    CentreCode CHAR(4) PRIMARY KEY,
    CentreName VARCHAR(40) NOT NULL,
    Town VARCHAR(30) NOT NULL,
    Address VARCHAR(80)
);

CREATE TABLE JOB_DESCRIPTION (
    JobGroup CHAR(1) PRIMARY KEY,
    JobTitle VARCHAR(30) NOT NULL,
    Salary INT NOT NULL
);

CREATE TABLE EMPLOYEE (
    PersonalNo VARCHAR(6) PRIMARY KEY,
    Surname VARCHAR(20) NOT NULL,
    OtherNames VARCHAR(30),
    Gender CHAR(1),
    DOB DATE,
    CentreCode CHAR(4),
    JobGroup CHAR(1),
    FOREIGN KEY (CentreCode)
        REFERENCES SERVICE_CENTRE(CentreCode),
    FOREIGN KEY (JobGroup)
        REFERENCES JOB_DESCRIPTION(JobGroup)
);

CREATE TABLE EMPL_PHONE (
    PersonalNo VARCHAR(6),
    PhoneNo VARCHAR(15),
    PRIMARY KEY (PersonalNo, PhoneNo),
    FOREIGN KEY (PersonalNo)
        REFERENCES EMPLOYEE(PersonalNo)
);

CREATE TABLE CUSTOMER (
    CustomerID VARCHAR(8) PRIMARY KEY,
    Surname VARCHAR(20) NOT NULL,
    OtherNames VARCHAR(30),
    RegistrationDate DATE
);

CREATE TABLE CUST_PHONE (
    CustomerID VARCHAR(8),
    PhoneNo VARCHAR(15),
    PRIMARY KEY (CustomerID, PhoneNo),
    FOREIGN KEY (CustomerID)
        REFERENCES CUSTOMER(CustomerID)
);

CREATE TABLE SERVICE_PLAN (
    PlanCode VARCHAR(6) PRIMARY KEY,
    PlanName VARCHAR(30) NOT NULL,
    ServiceType VARCHAR(15),
    Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE SUBSCRIPTION (
    SubscriptionID VARCHAR(8) PRIMARY KEY,
    CustomerID VARCHAR(8) NOT NULL,
    PlanCode VARCHAR(6) NOT NULL,
    StartDate DATE NOT NULL,
    Status VARCHAR(15),
    FOREIGN KEY (CustomerID)
        REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (PlanCode)
        REFERENCES SERVICE_PLAN(PlanCode)
);

CREATE TABLE CUST_EMPL (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    PersonalNo VARCHAR(6) NOT NULL,
    CustomerID VARCHAR(8) NOT NULL,
    ServiceDate DATE NOT NULL,
    ServiceTime TIME NOT NULL,
    IssueDescription VARCHAR(100),
    FOREIGN KEY (PersonalNo)
        REFERENCES EMPLOYEE(PersonalNo),
    FOREIGN KEY (CustomerID)
        REFERENCES CUSTOMER(CustomerID)
);

SHOW TABLES;
