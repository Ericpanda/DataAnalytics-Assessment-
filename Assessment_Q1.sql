~~~

SELECT 
    u.id AS owner_id,
    u.name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT i.id) AS investment_count,
    SUM(s.confirmed_amount) + SUM(i.confirmed_amount) AS total_deposits
FROM 
    users_customuser u
JOIN 
    savings_savingsaccount s ON u.id = s.owner_id AND s.is_regular_savings = 1 AND s.confirmed_amount > 0
JOIN 
    plans_plan p ON p.id = s.plan_id
JOIN 
    savings_savingsaccount i ON u.id = i.owner_id AND i.is_a_fund = 1 AND i.confirmed_amount > 0
GROUP BY 
    u.id
HAVING 
    savings_count > 0 AND investment_count > 0
ORDER BY 
    total_deposits DESC;
~~~
