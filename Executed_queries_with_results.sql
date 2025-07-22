-- 1) Retrieve vehicle details with transport type
SELECT V.Vid, V.Capacity, T.Type   
FROM Vehicle V   
JOIN Transport_Type T ON V.Tid = T.Tid;

-- Output: Vehicle ID, Capacity, and Transport Type for all vehicles


-- 2) Retrieve passengers with booked tickets
SELECT P.Pid, P.Pname, P.Email   
FROM Passenger P   
JOIN Ticket_Passenger TP ON P.Pid = TP.Pid   
JOIN Ticket T ON TP.Ticketid = T.Ticketid   
WHERE T.Status = 'Booked';

-- Output: Passenger ID, Name, and Email of passengers with booked tickets


-- 3) Calculate total fare by transport type for booked tickets
SELECT TT.Type, SUM(T.Fare) AS TotalFare   
FROM Ticket T   
JOIN Ticket_Route TR ON T.Ticketid = TR.Ticketid   
JOIN Vehicle V ON TR.Vid = V.Vid   
JOIN Transport_Type TT ON V.Tid = TT.Tid   
WHERE T.Status = 'Booked'   
GROUP BY TT.Type;

-- Output: Total fare collected grouped by transport type (only booked tickets)


-- 4) Find long routes (> 200 km)
SELECT *   
FROM Route   
WHERE Distance > 200;

-- Output: All routes where the distance is greater than 200 km


-- 5) Retrieve driver and vehicle details
SELECT D.Did, D.Dname, V.Vid, V.Capacity   
FROM Driver D   
JOIN Driver_Vehicle DV ON D.Did = DV.Did   
JOIN Vehicle V ON DV.Vid = V.Vid;

-- Output: Driver ID, Name, Vehicle ID, and Capacity for all driver-vehicle pairs


-- 6) Retrieve completed payments
SELECT P.Paymentid, P.Paydate, P.Amount, P.Paymethod, P.Paystatus   
FROM Payment P   
WHERE P.Paystatus = 'Completed';

-- Output: All payment records with status marked 'Completed'


-- 7) Retrieve passengers with pending payments
SELECT DISTINCT PA.Pid, PA.Pname, PA.Email   
FROM Passenger PA   
JOIN Payment P ON PA.Pid = P.Pid   
WHERE P.Paystatus = 'Pending';

-- Output: Unique list of passengers who have pending payments


-- 8) Find routes starting in Belgaum
SELECT *   
FROM Route   
WHERE StartLoc = 'Belgaum';

-- Output: All routes that begin from Belgaum


-- 9) Find transport types with maximum vehicle capacity
SELECT TT.Type, MAX(V.Capacity) AS MaxCapacity   
FROM Vehicle V   
JOIN Transport_Type TT ON V.Tid = TT.Tid   
GROUP BY TT.Type   
ORDER BY MaxCapacity DESC;

-- Output: Transport type and its highest vehicle capacity, in descending order


-- 10) Retrieve detailed ticket and route info for passengers
SELECT P.Pid, P.Pname, T.Ticketid, T.No_of_seats, T.Fare, R.StartLoc, R.EndLoc   
FROM Passenger P   
JOIN Ticket_Passenger TP ON P.Pid = TP.Pid   
JOIN Ticket T ON TP.Ticketid = T.Ticketid   
JOIN Ticket_Route TR ON T.Ticketid = TR.Ticketid   
JOIN Route R ON TR.Rid = R.Rid;

-- Output: Passenger details along with their ticket and corresponding route info


-- 11) Find drivers by phone number starting with '12'
SELECT *   
FROM Driver   
WHERE Dphno LIKE '12%';

-- Output: All drivers whose phone number starts with '12'


-- 12) Find tickets with fare greater than 200
SELECT *   
FROM Ticket   
WHERE Fare > 200;

-- Output: Tickets where fare is greater than ₹200


-- 13) Find vehicles with low capacity (< 100)
SELECT *   
FROM Vehicle   
WHERE Capacity < 100;

-- Output: Vehicles with capacity less than 100


-- 14) Find routes ending in Goa
SELECT *   
FROM Route   
WHERE EndLoc = 'Goa';

-- Output: All routes that end at Goa


-- 15) Find passengers with Gmail addresses
SELECT *   
FROM Passenger   
WHERE Email LIKE '%gmail.com';

-- Output: Passengers whose email ends with gmail.com


-- 16) Retrieve all transport types
SELECT *   
FROM Transport_Type;

-- Output: All records from the Transport_Type table


-- 17) Find a specific ticket (Ticket ID 501)
SELECT *   
FROM Ticket   
WHERE Ticketid = 501;

-- Output: Full details of the ticket with ID 501


-- 18) Show transport type as Train
SELECT *   
FROM Transport_Type   
WHERE Type = 'Train';

-- Output: Record of transport type "Train"


-- 19) List passenger names and ticket status
SELECT P.Pname, T.Status   
FROM Passenger P   
JOIN Ticket_Passenger TP ON P.Pid = TP.Pid   
JOIN Ticket T ON TP.Ticketid = T.Ticketid;

-- Output: Passenger name along with their ticket booking status


-- 20) Retrieve vehicles and their drivers
SELECT V.Vid, V.Capacity, D.Dname   
FROM Vehicle V   
JOIN Driver_Vehicle DV ON V.Vid = DV.Vid   
JOIN Driver D ON DV.Did = D.Did;

-- Output: Vehicle ID, capacity, and assigned driver name


-- 21) Find tickets and associated routes
SELECT T.Ticketid, R.StartLoc, R.EndLoc   
FROM Ticket T   
JOIN Ticket_Route TR ON T.Ticketid = TR.Ticketid   
JOIN Route R ON TR.Rid = R.Rid;

-- Output: Ticket ID and corresponding route (start and end locations)


-- 22) Retrieve payment methods for completed payments
SELECT P.Pname, Pay.Paymethod   
FROM Passenger P   
JOIN Payment Pay ON P.Pid = Pay.Pid   
WHERE Pay.Paystatus = 'Completed';

-- Output: Passenger name and payment method for completed transactions


-- 23) Count tickets by status
SELECT Status, COUNT(*) AS TotalTickets   
FROM Ticket   
GROUP BY Status;

-- Output: Count of tickets grouped by status (e.g., Booked, Pending)


-- 24) Calculate total revenue (completed payments only)
SELECT SUM(Amount) AS TotalRevenue   
FROM Payment   
WHERE Paystatus = 'Completed';

-- Output: Total revenue collected from completed payments


-- 25) Calculate average fare for booked tickets
SELECT AVG(Fare) AS AverageFare   
FROM Ticket   
WHERE Status = 'Booked';

-- Output: Average fare for all tickets with status 'Booked'


-- 26) Find passengers traveling long distances (> 300 km)
SELECT P.Pname   
FROM Passenger P   
WHERE P.Pid IN (   
    SELECT TP.Pid   
    FROM Ticket_Passenger TP   
    JOIN Ticket T ON TP.Ticketid = T.Ticketid   
    JOIN Ticket_Route TR ON T.Ticketid = TR.Ticketid   
    JOIN Route R ON TR.Rid = R.Rid   
    WHERE R.Distance > 300   
);

-- Output: Names of passengers who are traveling on routes with distance > 300 km


-- 27) Find vehicle with maximum capacity
SELECT Vid   
FROM Vehicle   
WHERE Capacity = (   
    SELECT MAX(Capacity)   
    FROM Vehicle   
);

-- Output: Vehicle ID of the vehicle with the highest capacity


-- 28) Find drivers with recent activity (tickets issued after Dec 3, 2024)
SELECT D.Dname   
FROM Driver D   
WHERE D.Did IN (   
    SELECT DV.Did   
    FROM Driver_Vehicle DV   
    JOIN Vehicle V ON DV.Vid = V.Vid   
    JOIN Ticket_Route TR ON V.Vid = TR.Vid   
    JOIN Ticket T ON TR.Ticketid = T.Ticketid   
    WHERE T.Issueddate > '2024-12-03'   
);

-- Output: Driver names who were assigned to vehicles used in tickets issued after Dec 3, 2024


-- 29) Find tickets with pending payments
SELECT T.Ticketid   
FROM Ticket T   
WHERE T.Ticketid IN (   
    SELECT Pay.Ticketid   
    FROM Payment Pay   
    WHERE Pay.Paystatus = 'Pending'   
);

-- Output: IDs of tickets where payment status is still pending


-- 30) Find passengers traveling from Belgaum to Bangalore
SELECT P.Pname   
FROM Passenger P   
WHERE P.Pid IN (   
    SELECT TP.Pid   
    FROM Ticket_Passenger TP   
    JOIN Ticket_Route TR ON TP.Ticketid = TR.Ticketid   
    JOIN Route R ON TR.Rid = R.Rid   
    WHERE R.StartLoc = 'Belgaum' AND R.EndLoc = 'Bangalore'   
);

-- Output: Names of passengers traveling on the route from Belgaum to Bangalore
