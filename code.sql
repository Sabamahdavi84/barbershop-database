-- Services table
CREATE TABLE Services (
    id BIGSERIAL PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,        
    price DECIMAL(10, 2) NOT NULL,      
    description TEXT    
);


-- Hairdresser table
CREATE TABLE Hairdressers (
    id  BIGSERIAL PRIMARY KEY,  
    name VARCHAR(255) NOT NULL,         
    phone VARCHAR(15) NOT NULL,         
    level VARCHAR(50),                
    manager_id INT,                                
    FOREIGN KEY (manager_id) REFERENCES Hairdressers(id) ON DELETE SET NULL 
);

-- Join table (Hairdresser_Services) for many-to-many relationship
CREATE TABLE Hairdresser_Services (
    hairdresser_id INT,                  
    service_id INT,                     
    PRIMARY KEY (hairdresser_id, service_id),  
    FOREIGN KEY (hairdresser_id) REFERENCES Hairdressers(id) ON DELETE CASCADE, 
    FOREIGN KEY (service_id) REFERENCES Services(id) ON DELETE CASCADE        
);


-- Table: Salons (Main entity)
CREATE TABLE Salons (
    id BIGSERIAL PRIMARY KEY,      
    name VARCHAR(255) NOT NULL,          
    level VARCHAR(100)                      
);


-- Table: Addresses (Dependent entity)
CREATE TABLE Addresses (
    id BIGSERIAL PRIMARY KEY,      
    city VARCHAR(100) NOT NULL,             
    street_name VARCHAR(255) NOT NULL,      
    postal_code VARCHAR(20),                
    salon_id INT UNIQUE,
    FOREIGN KEY (salon_id) REFERENCES Salons(id) ON DELETE CASCADE
);


-- Join table (Salons_Hairdressers) for many-to-many relationship
CREATE TABLE Salons_Hairdressers(
    Salons_id INT,                 
    Hairdressers_id INT,                     
    PRIMARY KEY (Salons_id, Hairdressers_id),  
    FOREIGN KEY (Salons_id) REFERENCES Salons(id) ON DELETE CASCADE,  
    FOREIGN KEY (Hairdressers_id) REFERENCES Hairdressers(id) ON DELETE CASCADE   
);

-- Table: Customers
CREATE TABLE Customers (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100)
);


CREATE TABLE Appointments (
    appointment_date TIMESTAMP,           
    customer_id INT,                     
    service_id INT,                     
    hairdresser_id INT,            
    salon_id INT,                 
    PRIMARY KEY (customer_id, appointment_date),  
    FOREIGN KEY (service_id) REFERENCES Services(id) ON DELETE CASCADE,  
    FOREIGN KEY (hairdresser_id) REFERENCES Hairdressers(id) ON DELETE SET NULL,  
    FOREIGN KEY (salon_id) REFERENCES Salons(id) ON DELETE SET NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE

);

--صفت مشتق:هر مشتری چند تا وقت گرفته 

CREATE VIEW CustomerAppointmentCounts AS
SELECT 
    c.id AS customer_id,
    c.name AS customer_name,
    COUNT(a.appointment_date) AS appointment_count
FROM 
    Customers c
LEFT JOIN 
    Appointments a ON c.id = a.customer_id
GROUP BY 
    c.id, c.name;



