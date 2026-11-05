
USE safaricom_management;

SELECT
    c.CustomerID,
    c.Surname,
    c.OtherNames,
    cp.PhoneNo,
    sp.PlanName,
    sp.ServiceType,
    sp.Price,
    s.Status
FROM CUSTOMER c
JOIN CUST_PHONE cp
    ON c.CustomerID = cp.CustomerID
JOIN SUBSCRIPTION s
    ON c.CustomerID = s.CustomerID
JOIN SERVICE_PLAN sp
    ON s.PlanCode = sp.PlanCode
ORDER BY c.Surname, sp.PlanName;
