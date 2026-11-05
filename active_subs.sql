
SELECT
    COUNT(*) AS ActiveSubscriptions,
    SUM(sp.Price) AS TotalActiveSubscriptionValue
FROM SUBSCRIPTION s
JOIN SERVICE_PLAN sp
    ON s.PlanCode = sp.PlanCode
WHERE s.Status = 'Active';
