select * from books;

select * from branch;

select * from employee;

select * from issued_status;

select * from members;

select * from return_status;


 -- Project Task

-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

insert into books(isbn,book_title,category,rental_price,status,author,publisher)
values
	('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

select * from books;

-- Task 2: Update an Existing Member's Address

select * from members;

UPDATE members
SET member_address = '560 Main street'
WHERE member_id = 'C101';
SELECT * FROM members;


-- Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

select * from issued_status;

delete from issued_status  where issued_id = 'IS121';


-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.

select * from issued_status;

select * from issued_status where issued_emp_id = 'E101';


-- Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.

select * from issued_status;

select 
	issued_emp_id
	from issued_status
	group by issued_emp_id
	having count(issued_id) > 1;



-- CTAS
-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

CREATE TABLE book_cnts
AS    
SELECT 
    b.isbn,
    b.book_title,
    COUNT(ist.issued_id) as no_issued
FROM books as b
JOIN
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1, 2;


SELECT * FROM
book_cnts;

-- Task 7. Retrieve All Books in a Specific Category:

select * from books;

select * from books where category = 'Classic';

select count(1) from books where category = 'Classic';


select count(*),category,sum(rental_price) as total_income  from books group by category ;


-- List Members Who Registered in the Last 180 Days:


SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '180 days'



-- task 10 List Employees with Their Branch Manager's Name and their branch details:

select * from employee;

select * from branch;

SELECT 
    e1.*,
    b.manager_id,
    e2.emp_name as manager
FROM employee as e1
JOIN  
branch as b
ON b.branch_id = e1.branch_id
JOIN
employee as e2
ON b.manager_id = e2.emp_id
































