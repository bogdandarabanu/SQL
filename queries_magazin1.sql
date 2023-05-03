--1
select first_name, last_name from Clients

--2
select * from Products where expiration_date > GETDATE()

--3
select product_name from Products

--4
select distinct product_name from Products

--5
select Clients.first_name, Clients.last_name from Clients
inner join Orders on Clients.client_id = Orders.client_id
where total_price > 50

--6
select Products.product_name from Order_details
inner join Products on Order_details.product_id=Products.product_id
where Order_details.order_id = 1

--7
select COUNT(*) as NrOrders from Orders
join Order_details on Orders.order_id=Order_details.order_id
group by Orders.order_id
having sum(Order_details.quantity) > 10;

--8
select COUNT(*) as AndreiOrders from Orders
join Clients on Orders.client_id=Clients.client_id
where (Clients.first_name) = 'Andrei'

