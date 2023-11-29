/* Drop Statements */

DROP TABLE Landlord CASCADE CONSTRAINTS;
DROP TABLE PropertyManager CASCADE CONSTRAINTS;
-- DROP TABLE Tenant CASCADE CONSTRAINTS;
-- DROP TABLE Realtor CASCADE CONSTRAINTS;
-- DROP TABLE MaintenanceStaff CASCADE CONSTRAINTS;
-- DROP TABLE Property CASCADE CONSTRAINTS;
-- DROP TABLE Apartment CASCADE CONSTRAINTS;
-- DROP TABLE Townhome CASCADE CONSTRAINTS;
-- DROP TABLE Contract CASCADE CONSTRAINTS;
-- DROP TABLE Payment CASCADE CONSTRAINTS;

-- PropertyManager
CREATE TABLE PropertyManager (
    Email VARCHAR(255) PRIMARY KEY,
    manager_name VARCHAR(255),
    PhoneNumber INTEGER
);

-- -- Landlord
CREATE TABLE Landlord (
    LandlordEmail VARCHAR(255) PRIMARY KEY,
    LandlordName VARCHAR(255),
    PhoneNumber INTEGER,
    NumProperties INTEGER
    -- PropertyManagerEmail VARCHAR(255),
    -- FOREIGN KEY (PropertyManagerEmail) REFERENCES PropertyManager(Email)
);


-- -- Realtor
-- CREATE TABLE Realtor (
--     Email VARCHAR(255) PRIMARY KEY,
--     RealtorName VARCHAR(255),
--     PhoneNumber INTEGER,
--     YearsOfExperience INTEGER,
--     CommissionPercentage DECIMAL(5,2),
--     PropertyManagerEmail VARCHAR(255),
--     FOREIGN KEY (PropertyManagerEmail) REFERENCES PropertyManager(Email)
-- );

-- -- MaintenanceStaff
-- CREATE TABLE MaintenanceStaff (
--     Email VARCHAR(255) PRIMARY KEY,
--     Name VARCHAR(255),
--     Speciality VARCHAR(255),
--     PhoneNumber INTEGER,
--     PropertyManagerEmail VARCHAR(255),
--     FOREIGN KEY (PropertyManagerEmail) REFERENCES PropertyManager(Email)
-- );

-- -- Property
-- CREATE TABLE Property (
--     Unit VARCHAR(255),
--     Street VARCHAR(255),
--     City VARCHAR(255),
--     Province VARCHAR(255),
--     PostalCode CHAR(6),
--     Price INTEGER,
--     Sqft INTEGER,
--     Bedrooms INTEGER,
--     PropertyManagerEmail VARCHAR(255),
--     LandlordEmail VARCHAR(255),
--     PRIMARY KEY (Unit, Street, PostalCode),
--     FOREIGN KEY (LandlordEmail) REFERENCES Landlord(Email),
--     FOREIGN KEY (PropertyManagerEmail) REFERENCES PropertyManager(Email)
-- );

-- -- Apartment
-- CREATE TABLE Apartment (
--     Unit VARCHAR(255),
--     Street VARCHAR(255),
--     PostalCode CHAR(6),
--     FloorLevel INTEGER,
--     Stories INTEGER,
--     ElevatorCount INTEGER,
--     PropertyManagerEmail VARCHAR(255),
--     LandlordEmail VARCHAR(255),
--     PRIMARY KEY (Unit, Street, PostalCode),
--     FOREIGN KEY (PropertyManagerEmail) REFERENCES PropertyManager(Email),
--     FOREIGN KEY (LandlordEmail) REFERENCES Landlord(Email)
--     -- !!! Should there be a foreign key to all of the things property has a relationship to; same for townhome
-- );

-- -- Townhome
-- CREATE TABLE Townhome (
--     Unit VARCHAR(255),
--     Street VARCHAR(255),
--     PostalCode CHAR(6),
--     AttachedHomes INTEGER,
--     NumberOfFloors INTEGER,
--     PropertyManagerEmail VARCHAR(255),
--     LandlordEmail VARCHAR(255),
--     PRIMARY KEY (Unit, Street, PostalCode),
--     FOREIGN KEY (PropertyManagerEmail) REFERENCES PropertyManager(Email),
--     FOREIGN KEY (LandlordEmail) REFERENCES Landlord(Email)
-- );

-- -- Contract
-- CREATE TABLE Contract (
--     ContractID INTEGER PRIMARY KEY,
--     DateSigned DATE,
--     PropertyManagerEmail VARCHAR(255),
--     TenantEmail VARCHAR(255),
--     FOREIGN KEY (PropertyManagerEmail) REFERENCES PropertyManager(Email),
--     FOREIGN KEY (TenantEmail) REFERENCES Tenant(Email)
-- );

-- -- Payment
-- CREATE TABLE Payment (
--     ContractID INTEGER,
--     PaymentNumber INTEGER,
--     Amount DECIMAL(10,2),
--     -- !!! Changed to decimal to reflect the insert statements from doc
--     PaymentDate DATE,
--     PRIMARY KEY (ContractID, PaymentNumber),
--     FOREIGN KEY (ContractID) REFERENCES Contract(ContractID)
-- );

-- -- Tenant
-- CREATE TABLE Tenant (
--     Email VARCHAR(255) PRIMARY KEY,
--     TenantName VARCHAR(255),
--     PhoneNumber INTEGER,
--     StartDate DATE,
--     EndDate DATE,
--     DurationMonths INTEGER,
--     ContractID INTEGER,
--     Unit VARCHAR(255),
--     Street VARCHAR(255),
--     PostalCode CHAR(6),
--     FOREIGN KEY (ContractID) REFERENCES Contract(ContractID),
--     FOREIGN KEY (Unit, Street, PostalCode) REFERENCES Property(Unit, Street, PostalCode)
-- );


-- PropertyManager:
INSERT INTO PropertyManager (Email, manager_name, PhoneNumber)
VALUES ('propertymanager1@email.com', 'Alice Smith', 4321098765);

INSERT INTO PropertyManager (Email, manager_name, PhoneNumber)
VALUES ('propertymanager2@email.com', 'Bob Jones', 1234567890);

INSERT INTO PropertyManager (Email, manager_name, PhoneNumber)
VALUES ('propertymanager3@email.com', 'Carol Williams', 0987654321);

INSERT INTO PropertyManager (Email, manager_name, PhoneNumber)
VALUES ('propertymanager4@email.com', 'David Brown', 4321098765);

INSERT INTO PropertyManager (Email, manager_name, PhoneNumber)
VALUES ('propertymanager5@email.com', 'Emily Anderson', 1234567890);


-- -- Landlord:

INSERT INTO Landlord (LandlordEmail, LandlordName, PhoneNumber, NumProperties)
VALUES ('landlord1@email.com', 'John Doe', 1234567890, 2);

INSERT INTO Landlord (LandlordEmail, LandlordName, PhoneNumber, NumProperties)
VALUES ('landlord2@email.com', 'Jane Smith', 9876543210, 1);

INSERT INTO Landlord (LandlordEmail, LandlordName, PhoneNumber, NumProperties)
VALUES ('landlord3@email.com', 'Peter Jones', 0987654321, 3);

INSERT INTO Landlord (LandlordEmail, LandlordName, PhoneNumber, NumProperties)
VALUES ('landlord4@email.com', 'Mary Brown', 1234567890, 4);

INSERT INTO Landlord (LandlordEmail, LandlordName, PhoneNumber, NumProperties)
VALUES ('landlord5@email.com', 'David Wilson', 9876543210, 2);

-- -- Tenant:
-- INSERT INTO Tenant (Email, Name, PhoneNumber, StartDate, EndDate, DurationMonths, ContractID, Unit, Street, PostalCode)
-- VALUES ('tenant1@email.com', 'Alice Smith', 4321098765, '2023-10-01', '2024-09-30', 12, 1, 'A1', 'Main Street', 'V6A 1B1');

-- INSERT INTO Tenant (Email, Name, PhoneNumber, StartDate, EndDate, DurationMonths, ContractID, Unit, Street, PostalCode)
-- VALUES ('tenant2@email.com', 'Bob Jones', 1234567890, '2023-11-01', '2024-10-31', 12, 2, 'B2', 'Elm Street', 'V6A 2B2');

-- INSERT INTO Tenant (Email, Name, PhoneNumber, StartDate, EndDate, DurationMonths, ContractID, Unit, Street, PostalCode)
-- VALUES ('tenant3@email.com', 'Carol Williams', 0987654321, '2023-12-01', '2025-11-30', 12, 3, 'C3', 'Oak Street', 'V6A 3B3');

-- INSERT INTO Tenant (Email, Name, PhoneNumber, StartDate, EndDate, DurationMonths, ContractID, Unit, Street, PostalCode)
-- VALUES ('tenant4@email.com', 'David Brown', 4321098765, '2023-01-01', '2023-12-31', 12, 4, 'D4', 'Cedar Street', 'V6A 4B4');

-- INSERT INTO Tenant (Email, Name, PhoneNumber, StartDate, EndDate, DurationMonths, ContractID, Unit, Street, PostalCode)
-- VALUES ('tenant5@email.com', 'Emily Anderson', 1234567890, '2022-02-01', '2024-01-31', 24, 5, 'E5', 'Cypress Street', 'V6A 5B5');


-- -- Realtor:
-- INSERT INTO Realtor (Email, Name, PhoneNumber, YearsOfExperience, CommissionPercentage, PropertyManagerEmail)
-- VALUES ('realtor1@email.com', 'Alice Smith', 4321098765, 5, 5.00, 'propertymanager1@email.com');

-- INSERT INTO Realtor (Email, Name, PhoneNumber, YearsOfExperience, CommissionPercentage, PropertyManagerEmail)
-- VALUES ('realtor2@email.com', 'Bob Jones', 1234567890, 3, 4.50, 'propertymanager2@email.com');

-- INSERT INTO Realtor (Email, Name, PhoneNumber, YearsOfExperience, CommissionPercentage, PropertyManagerEmail)
-- VALUES ('realtor3@email.com', 'Carol Williams', 0987654321, 7, 6.00, 'propertymanager3@email.com');

-- INSERT INTO Realtor (Email, Name, PhoneNumber, YearsOfExperience, CommissionPercentage, PropertyManagerEmail)
-- VALUES ('realtor4@email.com', 'David Brown', 4321098765, 2, 3.50, 'propertymanager1@email.com');

-- INSERT INTO Realtor (Email, Name, PhoneNumber, YearsOfExperience, CommissionPercentage, PropertyManagerEmail)
-- VALUES ('realtor5@email.com', 'Emily Anderson', 1234567890, 4, 5.50, 'propertymanager2@email.com');


-- -- MaintenanceStaff:
-- INSERT INTO MaintenanceStaff (Email, Name, Speciality, PhoneNumber, PropertyManagerEmail)
-- VALUES ('maintenancestaff1@email.com', 'Alice Smith', 'Plumbing', 4321098765, 'propertymanager1@email.com');

-- INSERT INTO MaintenanceStaff (Email, Name, Speciality, PhoneNumber, PropertyManagerEmail)
-- VALUES ('maintenancestaff2@email.com', 'Bob Jones', 'Electrical', 1234567890, 'propertymanager2@email.com');

-- INSERT INTO MaintenanceStaff (Email, Name, Speciality, PhoneNumber, PropertyManagerEmail)
-- VALUES ('maintenancestaff3@email.com', 'Carol Williams', 'Carpentry', 0987654321, 'propertymanager3@email.com');

-- INSERT INTO MaintenanceStaff (Email, Name, Speciality, PhoneNumber, PropertyManagerEmail)
-- VALUES ('maintenancestaff4@email.com', 'David Brown', 'Painting', 4321098765, 'propertymanager1@email.com');

-- INSERT INTO MaintenanceStaff (Email, Name, Speciality, PhoneNumber, PropertyManagerEmail)
-- VALUES ('maintenancestaff5@email.com', 'Emily Anderson', 'Landscaping', 1234567890, 'propertymanager2@email.com');


-- -- Property !!! Make sure total disjoint?:
-- INSERT INTO Property (Unit, Street, City, Province, PostalCode, Price, Sqft, Bedrooms, PropertyManagerEmail)
-- VALUES ('A1', 'Main Street', 'Vancouver', 'British Columbia', 'V6A 1B1', 2500, 1000, 2, 'propertymanager1@email.com');

-- INSERT INTO Property (Unit, Street, City, Province, PostalCode, Price, Sqft, Bedrooms, PropertyManagerEmail)
-- VALUES ('B2', 'Elm Street', 'Vancouver', 'British Columbia', 'V6A 2B2', 3000, 1200, 3, 'propertymanager2@email.com');

-- INSERT INTO Property (Unit, Street, City, Province, PostalCode, Price, Sqft, Bedrooms, PropertyManagerEmail)
-- VALUES ('C3', 'Oak Street', 'Vancouver', 'British Columbia', 'V6A 3B3', 3500, 1500, 4, 'propertymanager3@email.com');

-- INSERT INTO Property (Unit, Street, City, Province, PostalCode, Price, Sqft, Bedrooms, PropertyManagerEmail)
-- VALUES ('D4', 'Cedar Street', 'Vancouver', 'British Columbia', 'V6A 4B4', 4000, 1800, 3, 'propertymanager1@email.com');

-- INSERT INTO Property (Unit, Street, City, Province, PostalCode, Price, Sqft, Bedrooms, PropertyManagerEmail)
-- VALUES ('E5', 'Cypress Street', 'Vancouver', 'British Columbia', 'V6A 5B5', 4500, 2000, 4, 'propertymanager2@email.com');


-- -- Apartment:
-- INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount, PropertyManagerEmail, LandlordEmail)
-- VALUES ('A1', 'Main Street', 'V6A 1B1', 1, 6, 2, 'propertymanager1@email.com', 'landlord1@email.com');

-- INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount, PropertyManagerEmail, LandlordEmail)
-- VALUES ('B2', 'Elm Street', 'V6A 2B2', 2, 4, 1, 'propertymanager2@email.com', 'landlord2@email.com');

-- INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount, PropertyManagerEmail, LandlordEmail)
-- VALUES ('C3', 'Oak Street', 'V6A 3B3', 3, 5, 2, 'propertymanager3@email.com', 'landlord3@email.com');

-- INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount, PropertyManagerEmail, LandlordEmail)
-- VALUES ('D4', 'Cedar Street', 'V6A 4B4', 4, 8, 3, 'propertymanager1@email.com', 'landlord4@email.com');

-- INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount, PropertyManagerEmail, LandlordEmail)
-- VALUES ('E5', 'Cypress Street', 'V6A 5B5', 5, 6, 2, 'propertymanager2@email.com', 'landlord5@email.com');


-- -- Townhome:
-- INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors, PropertyManagerEmail, LandlordEmail)
-- VALUES ('T1', 'Maple Street', 'V6A 1B1', 2, 3, 'propertymanager1@email.com', 'landlord1@email.com');

-- INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors, PropertyManagerEmail, LandlordEmail)
-- VALUES ('T2', 'Birch Street', 'V6A 2B2', 3, 2, 'propertymanager2@email.com', 'landlord2@email.com');

-- INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors, PropertyManagerEmail, LandlordEmail)
-- VALUES ('T3', 'Pine Street', 'V6A 3B3', 4, 3, 'propertymanager3@email.com', 'landlord3@email.com');

-- INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors, PropertyManagerEmail, LandlordEmail)
-- VALUES ('T4', 'Willow Street', 'V6A 4B4', 5, 2, 'propertymanager1@email.com', 'landlord4@email.com');

-- INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors, PropertyManagerEmail, LandlordEmail)
-- VALUES ('T5', 'Cedar Street', 'V6A 5B5', 6, 3, 'propertymanager2@email.com', 'landlord5@email.com');



-- -- Contract:
-- INSERT INTO Contract (ContractID, DateSigned, PropertyManagerEmail, TenantEmail)
-- VALUES (1, '2023-10-01', 'propertymanager1@email.com', 'tenant1@email.com');

-- INSERT INTO Contract (ContractID, DateSigned, PropertyManagerEmail, TenantEmail)
-- VALUES (2, '2023-11-01', 'propertymanager2@email.com', 'tenant2@email.com');

-- INSERT INTO Contract (ContractID, DateSigned, PropertyManagerEmail, TenantEmail)
-- VALUES (3, '2023-12-01', 'propertymanager3@email.com', 'tenant3@email.com');

-- INSERT INTO Contract (ContractID, DateSigned, PropertyManagerEmail, TenantEmail)
-- VALUES (4, '2023-01-01', 'propertymanager1@email.com', 'tenant4@email.com');

-- INSERT INTO Contract (ContractID, DateSigned, PropertyManagerEmail, TenantEmail)
-- VALUES (5, '2022-02-01', 'propertymanager2@email.com', 'tenant5@email.com');


-- -- Payment:
-- INSERT INTO Payment (ContractID, PaymentNumber, Amount, Date)
-- VALUES (1, 1, 1000.00, '2023-10-01');
-- INSERT INTO Payment (ContractID, PaymentNumber, Amount, Date)
-- VALUES (2, 1, 1200.00, '2023-11-01');
-- INSERT INTO Payment (ContractID, PaymentNumber, Amount, Date)
-- VALUES (3, 1, 1500.00, '2023-12-01');
-- INSERT INTO Payment (ContractID, PaymentNumber, Amount, Date)
-- VALUES (4, 1, 1800.00, '2023-01-01');
-- INSERT INTO Payment (ContractID, PaymentNumber, Amount, Date)
-- VALUES (5, 1, 2000.00, '2022-02-01');

-- /* Queries */

-- -- Insert
-- INSERT INTO PropertyManager (Email, Name, PhoneNumber, RealtorEmail)
-- VALUES ('${input1}', '${input2}', '${input3}', '${input4}');

-- Delete


-- Update


-- Selection


-- Projection


-- Join; Tenants with Property; find tenants that are staying longer than X time
-- SELECT Tenant.Name, Property.Street, Property.City
-- FROM Tenant
-- JOIN Property ON Tenant.Unit = Property.Unit AND Tenant.Street = Property.Street AND Tenant.PostalCode = Property.PostalCode
-- WHERE Tenant.StartDate > '${durationMonths}';



-- -- Aggregation with Group; Average rent per landlord 
-- SELECT Landlord.Email, Landlord.Name, AVG(Payment.Amount) AS AverageRent
-- FROM Payment
-- JOIN Contract ON Payment.ContractID = Contract.ContractID
-- JOIN Property ON Contract.PropertyManagerEmail = Property.PropertyManagerEmail
-- JOIN Landlord ON Property.LandlordEmail = Landlord.Email
-- GROUP BY Landlord.Email, Landlord.Name;


-- Aggregation with Having 


-- Nested Aggregation with Group By


-- Division

COMMIT;