# Barbershop Database Project:

This project involves the design and implementation of a relational database for managing the operations of a barbershop.  
It organizes information about services, hairdressers, salons, customers, and appointments.

## Features
- Manage a list of services offered by the barbershop
- Track hairdressers and their specialties
- Handle multiple salons and their addresses
- Register customer information
- Schedule and manage appointments
- Calculate the number of appointments per customer using a database view

## Database Structure

### Main Tables
- **Services**: Stores service details (name, price, description).
- **Hairdressers**: Stores hairdresser information and allows assigning managers.
- **Salons**: Stores salon names and levels.
- **Addresses**: Stores address information for salons.
- **Customers**: Stores customer contact information.
- **Appointments**: Tracks customer appointments with hairdressers, services, and salons.

### Many-to-Many Relationship Tables
- **Hairdresser_Services**: Connects hairdressers and the services they provide.
- **Salons_Hairdressers**: Connects salons and hairdressers working there.

### Views
- **CustomerAppointmentCounts**: Shows each customer and the number of appointments they have made.

## Files
- `schema.sql`: Contains all table and view definitions.

## Usage
1. Install PostgreSQL (version 14 or higher is recommended).
2. Create a new database in PostgreSQL.
3. Run `schema.sql` to set up the database structure.
4. (Optional) Insert sample data for testing.
5. Start executing queries to manage barbershop operations!

## Requirements
- PostgreSQL database system

---

