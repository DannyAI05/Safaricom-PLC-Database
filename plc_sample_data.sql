
USE safaricom_management;

INSERT INTO SERVICE_CENTRE
(CentreCode, CentreName, Town, Address)
VALUES
('0001', 'Nairobi CBD Centre', 'Nairobi', 'Kenyatta Avenue'),
('0002', 'Westlands Centre', 'Nairobi', 'Westlands Road'),
('0003', 'Mombasa Centre', 'Mombasa', 'Nkrumah Road');



INSERT INTO JOB_DESCRIPTION
(JobGroup, JobTitle, Salary)
VALUES
('A', 'Regional Manager', 220000),
('B', 'Service Manager', 150000),
('C', 'Customer Advisor', 85000),
('D', 'Technical Support', 70000);

SELECT * FROM SERVICE_CENTRE;
SELECT * FROM JOB_DESCRIPTION;


USE safaricom_management;

INSERT INTO EMPLOYEE
(PersonalNo, Surname, OtherNames, Gender, DOB, CentreCode, JobGroup)
VALUES
('330101', 'Wanjiru', 'Mary Anne', 'F', '1990-04-12', '0001', 'B'),
('330102', 'Otieno', 'Brian Ochieng', 'M', '1988-09-18', '0001', 'C'),
('330103', 'Achieng', 'Grace Atieno', 'F', '1992-02-05', '0002', 'D'),
('330104', 'Mwangi', 'Peter Kamau', 'M', '1985-11-30', '0003', 'A'),
('330105', 'Kiptoo', 'Samuel Kibet', 'M', '1994-06-21', '0002', 'C');

SELECT * FROM EMPLOYEE;

INSERT INTO EMPL_PHONE
(PersonalNo, PhoneNo)
VALUES
('330101', '0701000001'),
('330102', '0701000002'),
('330103', '0701000003'),
('330104', '0701000004'),
('330105', '0701000005');

SELECT * FROM EMPL_PHONE;


USE safaricom_management;

INSERT INTO CUSTOMER
(CustomerID, Surname, OtherNames, RegistrationDate)
VALUES
('SC100001', 'Kamau', 'Alice Wanjiku', '2022-03-15'),
('SC100002', 'Omondi', 'David Otieno', '2022-07-20'),
('SC100003', 'Njeri', 'Faith Wambui', '2023-01-10'),
('SC100004', 'Hassan', 'Amina Ali', '2023-05-25'),
('SC100005', 'Musyoki', 'James Kaloki', '2024-02-12'),
('SC100006', 'Kiptoo', 'Samuel Kibet', '2024-09-08');

SELECT * FROM CUSTOMER;


INSERT INTO CUST_PHONE
(CustomerID, PhoneNo)
VALUES
('SC100001', '0712000001'),
('SC100002', '0712000002'),
('SC100003', '0712000003'),
('SC100004', '0712000004'),
('SC100005', '0712000005'),
('SC100006', '0712000006');

SELECT * FROM CUST_PHONE;


USE safaricom_management;

INSERT INTO SERVICE_PLAN
(PlanCode, PlanName, ServiceType, Price)
VALUES
('PL0001', 'Daily Data Bundle', 'Data', 50.00),
('PL0002', 'Weekly Data Bundle', 'Data', 250.00),
('PL0003', 'Monthly Voice Plan', 'Voice', 500.00),
('PL0004', 'SMS Bundle', 'SMS', 100.00),
('PL0005', 'Home Internet', 'Internet', 2500.00);

SELECT * FROM SERVICE_PLAN;


INSERT INTO SUBSCRIPTION
(SubscriptionID, CustomerID, PlanCode, StartDate, Status)
VALUES
('SU000001', 'SC100001', 'PL0001', '2026-01-05', 'Active'),
('SU000002', 'SC100001', 'PL0003', '2026-02-10', 'Active'),
('SU000003', 'SC100002', 'PL0002', '2026-03-01', 'Active'),
('SU000004', 'SC100002', 'PL0004', '2026-03-15', 'Expired'),
('SU000005', 'SC100003', 'PL0003', '2026-04-02', 'Active'),
('SU000006', 'SC100003', 'PL0001', '2026-04-12', 'Active'),
('SU000007', 'SC100004', 'PL0005', '2026-05-01', 'Active'),
('SU000008', 'SC100005', 'PL0002', '2026-06-10', 'Active'),
('SU000009', 'SC100006', 'PL0004', '2026-07-05', 'Expired'),
('SU000010', 'SC100006', 'PL0003', '2026-08-20', 'Active');

SELECT * FROM SUBSCRIPTION;


USE safaricom_management;

INSERT INTO CUST_EMPL
(PersonalNo, CustomerID, ServiceDate, ServiceTime, IssueDescription)
VALUES
('330101', 'SC100001', '2026-10-01', '09:15:00', 'Data bundle activation'),
('330102', 'SC100002', '2026-10-01', '10:30:00', 'Network connectivity issue'),
('330103', 'SC100003', '2026-10-02', '11:00:00', 'SIM card replacement'),
('330104', 'SC100004', '2026-10-02', '12:45:00', 'Home internet installation'),
('330105', 'SC100005', '2026-10-03', '14:20:00', 'Voice bundle enquiry'),
('330101', 'SC100002', '2026-10-04', '09:40:00', 'Data usage enquiry'),
('330102', 'SC100003', '2026-10-05', '10:15:00', 'Mobile network complaint'),
('330103', 'SC100006', '2026-10-06', '13:30:00', 'SMS bundle activation'),
('330105', 'SC100001', '2026-10-07', '15:00:00', 'Subscription enquiry');

SELECT * FROM CUST_EMPL;


SELECT 'SERVICE_CENTRE' AS TableName, COUNT(*) AS TotalRecords FROM SERVICE_CENTRE
UNION ALL
SELECT 'JOB_DESCRIPTION', COUNT(*) FROM JOB_DESCRIPTION
UNION ALL
SELECT 'EMPLOYEE', COUNT(*) FROM EMPLOYEE
UNION ALL
SELECT 'EMPL_PHONE', COUNT(*) FROM EMPL_PHONE
UNION ALL
SELECT 'CUSTOMER', COUNT(*) FROM CUSTOMER
UNION ALL
SELECT 'CUST_PHONE', COUNT(*) FROM CUST_PHONE
UNION ALL
SELECT 'SERVICE_PLAN', COUNT(*) FROM SERVICE_PLAN
UNION ALL
SELECT 'SUBSCRIPTION', COUNT(*) FROM SUBSCRIPTION
UNION ALL
SELECT 'CUST_EMPL', COUNT(*) FROM CUST_EMPL;
