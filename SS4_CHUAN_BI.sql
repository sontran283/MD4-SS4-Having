CREATE DATABASE SS4_CHUAN_BI;
USE SS4_CHUAN_BI;

-- SUM() 
select SUM(quantity) from order_details;

-- AVG() tính giá trị trung bình 
select AVG(quantity) from order_details;

-- COUNT()  được sử dụng để đếm số bản ghi
SELECT COUNT(id)FROM products;
SELECT COUNT(*)FROM products;

-- MAX()
SELECT MAX(price) FROM products;

-- MIN() 
SELECT MIN(price) AS smallestPrice FROM product;

-- NOW() trả về ngày giờ hiện tại
SELECT name, price , Now() AS perDate FROM products;

-- LEN() trả về độ dài (số lượng ký tự) của một chuỗi
SELECT name, LEN(address) as lengthOfAddres FROM customers;

-- UCASE() chuyển một chuỗi thành chữ viết hoa (uppercase)
SELECT UCASE(name) AS customer FROM customers;

-- LCASE() chuyển một chuỗi thành chữ viết thuờng (lowercase)
SELECT LCASE(name) AS customer FROM customers;

-- GROUP BY  
-- GROUP BY  
-- để nhóm các hàng dữ liệu dựa trên giá trị của một hoặc nhiều cột ( vd: đếm số lượng nhân viên trong mỗi phòng ban)
-- Hiển thị nhà cung cấp và số lượng sản phẩm được cung cấp bởi từng nhà cung cấp, sắp xếp theo thứ tự tăng dần nhà cung cấp,
-- cho tất cả các hãng Motorcyrcles
select productVendor, count(productcode) from product
where productline = 'Motorcycles'
group by productVendor
order by productVendor;

-- dữ liệu được nhóm theo phòng ban và sau đó tính trung bình lương trong mỗi phòng ban.
SELECT department, AVG(salary) as average_salary
FROM employees
GROUP BY department;

-- đếm số lượng nhân viên trong mỗi phòng ban.
SELECT department, COUNT(*) as employee_count
FROM employees
GROUP BY department;

-- tìm lương cao nhất trong mỗi phòng ban.
SELECT department, MAX(salary) as max_salary
FROM employees
GROUP BY department;

-- nhóm dữ liệu theo nhiều cột, chẳng hạn như phòng ban và chức danh công việc.
SELECT department, job_title, AVG(salary) as average_salary
FROM employees
GROUP BY department, job_title;


-- HAVING
-- HAVING
-- Hiển thị nhà cung cấp và số lượng sản phẩm lớn hơn 10 được cung cấp bởi từng nhà cung cấp, sắp xếp theo thứ tự tăng dần nhà cung cấp, 
-- cho tất cả các hãng Motorcyrcles
select productVendor, count(productcode) from product
where productline = 'Motorcycles'
group by productVendor
having count(productCode) > 10
order by productVendo;

-- lấy danh sách các khách hàng và tổng số tiền của họ trong các đơn đặt hàng, nhưng chỉ bao gồm những khách hàng có tổng số tiền lớn hơn 1000
CREATE TABLE orders (
customer_id int primary key,
order_date date,
total_amount int
);
insert into orders values(1,'2023-2-2',12000);
insert into orders values(2,'2023-2-2',11000);
insert into orders values(3,'2023-2-2',10000);

select customer_id,sum(total_amount) as total
from orders
group by customer_id
having sum(total_amount)>10000;

