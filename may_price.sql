USE amazon_ecommerce;

-- 1.What is the average price of products across different platforms.
SELECT 
ROUND(AVG(amazon_mrp),2) AS amazon_mrp,
ROUND(AVG(flipkart_mrp),2) AS flipkart_mrp,
ROUND(AVG(myntra_mrp),2) AS myntra_mrp,
ROUND(AVG(ajio_mrp),2) AS ajio_avg
FROM may_price;

-- 2.Which products have the highest price on amazon
SELECT style_id, amazon_mrp
FROM may_price
GROUP BY style_id,amazon_mrp
ORDER BY amazon_mrp DESC
LIMIT 5 ;

-- 3. What is the price difference between Amazon and flipkart for each product
SELECT style_id,
amazon_mrp,
flipkart_mrp,
amazon_mrp - flipkart_mrp AS price_difference
FROM may_price;

-- 4.Which platform offers the lowest price for each product
SELECT style_id,
LEAST(amazon_mrp, flipkart_mrp, myntra_mrp, ajio_mrp) AS lowest_price
FROM may_price
ORDER BY lowest_price ASC; 

-- 5. Which products have a price difference greater than 500 between platforms
SELECT style_id,
ABS(amazon_mrp - flipkart_mrp) AS price_gap
FROM may_price
WHERE ABS(amazon_mrp - flipkart_mrp) >  500;

