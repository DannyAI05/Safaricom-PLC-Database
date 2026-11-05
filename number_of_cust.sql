
SELECT
    e.PersonalNo,
    e.Surname,
    e.OtherNames,
    COUNT(ce.ServiceID) AS CustomersServed
FROM EMPLOYEE e
LEFT JOIN CUST_EMPL ce
    ON e.PersonalNo = ce.PersonalNo
GROUP BY
    e.PersonalNo,
    e.Surname,
    e.OtherNames
ORDER BY CustomersServed DESC;
