### Limits
/*
Try it yourself below by writing a query that limits the response to only the
first 15 rows and includes the occurred_at, account_id, and channel fields in
the web_events table.
*/
SELECT
	occurred_at, account_id, channel
FROM
	web_events
LIMIT 15;

### ORDER BY - Part 1
/*
Write a query to return the 10 earliest orders in the orders table. Include the
id, occurred_at, and total_amt_usd.
*/
SELECT
	id, occurred_at, total_amt_usd
FROM
	orders
ORDER BY
  occurred_at
LIMIT 10;
/*
Write a query to return the top 5 orders in terms of largest total_amt_usd.
Include the id, account_id, and total_amt_usd.
*/
SELECT
	id, account_id, total_amt_usd
FROM
	orders
ORDER BY
  total_amt_usd desc
LIMIT 5;
/*
Write a query to return the bottom 20 orders in terms of least total. Include
the id, account_id, and total.
*/
SELECT
	id, account_id, total
FROM
	orders
ORDER BY
  total
LIMIT 20;

### ORDER BY - Part 2
/*
Write a query that returns the top 5 rows from orders ordered according to
newest to oldest, but with the largest total_amt_usd for each date listed first
for each date.
*/
SELECT
  id, occurred_at, total_amt_usd
FROM
  orders
ORDER BY
  occurred_at desc, total_amt_usd desc
LIMIT 5;
/*
Write a query that returns the top 10 rows from orders ordered according to
oldest to newest, but with the smallest total_amt_usd for each date listed first
for each date.
*/
SELECT
  id, occurred_at, total_amt_usd
FROM
  orders
ORDER BY
  occurred_at, total_amt_usd
LIMIT 10;

### WHERE
/*
Pull the first 5 rows and all columns from the orders table that have a dollar
amount of gloss_amt_usd greater than or equal to 1000.
*/
SELECT
  *
FROM
  orders
WHERE
  gloss_amt_usd >= 1000
LIMIT 5;
/*
Pull the first 10 rows and all columns from the orders table that have a
total_amt_usd less than 500.
*/
SELECT
  *
FROM
  orders
WHERE
  total_amt_usd < 500
LIMIT 10;

### WHERE with Non-numeric
/*
Filter the accounts table to include the company name, website, and the primary
point of contact (primary_poc) for Exxon Mobil in the accounts table.
*/
SELECT
  name, website, primary_poc
FROM
  accounts
WHERE
  name = 'Exxon Mobil'

### Arithmetic Operators
/*
Create a column that divides the standard_amt_usd by the standard_qty to find
the unit price for standard paper for each order. Limit the results to the first
10 orders, and include the id and account_id fields.
*/

SELECT
  id, account_id, standard_amt_usd/standard_qty as unit_price
FROM
  orders
LIMIT 10;

/*
Write a query that finds the percentage of revenue that comes from poster paper
for each order. You will need to use only the columns that end with _usd. (Try
to do this without using the total column). Include the id and account_id
fields. NOTE - you will be thrown an error with the correct solution to this
question. This is for a division by zero.
*/
SELECT
  id, account_id,
  (standard_amt_usd+glossy_amt_usd+poster_amt_usd)/poster_amt_usd as unit_price
FROM
  orders;
# temporary suggested workaround to divide by zero
SELECT
  id, account_id,
  poster_amt_usd/(standard_amt_usd+gloss_amt_usd+poster_amt_usd+0.0000001)
    as poster_percent
FROM
  orders;

/*

*/
