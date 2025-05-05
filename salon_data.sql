
-- Inserting data into Services table
INSERT INTO Services (name, price, description) 
VALUES 
('Haircut', 15.00, 'Basic haircut'),
('Shave', 10.00, 'Full shave'),
('Hair Coloring', 50.00, 'Hair coloring service'),
('Facial', 30.00, 'Skin facial treatment'),
('Manicure', 20.00, 'Basic manicure'),
('Pedicure', 25.00, 'Pedicure with exfoliation'),
('Massage', 40.00, 'Full body massage'),
('Keratin Treatment', 80.00, 'Smooth and straighten hair');

-- Inserting data into Hairdressers table
INSERT INTO Hairdressers (name, phone, level) 
VALUES 
('John Doe', '09123456789', 'Professional'),
('Jane Smith', '09123456788', 'Intermediate'),
('Ali Reza', '09123456787', 'Beginner'),
('Emily Clark', '09123456786', 'Professional'),
('Michael Johnson', '09123456785', 'Intermediate'),
('Sarah Williams', '09123456784', 'Advanced'),
('David Brown', '09123456783', 'Beginner'),
('Linda Lee', '09123456782', 'Professional');

-- Inserting data into Hairdresser_Services table
INSERT INTO Hairdresser_Services (hairdresser_id, service_id) 
VALUES 
(1, 1),  -- Hairdresser 1 (John Doe) offers Haircut
(1, 2),  -- Hairdresser 1 (John Doe) offers Shave
(2, 3),  -- Hairdresser 2 (Jane Smith) offers Hair Coloring
(2, 4),  -- Hairdresser 2 (Jane Smith) offers Facial
(3, 5),  -- Hairdresser 3 (Ali Reza) offers Manicure
(3, 6),  -- Hairdresser 3 (Ali Reza) offers Pedicure
(4, 7),  -- Hairdresser 4 (Emily Clark) offers Massage
(4, 8),  -- Hairdresser 4 (Emily Clark) offers Keratin Treatment
(5, 1),  -- Hairdresser 5 (Michael Johnson) offers Haircut
(6, 2),  -- Hairdresser 6 (Sarah Williams) offers Shave
(7, 3),  -- Hairdresser 7 (David Brown) offers Hair Coloring
(8, 4);  -- Hairdresser 8 (Linda Lee) offers Facial

-- Inserting data into Salons table
INSERT INTO Salons (name, level) 
VALUES 
('Beauty Salon A', 'Basic'),
('Luxury Salon B', 'Pro'),
('Glamour Salon C', 'Pro'),
('Elegant Salon D', 'Basic'),
('Chic Salon E', 'Pro'),
('Royal Salon F', 'Premium');


-- Inserting data into Addresses table
INSERT INTO Addresses (city, street_name, postal_code, salon_id) 
VALUES 
('Tehran', 'Vali Asr Street', '12345', 1),  -- Salon A
('Tehran', 'Panjthom Street', '67890', 2),  -- Salon B
('Tehran', 'Sina Street', '54321', 3),     -- Salon C
('Tehran', 'Keshavarz Blvd', '23456', 4),  -- Salon D
('Tehran', 'Shariati Street', '98765', 5),  -- Salon E
('Tehran', 'Kourosh Blvd', '13579', 6);    -- Salon F


-- Inserting data into Salons_Hairdressers table
INSERT INTO Salons_Hairdressers (Salons_id, Hairdressers_id) 
VALUES 
(1, 1),  -- Salon A, Hairdresser 1 (John Doe)
(1, 2),  -- Salon A, Hairdresser 2 (Jane Smith)
(2, 3),  -- Salon B, Hairdresser 3 (Ali Reza)
(2, 4),  -- Salon B, Hairdresser 4 (Emily Clark)
(3, 5),  -- Salon C, Hairdresser 5 (Michael Johnson)
(4, 6),  -- Salon D, Hairdresser 6 (Sarah Williams)
(5, 7),  -- Salon E, Hairdresser 7 (David Brown)
(6, 8);  -- Salon F, Hairdresser 8 (Linda Lee)

-- Inserting data into Customers table
INSERT INTO Customers (name, phone, email) 
VALUES 
('Mohammad Ali', '09123456780', 'mohammad.ali@example.com'),
('Sara Ahmadi', '09123456781', 'sara.ahmadi@example.com'),
('Reza Farahani', '09123456782', 'reza.farahani@example.com'),
('Niloofar Hosseini', '09123456783', 'niloofar.hosseini@example.com'),
('Ali Asgari', '09123456784', 'ali.asgari@example.com'),
('Ladan Ramezani', '09123456785', 'ladan.ramezani@example.com'),
('Sina Moradi', '09123456786', 'sina.moradi@example.com'),
('Maryam Zarei', '09123456787', 'maryam.zarei@example.com'),
('Omid Rahmani', '09123456788', 'omid.rahmani@example.com'),
('Shirin Kaviani', '09123456789', 'shirin.kaviani@example.com');

-- Inserting data into Appointments table
INSERT INTO Appointments (appointment_date, customer_id, service_id, hairdresser_id, salon_id) 
VALUES 
('2025-04-15 10:00:00', 1, 1, 1, 1),  -- Mohammad Ali, Haircut, Hairdresser 1 (John Doe), Salon A
('2025-04-15 11:00:00', 2, 2, 2, 2),  -- Sara Ahmadi, Shave, Hairdresser 2 (Jane Smith), Salon B
('2025-04-16 12:00:00', 3, 3, 3, 3),  -- Reza Farahani, Hair Coloring, Hairdresser 3 (Ali Reza), Salon C
('2025-04-16 13:00:00', 4, 4, 4, 4),  -- Niloofar Hosseini, Facial, Hairdresser 4 (Emily Clark), Salon D
('2025-04-17 14:00:00', 5, 5, 5, 5),  -- Ali Asgari, Manicure, Hairdresser 5 (Michael Johnson), Salon E
('2025-04-17 15:00:00', 6, 6, 6, 6),  -- Ladan Ramezani, Pedicure, Hairdresser 6 (Sarah Williams), Salon F
('2025-04-18 10:30:00', 7, 7, 7, 1),  -- Sina Moradi, Massage, Hairdresser 7 (David Brown), Salon A
('2025-04-18 11:30:00', 8, 8, 8, 2),  -- Maryam Zarei, Keratin Treatment, Hairdresser 8 (Linda Lee), Salon B
('2025-04-19 12:00:00', 9, 1, 1, 3),  -- Omid Rahmani, Haircut, Hairdresser 1 (John Doe), Salon C
('2025-04-19 13:00:00', 10, 4, 4, 4); -- Shirin Kaviani, Facial, Hairdresser 4 (Emily Clark), Salon D



UPDATE Hairdressers SET manager_id = NULL WHERE id = 1;

UPDATE Hairdressers SET manager_id = 1 WHERE id IN (2, 3);

UPDATE Hairdressers SET manager_id = 2 WHERE id IN (4, 5);

UPDATE Hairdressers SET manager_id = NULL WHERE id IN (6, 7, 8);

