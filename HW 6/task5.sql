1. SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS bill_count
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

2. SELECT t.room_name, COUNT(t.table_no) AS table_count
FROM restRest_table t
WHERE t.no_of_seats > 6
GROUP BY t.room_name;

3. SELECT t.room_name, SUM(b.bill_total) AS total_bills
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
GROUP BY t.room_name;

4. SELECT hw.first_name, hw.surname, SUM(b.bill_total) AS total_bills
FROM restStaff hw
JOIN restStaff w ON hw.staff_no = w.headwaiter
JOIN restBill b ON w.staff_no = b.waiter_no
GROUP BY hw.first_name, hw.surname
ORDER BY total_bills DESC;

5. SELECT b.cust_name, AVG(b.bill_total) AS average_spent
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

6. SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS bill_count
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 3;

