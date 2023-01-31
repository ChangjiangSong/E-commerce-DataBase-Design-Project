-- CREATE SCHEMA DataBaseProject6201;
USE DataBaseProject6201;
SET SQL_SAFE_UPDATES = 0;

-- Drop Table
drop table order_item_refunds;
drop table order_items;
drop table orders;
drop table products;
drop table website_pageviews;
drop table website_sessions;

-- Delete all rows in a Table
delete from website_sessions;
delete from website_pageviews;
delete from order_item_refunds;
delete from order_items;
delete from orders;
delete from products;

-- Creating an empty shell for the table 'website_sessions'. We will populate it later. 
CREATE TABLE website_sessions (
  website_session_id BIGINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  utm_source VARCHAR(12), 
  utm_campaign VARCHAR(20),
  utm_content VARCHAR(15), 
  device VARCHAR(15), 
  PRIMARY KEY (website_session_id)
);

-- delete from website_sessions;
-- select * from website_sessions;

--
-- Creating an empty shell for the table 'website_pageviews'. We will populate it later. 
--

CREATE TABLE website_pageviews (
  website_pageview_id BIGINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL,
  website_session_id BIGINT UNSIGNED NOT NULL,
  pageview_url VARCHAR(50) NOT NULL,
  PRIMARY KEY (website_pageview_id),
  FOREIGN KEY (website_session_id) references website_sessions (website_session_id)
);
-- 1,7,18,20,23,25,15,13,17,21


--
-- Creating an empty shell for the table 'products'. We will populate it later. 
--

CREATE TABLE products (
  product_id BIGINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL,
  product_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (product_id)
);

--
-- Creating an empty shell for the table 'orders'. We will populate it later. 
--
CREATE TABLE orders (
  order_id BIGINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL,
  website_session_id BIGINT UNSIGNED NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  num_purchased SMALLINT UNSIGNED NOT NULL,
  order_rate int,
  price DECIMAL(6,2) NOT NULL,
  cost DECIMAL(6,2) NOT NULL,
  Product_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (website_session_id) references website_sessions (website_session_id),
  FOREIGN KEY (product_id) references products (product_id)
);



--
-- Creating an empty shell for the table 'order_items'. We will populate it later. 
--

CREATE TABLE order_items (
  order_item_id BIGINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL,
  order_id BIGINT UNSIGNED NOT NULL,
  product_id BIGINT UNSIGNED NOT NULL,
  item_price DECIMAL(6,2) NOT NULL,
  item_cost DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (order_item_id),
  FOREIGN KEY (order_id) references orders (order_id),
  FOREIGN KEY (product_id) references products (product_id)
);


--
-- Creating an empty shell for the table 'order_item_refunds'. We will populate it later. 
--

CREATE TABLE order_item_refunds (
  order_item_refund_id BIGINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL,
  order_item_id BIGINT UNSIGNED NOT NULL,
  order_id BIGINT UNSIGNED NOT NULL,
  refund_amount_usd DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (order_item_refund_id),
  FOREIGN KEY (order_id) references orders (order_id),
  FOREIGN KEY (order_item_id) references order_items (order_item_id)
);

show tables; -- Show all the table in the database

-- Insert Data
INSERT INTO website_sessions VALUES 
(1,'2022-03-1 08:04:16',1,'gsearch','nonbrand','g_ad_1','mobile'),
(2,'2022-03-2 18:07:02',2,'gsearch','nonbrand','g_ad_1','mobile'),
(3,'2022-03-2 18:08:27',2,'gsearch','nonbrand','g_ad_1','mobile'),
(4,'2022-03-2 18:20:58',3,'gsearch','nonbrand','g_ad_1','desktop'),
(5,'2022-03-3 18:09:58',3,'gsearch','nonbrand','g_ad_1','desktop'),
(6,'2022-03-4 17:10:58',4,'gsearch','nonbrand','g_ad_1','desktop'),
(7,'2022-03-5 18:10:00',5,'gsearch','nonbrand','g_ad_1','desktop'),
(8,'2022-03-6 12:00:29',6,'gsearch','nonbrand','g_ad_1','mobile'),
(9,'2022-03-6 12:03:50',7,'gsearch','nonbrand','g_ad_1','mobile'),
(10,'2022-03-7 22:43:43',8,'bsearch','brand','b_ad_2','desktop'),
(11,'2022-03-10 22:40:43',9,'bsearch','brand','b_ad_2','desktop'),
(12,'2022-03-11 22:54:43',10,'bsearch','brand','b_ad_2','desktop'),
(13,'2022-03-11 21:55:43',11,'bsearch','brand','b_ad_2','desktop'),
(14,'2022-03-20 20:43:43',12,'bsearch','brand','b_ad_2','desktop'),
(15,'2022-03-23 12:03:50',13,'gsearch','nonbrand','g_ad_1','desktop'),
(16,'2022-03-26 12:28:50',14,'gsearch','nonbrand','g_ad_1','mobile'),
(17,'2022-03-27 10:34:50',15,'gsearch','nonbrand','g_ad_1','mobile'),
(18,'2022-03-27 11:03:50',16,'gsearch','nonbrand','g_ad_1','mobile'),
(19,'2022-03-28 12:04:50',17,'gsearch','nonbrand','g_ad_1','mobile'),
(20,'2022-03-29 09:05:50',17,'gsearch','nonbrand','g_ad_1','mobile'),
(21,'2022-03-29 12:03:50',16,'gsearch','nonbrand','g_ad_1','mobile'),
(22,'2022-03-30 11:05:50',17,'gsearch','nonbrand','g_ad_1','mobile'),
(23,'2022-03-30 12:03:50',18,'gsearch','nonbrand','g_ad_1','mobile'),
(24,'2022-03-30 16:03:02',18,'gsearch','nonbrand','g_ad_1','mobile'),
(25,'2022-03-30 12:03:50',18,'gsearch','nonbrand','g_ad_1','mobile'),
(26,'2022-03-30 12:03:50',19,'gsearch','nonbrand','g_ad_1','desktop'),
(27,'2022-03-30 12:03:50',19,'gsearch','nonbrand','g_ad_1','desktop'),
(28,'2022-03-10 12:03:50',20,'gsearch','nonbrand','g_ad_1','desktop'),
(29,'2022-03-11 11:03:50',20,'gsearch','nonbrand','g_ad_1','desktop'),
(30,'2022-03-11 12:03:50',20,'gsearch','nonbrand','g_ad_1','desktop');

INSERT INTO website_pageviews VALUES 
(1,'2022-03-1 08:05:00',1,'/home'),
(2,'2022-03-1 08:05:05',1,'/products'),
(3,'2022-03-1 08:05:07',1,'/the-original-mr-fuzzy'),
(4,'2022-03-1 08:05:20',1,'/cart'),
(5,'2022-03-1 08:05:26',1,'/shipping'),
(6,'2022-03-1 08:05:31',1,'/billing'),
(7,'2022-03-1 08:05:46',1,'/thank-you-for-your-order'),
(8,'2022-03-2 18:07:02',2,'/home'),
(9,'2022-03-2 18:07:45',2,'/products'),
(10,'2022-03-2 18:08:58',3,'/home'),
(11,'2022-03-2 18:09:58',3,'/products'),
(12,'2022-03-2 18:09:20',3,'/the-original-mr-fuzzy'),
(13,'2022-03-2 18:10:19',3,'/cart'),
(14,'2022-03-2 08:20:33',4,'/home'),
(15,'2022-03-3 18:09:58',5,'/home'),
(16,'2022-03-2 08:22:55',4,'/home'),
(17,'2022-03-5 18:13:21',7,'/home'),
(18,'2022-03-5 18:14:21',7,'/products'),
(19,'2022-03-5 18:15:21',7,'/the-original-mr-fuzzy'),
(20,'2022-03-5 18:16:50',7,'/cart'),
(21,'2022-03-5 18:17:00',7,'/shipping'),
(22,'2022-03-5 18:19:21',7,'/billing'),
(23,'2022-03-5 18:20:21',7,'/thank-you-for-your-order'),
(24,'2022-03-4 17:10:58',6,'/home'),
(25,'2022-03-4 17:12:31',6,'/products'),
(26,'2022-03-4 17:13:30',6,'/the-original-mr-fuzzy'),
(27,'2022-03-4 17:14:40',6,'/cart'),
(28,'2022-03-4 17:15:58',6,'/shipping'),
(29,'2012-03-19 09:17:17',8,'/home'),
(30,'2022-03-4 17:15:58',6,'/billing'),
(31,'2022-03-6 12:03:50',9,'/home'),
(32,'2022-03-7 22:43:43',10,'/home'),
(33,'2022-03-11 21:55:43',11,'/home'),
(34,'2022-03-11 22:45:23',11,'/products'),
(35,'2022-03-11 23:25:00',11,'/the-original-mr-fuzzy'),
(36,'2022-03-11 22:54:43',12,'/home'),
(37,'2022-03-11 21:55:45',13,'/home'),
(38,'2022-03-11 21:56:10',13,'/products'),
(39,'2022-03-11 21:56:20',13,'/the-original-mr-fuzzy'),
(40,'2022-03-11 21:56:30',13,'/cart'),
(41,'2022-03-11 21:57:00',13,'/shipping'),
(42,'2022-03-11 21:57:10',13,'/billing'),
(43,'2022-03-11 21:57:27',13,'/thank-you-for-your-order'),
(44,'2022-03-20 20:43:43',14,'/home'),
(45,'2022-03-23 12:03:50',15,'/home'),
(46,'2022-03-23 12:03:50',15,'/products'),
(47,'2022-03-23 12:03:50',15,'/the-original-mr-fuzzy'),
(48,'2022-03-23 12:03:50',15,'/cart'),
(49,'2022-03-23 12:03:50',15,'/shipping'),
(50,'2022-03-23 12:03:50',15,'/billing'),
(51,'2022-03-23 12:04:41',15,'/thank-you-for-your-order'),
(52,'2012-03-19 10:01:35',16,'/home'),
(53,'2022-03-23 12:03:50',15,'/products'),
(54,'2022-03-23 12:03:50',15,'/the-original-mr-fuzzy'),
(55,'2022-03-26 12:28:50',16,'/products'),
(56,'2022-03-27 10:13:50',17,'/home'),
(57,'2022-03-27 10:14:50',17,'/products'),
(58,'2022-03-27 10:15:50',17,'/the-original-mr-fuzzy'),
(59,'2022-03-27 10:18:55',17,'/cart'),
(60,'2022-03-27 10:19:20',17,'/shipping'),
(61,'2022-03-27 10:20:50',17,'/billing'),
(62,'2022-03-27 10:35:01',17,'/thank-you-for-your-order'),
(63,'2022-03-27 11:03:50',18,'/home'),
(64,'2022-03-28 12:04:50',19,'/home'),
(65,'2022-03-28 12:05:10',19,'/products'),
(66,'2022-03-27 11:04:15',18,'/products'),
(67,'2022-03-27 11:04:30',18,'/the-original-mr-fuzzy'),
(68,'2012-03-19 10:22:58',20,'/home'),
(69,'2022-03-27 11:04:50',18,'/cart'),
(70,'2022-03-27 11:05:00',18,'/shipping'),
(71,'2022-03-27 11:05:10',18,'/billing'),
(72,'2022-03-27 11:05:15',18,'/thank-you-for-your-order'),
(73,'2012-03-19 10:28:09',20,'/products'),
(74,'2012-03-19 10:28:37',20,'/the-original-mr-fuzzy'),
(75,'2012-03-19 10:31:29',20,'/cart'),
(76,'2012-03-19 10:34:43',20,'/shipping'),
(77,'2012-03-19 10:36:31',20,'/billing'),
(78,'2012-03-19 10:42:46',20,'/thank-you-for-your-order'),
(79,'2012-03-19 12:06:50',21,'/home'),
(80,'2022-03-29 12:07:20',21,'/home'),
(81,'2022-03-29 12:07:30',21,'/products'),
(82,'2022-03-29 12:07:50',21,'/the-original-mr-fuzzy'),
(83,'2022-03-29 12:08:10',21,'/cart'),
(84,'2022-03-29 12:09:00',21,'/shipping'),
(85,'2022-03-29 12:09:10',21,'/billing'),
(86,'2022-03-29 12:09:50',21,'/thank-you-for-your-order'),
(87,'2022-03-30 11:05:50',22,'/home'),
(88,'2012-03-19 12:13:15',23,'/home'),
(89,'2022-03-30 12:11:15',23,'/products'),
(90,'2022-03-30 12:11:55',23,'/the-original-mr-fuzzy'),
(91,'2022-03-30 12:12:15',23,'/cart'),
(92,'2022-03-30 12:12:35',23,'/shipping'),
(93,'2022-03-30 12:12:45',23,'/billing'),
(94,'2022-03-30 12:13:15',23,'/thank-you-for-your-order'),
(95,'2022-03-30 16:03:02',24,'/home'),
(96,'2022-03-30 16:03:02',24,'/products'),
(97,'2022-03-30 16:03:02',24,'/the-original-mr-fuzzy'),
(98,'2012-03-19 11:08:30',25,'/home'),
(99,'2022-03-30 12:08:47',25,'/products'),
(100,'2022-03-30 12:09:00',25,'/the-original-mr-fuzzy'),
(101,'2022-03-30 12:09:30',25,'/cart'),
(102,'2022-03-30 12:09:47',25,'/shipping'),
(103,'2022-03-30 12:10:30',25,'/billing'),
(104,'2022-03-30 12:12:47',25,'/thank-you-for-your-order'),
(105,'2022-03-30 12:03:50',26,'/home'),
(106,'2022-03-30 16:03:02',26,'/products'),
(107,'2022-03-30 16:03:02',27,'/home'),
(108,'2022-03-30 16:04:02',27,'/products'),
(109,'2022-03-30 16:05:30',27,'/the-original-mr-fuzzy'),
(110,'2022-03-10 12:03:10',28,'/home'),
(111,'2022-03-10 12:03:50',28,'/product'),
(112,'2022-03-11 11:02:25',29,'/home'),
(113,'2022-03-11 11:03:55',29,'/product'),
(114,'2022-03-11 12:02:25',30,'/home'),
(115,'2022-03-11 12:03:55',30,'/product');


INSERT INTO products VALUES
(1,'2022-02-10 08:00:00','Product_1'),
(2,'2022-02-17 13:00:00','Product_2'),
(3,'2022-02-20 09:00:00','Product_3'),
(4,'2022-02-21 10:00:00','Product_4');

INSERT INTO orders VALUES 
(1,'2022-03-1 08:05:46',1,1,1,5,49.99,29.49,1),
(2,'2022-03-5 18:10:37',7,5,1,3,29.99,10.49,3),
(3,'2022-03-5 18:17:37',7,5,1,2,19.99,9.49,4),
(4,'2022-03-5 18:20:21',7,5,1,1,49.99,29.49,1),
(5,'2022-03-11 21:57:27',13,11,1,4,49.99,29.49,1),
(6,'2022-03-23 12:04:41',15,13,1,2,49.99,29.49,1),
(7,'2022-03-23 13:03:41',15,13,1,2,39.99,19.49,2),
(8,'2022-03-27 10:35:01',17,15,1,3,29.99,10.49,3),
(9,'2022-03-27 11:05:15',18,16,2,1,39.98,18.98,4),
(10,'2022-03-29 09:10:45',20,17,1,5,39.99,19.49,2),
(11,'2022-03-29 09:11:45',20,17,1,5,49.99,29.49,1),
(12,'2022-03-29 12:05:58',21,16,1,5,29.99,10.49,3),
(13,'2022-03-29 12:09:50',21,16,1,3,39.99,19.49,2),
(14,'2022-03-30 12:13:15',23,18,3,5,59.97,28.47,4),
(15,'2022-03-30 12:16:10',23,18,1,3,49.99,29.49,1),
(16,'2022-03-30 12:12:47',25,18,1,5,39.99,19.49,2);


INSERT INTO order_items VALUES 
(1,'2022-03-1 08:05:46',1,1,49.99,29.49),
(2,'2022-03-5 18:10:37',2,3,29.99,10.49),
(3,'2022-03-5 18:17:37',3,4,19.99,9.49),
(4,'2012-03-5 18:20:21',4,1,49.99,29.49),
(5,'2012-03-11 21:57:27',5,1,49.99,29.49),
(6,'2012-03-23 12:04:41',6,1,49.99,29.49),
(7,'2012-03-20 13:03:41',7,2,39.99,19.49),
(8,'2012-03-27 10:35:01',8,3,29.99,10.49),
(9,'2012-03-27 11:05:15',9,4,19.99,9.49),
(10,'2012-03-27 11:05:15',9,4,19.99,9.49),
(11,'2012-03-29 09:10:45',10,2,39.99,19.49),
(12,'2012-03-29 09:11:45',11,1,49.99,29.49),
(13,'2012-03-29 12:05:58',12,3,29.99,10.49),
(14,'2012-03-29 12:09:50',13,2,39.99,19.49),
(15,'2012-03-30 12:13:15',14,4,19.99,9.49),
(16,'2012-03-30 12:13:15',14,4,19.99,9.49),
(17,'2012-03-30 12:13:15',14,4,19.99,9.49),
(18,'2012-03-30 12:16:10',15,1,49.99,29.49),
(19,'2012-03-30 12:12:47',16,2,39.99,19.49);

INSERT INTO order_item_refunds VALUES 
(1,'2012-03-15 11:32:43',4,4,49.99),
(2,'2012-03-30 01:09:43',8,8,29.99),
(3,'2012-04-15 07:03:48',12,11,49.99),
(4,'2012-04-17 20:00:37',14,13,39.99),
(5,'2012-04-18 20:42:24',15,14,19.99),
(6,'2012-04-18 20:42:24',16,14,19.99),
(7,'2012-04-18 20:42:24',17,14,19.99),
(8,'2012-04-22 20:53:49',18,15,49.99);

-- Query 1 find out products who ordered most
ss

-- Query 2 What products are most likely to be returned

select 
    p.product_name,
    count(*) product_count
from order_item_refunds o1 
join order_items o2 on o1.order_item_id = o2.order_item_id 
join products p on o2.product_id = p.product_id
group by
	1
order by count(*) desc
limit 1;

-- Query 3 Which weekday ordered most (weekday)
select
	weekday(str_to_date(created_at,'%Y-%m-%d')) weekday_ordered,
    count(*) cn
from 
	orders
group by
	1
order by 
	2 desc
limit 1; -- weekday range: 0-6, 0 means Monday, 6 means Sunday

-- Query 4 The net profit for each product in 2022-03
select
	product_id,
    sum(item_price - item_cost) sum_net_profit
from 
	order_items
group by 1;

-- Query 5 Coversion Funnel

/*
STEP 1: select all pageviews for relevant sessions
STEP 2: identify each relevant pageview as the specific funnel step
STEP 3: create the session - level conversion funnel view
STEP 4: aggregate the date to assess funnel performance
*/

-- Step1
select
	ws.website_session_id,
	wp.pageview_url,
    case when pageview_url = '/products'then 1 else 0 end as products_page,
    case when pageview_url = '/the-original-mr-fuzzy' then 1 else 0 end as mrfuzzy_page,
    case when pageview_url = '/cart' then 1 else 0 end as cart_page,
    case when pageview_url = '/shipping' then 1 else 0 end as shipping_page,
    case when pageview_url = '/billing' then 1 else 0 end as billing_page,
    case when pageview_url = '/thank-you-for-your-order' then 1 else 0 end as thankyou_page
from website_sessions ws
	left join website_pageviews wp
    on ws.website_session_id = wp.website_session_id
where ws.created_at between '2022-03-01' And '2022-03-30' 
Order by
	ws.website_session_id,
    wp.created_at;
    
-- Step2
create temporary table t2
select
	website_session_id,
	max(products_page) product_made,
    max(mrfuzzy_page) mrfuzzy_made,
    max(cart_page) cart_made,
    max(shipping_page) shipping_made,
    max(billing_page) billing_page,
    max(thankyou_page) thankyou_page
from
	(
select
	ws.website_session_id,
	wp.pageview_url,
    case when pageview_url = '/products'then 1 else 0 end as products_page,
    case when pageview_url = '/the-original-mr-fuzzy' then 1 else 0 end as mrfuzzy_page,
    case when pageview_url = '/cart' then 1 else 0 end as cart_page,
    case when pageview_url = '/shipping' then 1 else 0 end as shipping_page,
    case when pageview_url = '/billing' then 1 else 0 end as billing_page,
    case when pageview_url = '/thank-you-for-your-order' then 1 else 0 end as thankyou_page
from website_sessions ws
	left join website_pageviews wp
    on ws.website_session_id = wp.website_session_id
where ws.created_at between '2022-03-01' And '2022-03-30' 
Order by
	ws.website_session_id,
    wp.created_at
    ) t
Group by
	website_session_id;

-- Clicked Number
select
	count(distinct website_session_id),
	count(distinct case when product_made = 1 then website_session_id else null end) to_product_page,
    count(distinct case when mrfuzzy_made = 1 then website_session_id else null end) to_mrfuzzy_page,
    count(distinct case when cart_made =1 then website_session_id else null end) to_cart_page,
    count(distinct case when shipping_made = 1 then website_session_id else null end) to_shipping_page,
    count(distinct case when billing_page = 1 then website_session_id else null end) to_billing_page,
    count(distinct case when thankyou_page = 1 then website_session_id else null end) to_thankyou_page
from
	t2;
    
-- Clicked Rate
select
	count(distinct case when product_made = 1 then website_session_id else null end)/count(distinct website_session_id) to_product,
    count(distinct case when mrfuzzy_made = 1 then website_session_id else null end)/count(distinct case when product_made = 1 then website_session_id else null end) to_mrfuzzy,
    count(distinct case when cart_made =1 then website_session_id else null end)/count(distinct case when mrfuzzy_made = 1 then website_session_id else null end) to_cart,
    count(distinct case when shipping_made = 1 then website_session_id else null end)/count(distinct case when cart_made =1 then website_session_id else null end) to_shipping,
    count(distinct case when billing_page = 1 then website_session_id else null end)/count(distinct case when shipping_made = 1 then website_session_id else null end) to_billing,
    count(distinct case when thankyou_page = 1 then website_session_id else null end)/count(distinct case when billing_page = 1 then website_session_id else null end) to_thankyou
from
	t2;
