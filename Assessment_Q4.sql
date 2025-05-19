~~~

SELECT 
    u.id AS customer_id,
    u.name,
    EXTRACT(YEAR FROM AGE(u.signup_date)) * 12 + EXTRACT(MONTH FROM AGE(u.signup_date)) AS tenure_months,
    COUNT(t.transaction_id) AS total_transactions,
    (COUNT(t.transaction_id) * 0.001 * SUM(t.confirmed_amount)) / 
    (EXTRACT(YEAR FROM AGE(u.signup_date)) * 12 + EXTRACT(MONTH FROM AGE(u.signup_date))) * 12) AS estimated_clv
FROM 
    users_customuser u
LEFT JOIN 
    (SELECT 
         owner_id, 
         transaction_id, 
         confirmed_amount 
     FROM 
         savings_savingsaccount 
     WHERE 
         confirmed_amount > 0) t ON u.id = t.owner_id
GROUP BY 
    u.id
ORDER BY 
    estimated_clv DESC;
~~~
