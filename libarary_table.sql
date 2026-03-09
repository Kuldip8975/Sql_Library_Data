
 --LIBRARY MANAGEMENT SYSTEM--

CREATE TABLE BRANCH(
	branch_id varchar(10),
	manager_id varchar(10),
	branch_address varchar(10),
	contact_no vaa

)
select * FROM BRANCH;

-- Foriagn Key--
alter table issued_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id);


alter table issued_status
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_employee
foreign key (issued_emp_id)
references employee(emp_id);

alter table employee
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id);

alter table return_status
add constraint fk_issued_status
foreign key (issued_id)
references issued_status(issued_id);

--




alter table books alter category type varchar(20);

select count(*) from books;


ALTER TABLE books 
ALTER COLUMN book_title TYPE VARCHAR(200),
ALTER COLUMN category TYPE VARCHAR(100),
ALTER COLUMN author TYPE VARCHAR(100),
ALTER COLUMN publisher TYPE VARCHAR(200);
------------------------------------------------------------------------------
ALTER TABLE branch
ALTER COLUMN contact_no TYPE VARCHAR(15);

select count(*) from branch;
----------------------------------------------------------------------------------

ALTER TABLE employee
ALTER COLUMN salary TYPE NUMERIC(10,2);

select * from employee;
-----------------------------------------------------------------------------------
ALTER TABLE issued_status
ALTER COLUMN issued_book_id TYPE TEXT;

ALTER TABLE issued_status
ALTER COLUMN issued_book_isbn TYPE VARCHAR(20);
--------------------------------------------------------------------

select count(*) from members;

select * from return_status;

select * from issued_status;

TRUNCATE TABLE return_status, issued_status CASCADE;



















