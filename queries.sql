USE shopsmart;

-- Task 1: Top 5 customers by total spending
SELECT
    c.customer_id,
    c.name,
    c.city,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN `orders` o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.city
ORDER BY total_spent DESC
LIMIT 5;

-- Task 2: Best-selling product category by revenue
SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN `orders` o
    ON oi.order_id = o.order_id
GROUP BY p.category
ORDER BY total_revenue DESC
LIMIT 1;

-- Task 3: Customers who never placed an order
SELECT
    c.customer_id,
    c.name,
    c.email,
    c.city,
    c.signup_date
FROM customers c
LEFT JOIN `orders` o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;

-- Task 4: Monthly revenue trend (last 6 months)
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS total_revenue
FROM `orders`
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month ASC;

-- Task 5: Products with high return rate (>20%)
SELECT
    p.product_id,
    p.name,
    sold.total_units_sold,
    ret.total_returns,
    ROUND((ret.total_returns / sold.total_units_sold) * 100, 2) AS return_rate_percent
FROM
    (
        SELECT
            product_id,
            SUM(quantity) AS total_units_sold
        FROM order_items
        GROUP BY product_id
    ) sold
JOIN
    (
        SELECT
            product_id,
            COUNT(*) AS total_returns
        FROM `returns`
        GROUP BY product_id
    ) ret
    ON sold.product_id = ret.product_id
JOIN products p
    ON sold.product_id = p.product_id
WHERE (ret.total_returns / sold.total_units_sold) * 100 > 20
ORDER BY return_rate_percent DESC;

-- Task 6: Repeat buyers vs one-time buyers
SELECT
    buyer_type,
    COUNT(*) AS customer_count
FROM
    (
        SELECT
            customer_id,
            CASE
                WHEN COUNT(order_id) >= 2 THEN 'Repeat Buyer'
                WHEN COUNT(order_id) = 1 THEN 'One-Time Buyer'
            END AS buyer_type
        FROM `orders`
        GROUP BY customer_id
    ) x
GROUP BY buyer_type;
