# Public Transport Management System

This project is a database-driven system designed to manage and streamline public transport services. It efficiently stores and retrieves information related to transport types, vehicles, routes, drivers, passengers, ticketing, and payments.

## 🗂️ Project Structure

The system is based on a relational database and is built using SQL with normalized table structures and sample data insertions.

### 📦 Main Components

- **Transport Types**  
  Stores various types of transport modes like bus, train, taxi, flight, and ship.

- **Vehicles**  
  Each vehicle is associated with a transport type and has attributes like capacity.

- **Routes**  
  Details about the origin, destination, distance, arrival, and departure times.

- **Drivers**  
  Stores driver details such as name, phone number, and license number.

- **Passengers**  
  Includes passenger contact information.

- **Tickets**  
  Contains ticketing data such as fare, number of seats, status, and issue date.

- **Payments**  
  Tracks payment methods, status, and links them to tickets and passengers.

- **Associative Tables**  
  - `Driver_Vehicle`: Links drivers to vehicles.  
  - `Ticket_Passenger`: Associates tickets with passengers.  
  - `Ticket_Route`: Connects tickets to routes and vehicles.

## 📄 Files Included

- `create_tables.sql` – SQL script to create all required database tables.
- `insert_statements.sql` – SQL script to populate tables with sample data.
- `executed_queries.sql` – A collection of SQL queries to retrieve and analyze data based on various criteria.

## 🛠️ Features

- Normalized schema design with foreign key constraints.
- Sample data for real-world simulation of operations.
- 30+ SQL queries to extract useful insights:
  - Booking details
  - Revenue reports
  - Driver assignments
  - Passenger travel history
  - Route analysis and more

## 💡 Use Cases

- Government or private agencies can manage and monitor public transport operations.
- Useful for learning relational databases and complex SQL queries.
- Can be integrated with a front-end for a complete transport management application.

## 🧑‍💻 Technologies Used

- **Database**: MySQL / PostgreSQL / SQLite (any RDBMS)
- **Language**: SQL

## 🚀 Getting Started

1. Load `create_tables.sql` into your SQL environment to set up the schema.
2. Run `insert_statements.sql` to populate the database with sample records.
3. Use `executed_queries.sql` to explore and analyze the data.

## 📌 Notes

- All tables follow relational integrity through appropriate foreign key constraints.
- Sample data has been designed to simulate realistic transport operations.
