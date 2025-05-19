# 

# 1. High-Value Customers with Multiple Products
# Approach:
•	The goal was to identify customers with a funded savings and investment plan.


•	I joined the 
users_customuser
table with the 
savings_savingsaccount
table twice: once for savings accounts and once for investment accounts.


•	I filtered the results to include only those accounts that are funded (i.e., 
confirmed_amount > 0
).


•	I used 
COUNT(DISTINCT ...)
to count the number of savings and investment accounts for each customer.


•	The total deposits were calculated by summing the 
confirmed_amount
from both account types.


•	Finally, I grouped the results by customer ID and filtered to ensure that only customers with at least one of each account type were included.

# Challenges:
•	Ensuring that the joins correctly represented the relationships between users and their accounts was crucial. I had to double-check the foreign key relationships to ensure accurate results.


•	Handling potential duplicates in the counts required careful use of 
DISTINCT
.

# 2. Transaction Frequency Analysis
# Approach:
•	The task was to categorize customers based on their transaction frequency.


•	I created a subquery to count the number of transactions per customer per month.


•	I then categorized the average transactions into "High Frequency," "Medium Frequency," and "Low Frequency" using a 
CASE statement.

•	The final output included the count of customers in each category and the average transactions per month.


# Challenges:
•	Aggregating transactions by month required careful date handling. I used 
DATE_TRUNC
to group transactions by month, which may vary depending on the SQL dialect.


•	Ensuring that the average was calculated correctly across different customer counts was a bit tricky, as it required proper grouping.


# 3. Account Inactivity Alert

# Approach:

•	The goal was to find accounts with no inflow transactions for over a year.


•	I joined the plans_plan and  savings_savingsaccount tables to get the necessary account details.


•	I used a left join with a subquery that selects transactions to find the last transaction date for each account.


•	The inactivity was calculated by comparing the last transaction date to the current date, filtering for accounts that have been inactive for more than 365 days.


# Challenges:

•	Handling the left join correctly was essential to ensure that accounts without transactions were still included in the results.


•	The date comparison needed to be precise, and I had to ensure that the interval was correctly applied to filter inactive accounts.


# 4. Customer Lifetime Value (CLV) Estimation


# Approach:


•	The task was to estimate CLV based on account tenure and transaction volume.


•	I calculated the account tenure in months by extracting the difference between the current date and the signup date.


•	I counted the total transactions for each customer and calculated the estimated CLV using the provided formula.


•	The results were ordered by estimated CLV from highest to lowest.


# Challenges:


•	Ensuring that the calculation of tenure was accurate required careful handling of date functions, which can differ across SQL dialects.


•	The formula for CLV needed to be implemented correctly, ensuring that the average profit per transaction was applied properly.
