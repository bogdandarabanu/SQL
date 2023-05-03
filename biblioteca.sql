--1
select distinct Students.student_name from Students
inner join Borrow on Students.student_id=Borrow.student_id

--2
select title from Items 
where item_id not in
(select item_id from Borrow where return_date IS NULL)

--3
select Students.student_name from Students
inner join Borrow on Students.student_id=Borrow.student_id
inner join Items on Borrow.item_id=Items.item_id
where Items.item_type ='Book' and YEAR(borrow_date) = YEAR(GETDATE())
group by Students.student_name
having count(*) > 100;

--4
select count(*) from(select item_id from Borrow
group by item_id having count(*) >=10) as AtLeastBorrowed10

--5
select title from Items 
where item_id not in
(select item_id from Borrow)

--6
select count(*) from items
where item_type = 'Magazine'

--7
select title from Items 
inner join Borrow on Items.item_id=Borrow.item_id
where item_type= 'Book' and return_date IS NULL;

--8
select title, count(*) as recurrency from Items
inner join Borrow on Items.item_id=Borrow.item_id
where item_type='Magazine' and YEAR(borrow_date) = YEAR(GETDATE() -1)
group by title

--9
select count(distinct student_id) as borrowed5items from Borrow
where borrow_id in(
select top 5 borrow_id from Borrow
where item_id in (
select item_id from Borrow
group by item_id
having count(distinct student_id) >1
)
order by borrow_date DESC)

