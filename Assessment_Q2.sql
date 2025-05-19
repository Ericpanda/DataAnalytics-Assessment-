~~~

SELECT 
    CASE 
        WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
        WHEN avg_transactions_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    COUNT(DISTINCT u.id) AS customer_count,
    AVG(t.transaction_count) AS avg_transactions_per_month
FROM 
    users_customuser u
JOIN 
    (SELECT 
         owner_id, 
         COUNT(*) AS transaction_count,
         DATE_TRUNC('month', transaction_date) AS month
     FROM 
         savings_savingsaccount
     GROUP BY 
         owner_id, month) t ON u.id = t.owner_id
GROUP BY 
    frequency_category;
~~~

