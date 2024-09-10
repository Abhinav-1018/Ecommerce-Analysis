--create database EcommerceDB

--select distinct customer_city from customers

--select count (order_id) from orders where year(order_purchase_timestamp)=2017

/*select products.product_category category, round(sum(payments.payment_value),2) sales
from products 
join order_items on products.product_id= order_items.product_id
join payments on payments.order_id = order_items.order_id
group by product_category;*/

--select sum(case when payment_installments>=1 then 1 else 0 end)*100.0/count(*) from payments

/*select customer_state, count(customer_id) as customers from customers
group by customer_state 
order by count(customer_id) desc;*/

/*select month(order_purchase_timestamp) months, count(order_id) orders from orders where year(order_purchase_timestamp)=2018
group by month(order_purchase_timestamp);*/

/*with product_per_order as  
(select order_items.order_id, orders.customer_id, count(order_items.order_item_id) as order_count
from order_items join orders 
on order_items.order_id= orders.order_id
group by order_items.order_id, orders.customer_id)

select customers.customer_city, AVG(product_per_order.order_count) avg_oc 
from customers join product_per_order
on customers.customer_id =product_per_order.customer_id 
group by customers.customer_city;*/

/*with product_per_order as  
(select order_items.order_id, orders.customer_id, count(order_items.order_item_id) as order_count
from order_items join orders 
on order_items.order_id= orders.order_id
group by order_items.order_id, orders.customer_id)

select customers.customer_city, AVG(product_per_order.order_count) avg_oc 
from customers join product_per_order
on customers.customer_id =product_per_order.customer_id 
group by customers.customer_city;*/

/*select products.product_category, count(order_items.product_id) number, round(avg(order_items.price),2) price
from products join order_items 
on products.product_id = order_items.product_id
group by products.product_category;*/

/*select *, rank() over(order by revenue desc) as ranking from
(select sellers.seller_id, sum(payments.payment_value) revenue
from sellers 
join order_items on sellers.seller_id = order_items.seller_id
join payments on payments.order_id = order_items.order_id
group by sellers.seller_id) as answer;*/

/*select *, avg(payment) over(partition by customer_id order by order_purchase_timestamp rows between 3 preceding and current row) as mov_avg from
(select orders.customer_id, orders.order_purchase_timestamp, payments.payment_value payment
from orders join payments on orders.order_id= payments.order_id) as answer;*/

/*select *, sum(sales) over(order by years, months) cum_sales from
(select year(orders.order_purchase_timestamp) as years, month(orders.order_purchase_timestamp) as months, round(sum(payments.payment_value),2) sales 
from orders join payments on orders.order_id= payments.order_id
group by year(orders.order_purchase_timestamp), month(orders.order_purchase_timestamp)) as answer;*/

/*with yearly_sales as (select year(orders.order_purchase_timestamp) as years, round(sum(payments.payment_value),2) sales 
from orders join payments on orders.order_id= payments.order_id
group by year(orders.order_purchase_timestamp))

select *, (((sales-lag(sales) over(order by years))/lag(sales) over(order by years))*100) yoy_growth from yearly_sales;*/

/*select * from 
(select year(orders.order_purchase_timestamp) years, orders.customer_id, sum(payments.payment_value) payments, 
RANK() over(partition by year(orders.order_purchase_timestamp) order by sum(payments.payment_value) desc) rank
from orders join payments
on orders.order_id = payments.order_id
group by year(orders.order_purchase_timestamp), orders.customer_id) as rec 
where rank<=3;*/