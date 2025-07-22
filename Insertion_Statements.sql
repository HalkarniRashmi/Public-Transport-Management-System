-- Transport_Type table
INSERT INTO Transport_Type VALUES   
(1, 'Bus'),   
(2, 'Train'),   
(3, 'Taxi'),   
(4, 'Flight'),   
(5, 'Ship'); 

-- Vehicle table
INSERT INTO Vehicle VALUES   
(101, 50, 1),   
(102, 200, 2),   
(103, 4, 3),   
(104, 150, 4),   
(105, 300, 5); 

-- Route table
INSERT INTO Route VALUES   
(201, 'Belgaum', 'Bangalore', 300.5, '10:00:00', '07:00:00'),   
(202, 'Gokak', 'Shivamogga', 400.0, '12:00:00', '08:00:00'),   
(203, 'Karwar', 'Hampi', 200.2, '03:30:00', '06:00:00'),   
(204, 'Ramnagar', 'Hospet', 150.0, '09:00:00', '07:00:00'),   
(205, 'Belgaum', 'Goa', 220.3, '11:45:00', '09:30:00'); 

-- Driver table
INSERT INTO Driver VALUES   
(301, 'Rajesh Yadav', '1237902360', 'A12345'),   
(302, 'Harish Raj', '9876543210', 'B54321'),   
(303, 'Vijay Das', '5101234567', 'C98765'),   
(304, 'Iyer Swamy', '6107890123', 'D87654'),   
(305, 'Kiran Patil', '4915678901', 'E34567'); 

-- Driver_Vehicle table
INSERT INTO Driver_Vehicle VALUES   
(101, 301),   
(102, 302),   
(103, 303),   
(104, 304),   
(105, 305); 

-- Passenger table
INSERT INTO Passenger VALUES   
(401, 'Rashi Singh', '1478423733', 'rashi@gmail.com'),   
(402, 'Harsh Jadhav', '2409332456', 'harsh@gmail.com'),   
(403, 'Raj Sharma', '3621785059', 'raj@gmail.com'),   
(404, 'Ananya Kumar', '1406589266', 'ananya@gmail.com'),   
(405, 'Madhvi Kadam', '1296960547', 'madhvi@gmail.com'); 

-- Ticket table
INSERT INTO Ticket VALUES   
(501, 2, 100.5, 'Booked', '2024-12-01'),   
(502, 1, 50.0, 'Canceled', '2024-12-02'),   
(503, 4, 400.0, 'Booked', '2024-12-03'),   
(504, 3, 300.0, 'Pending', '2024-12-04'),   
(505, 1, 150.0, 'Booked', '2024-12-05'); 

-- Ticket_Passenger table
INSERT INTO Ticket_Passenger VALUES   
(501, 401),   
(502, 402),   
(503, 403),   
(504, 404),   
(505, 405); 

-- Ticket_Route table
INSERT INTO Ticket_Route VALUES   
(501, 101, 201),   
(502, 102, 202),   
(503, 103, 203),   
(504, 104, 204),   
(505, 105, 205);  

-- Payment table
INSERT INTO Payment VALUES   
(601, 401, '2024-12-06', 100.5, 'Credit Card', 'Completed', 501),   
(602, 402, '2024-12-07', 50.0, 'Debit Card', 'Failed', 502),   
(603, 403, '2024-12-08', 400.0, 'UPI', 'Completed', 503),   
(604, 404, '2024-12-09', 300.0, 'Net Banking', 'Pending', 504),   
(605, 405, '2024-12-10', 150.0, 'Cash', 'Completed', 505);
