-- Table for storing types of transport (e.g., Bus, Train, etc.)
CREATE TABLE Transport_Type (   
    Tid INT PRIMARY KEY,   
    Type VARCHAR(50)  
);  

-- Table for storing vehicles and their capacities and transport type
CREATE TABLE Vehicle (   
    Vid INT PRIMARY KEY,   
    Capacity INT,   
    Tid INT,   
    FOREIGN KEY (Tid) REFERENCES Transport_Type(Tid)  
);  

-- Table for storing route information including start/end locations and timings
CREATE TABLE Route (   
    Rid INT PRIMARY KEY,   
    StartLoc VARCHAR(100),   
    EndLoc VARCHAR(100),   
    Distance FLOAT,   
    ArrivalTime TIME,   
    DepartureTime TIME  
);  

-- Table for storing driver details including name, phone number, and license
CREATE TABLE Driver (   
    Did INT PRIMARY KEY,   
    Dname VARCHAR(100),   
    Dphno VARCHAR(15),   
    License_no VARCHAR(50)  
);  

-- Table for mapping drivers to the vehicles they drive (many-to-many relationship)
CREATE TABLE Driver_Vehicle (   
    Vid INT,   
    Did INT,   
    PRIMARY KEY (Vid, Did),   
    FOREIGN KEY (Vid) REFERENCES Vehicle(Vid),   
    FOREIGN KEY (Did) REFERENCES Driver(Did)  
);  

-- Table for storing passenger details
CREATE TABLE Passenger (   
    Pid INT PRIMARY KEY,   
    Pname VARCHAR(100),   
    Pphno VARCHAR(15),   
    Email VARCHAR(100)  
);  

-- Table for storing ticket details like number of seats, fare, and booking status
CREATE TABLE Ticket (   
    Ticketid INT PRIMARY KEY,   
    No_of_seats INT,   
    Fare FLOAT,   
    Status VARCHAR(20),   
    Issueddate DATE  
);  

-- Table for mapping passengers to their tickets (many-to-many relationship)
CREATE TABLE Ticket_Passenger (   
    Ticketid INT,   
    Pid INT,   
    PRIMARY KEY (Ticketid, Pid),   
    FOREIGN KEY (Ticketid) REFERENCES Ticket(Ticketid),   
    FOREIGN KEY (Pid) REFERENCES Passenger(Pid)  
);  

-- Table for mapping tickets to routes and vehicles used
CREATE TABLE Ticket_Route (   
    Ticketid INT,   
    Vid INT,   
    Rid INT,   
    PRIMARY KEY (Ticketid, Vid, Rid),   
    FOREIGN KEY (Ticketid) REFERENCES Ticket(Ticketid),   
    FOREIGN KEY (Vid) REFERENCES Vehicle(Vid),   
    FOREIGN KEY (Rid) REFERENCES Route(Rid)  
);  

-- Table for storing payment information related to passengers and tickets
CREATE TABLE Payment (   
    Paymentid INT PRIMARY KEY,   
    Pid INT,   
    Paydate DATE,   
    Amount FLOAT,   
    Paymethod VARCHAR(50),   
    Paystatus VARCHAR(20),   
    Ticketid INT,   
    FOREIGN KEY (Pid) REFERENCES Passenger(Pid),   
    FOREIGN KEY (Ticketid) REFERENCES Ticket(Ticketid)  
);  
