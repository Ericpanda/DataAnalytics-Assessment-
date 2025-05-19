~~~
SELECT 
    p.id AS plan_id,
    s.owner_id,
    CASE 
        WHEN s.is_regular_savings = 1 THEN 'Savings'
        WHEN s.is_a_fund = 1 THEN 'Investment'
    END AS type,
    MAX(t.transaction_date) AS last_transaction_date,
    CURRENT_DATE - MAX(t.transaction_date) AS inactivity_days
FROM 
    plans_plan p
JOIN 
    savings_savingsaccount s ON p.id = s.plan_id
LEFT JOIN 
    (SELECT 
         owner_id, 
         transaction_date 
     FROM 
         savings_savingsaccount 
     WHERE 
         confirmed_amount > 0) t ON s.owner_id = t.owner_id
WHERE 
    (s.is_regular_savings = 1 OR s.is_a_fund = 1)
GROUP BY 
    p.id, s.owner_id, s.is_regular_savings, s.is_a_fund
HAVING 
    MAX(t.transaction_date) < CURRENT_DATE - INTERVAL '365 days';



~~~
