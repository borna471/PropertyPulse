/* Drop Statements */

DROP TABLE PropertyManager CASCADE CONSTRAINTS;
DROP TABLE Landlord CASCADE CONSTRAINTS;
DROP TABLE Realtor CASCADE CONSTRAINTS;
DROP TABLE RealtorExperience CASCADE CONSTRAINTS;
DROP TABLE MaintenanceStaff CASCADE CONSTRAINTS;
DROP TABLE Property CASCADE CONSTRAINTS;
DROP TABLE PropertyValue CASCADE CONSTRAINTS;
DROP TABLE Apartment CASCADE CONSTRAINTS;
DROP TABLE Townhome CASCADE CONSTRAINTS;

-- PropertyManager
CREATE TABLE PropertyManager (
    Email VARCHAR(35) PRIMARY KEY,
    ManagerName VARCHAR(25),
    PhoneNumber INTEGER
);

-- Landlord
CREATE TABLE Landlord (
    LandlordEmail VARCHAR(35) PRIMARY KEY,
    LandlordName VARCHAR(25),
    PhoneNumber INTEGER,
    NumProperties INTEGER,
    ManagerEmail VARCHAR(35),
    FOREIGN KEY (ManagerEmail) REFERENCES PropertyManager ON DELETE CASCADE
);

-- Realtor
CREATE TABLE Realtor (
    Email VARCHAR(35) PRIMARY KEY,
    RealtorName VARCHAR(25),
    PhoneNumber INTEGER,
    YearsOfExperience INTEGER,
    ManagerEmail VARCHAR(35),
    FOREIGN KEY (ManagerEmail) REFERENCES PropertyManager ON DELETE SET NULL
);

-- RealtorExperience
CREATE TABLE RealtorExperience (
    YearsOfExperience INTEGER PRIMARY KEY,
    CommissionPercentage DECIMAL(5,2)
);

-- MaintenanceStaff
CREATE TABLE MaintenanceStaff (
    Email VARCHAR(35) PRIMARY KEY,
    MaintenanceName VARCHAR(25),
    Speciality VARCHAR(25),
    PhoneNumber INTEGER,
    ManagerEmail VARCHAR(35),
    FOREIGN KEY (ManagerEmail) REFERENCES PropertyManager ON DELETE SET NULL
);

-- Property
CREATE TABLE Property (
    Unit VARCHAR(5),
    Street VARCHAR(25),
    City VARCHAR(25),
    Province VARCHAR(25),
    PostalCode CHAR(6),
    Sqft INTEGER,
    Bedrooms INTEGER,
    ManagerEmail VARCHAR(35),
    LandlordEmail VARCHAR(35),
    PRIMARY KEY (Unit, Street, PostalCode),
    FOREIGN KEY (ManagerEmail) REFERENCES PropertyManager ON DELETE SET NULL,
    FOREIGN KEY (LandlordEmail) REFERENCES Landlord ON DELETE CASCADE
);

CREATE TABLE PropertyValue (
	Sqft		INTEGER,
	Bedrooms	INTEGER,
	Price		INTEGER,
	PRIMARY KEY (Sqft, Bedrooms));

-- Apartment
CREATE TABLE Apartment (
    Unit VARCHAR(5),
    Street VARCHAR(25),
    PostalCode CHAR(6),
    FloorLevel INTEGER,
    Stories INTEGER,
    ElevatorCount INTEGER,
    PRIMARY KEY (Unit, Street, PostalCode),
    FOREIGN KEY (Unit, Street, PostalCode) REFERENCES Property ON DELETE CASCADE
);

-- Townhome
CREATE TABLE Townhome (
    Unit VARCHAR(5),
    Street VARCHAR(25),
    PostalCode CHAR(6),
    AttachedHomes INTEGER,
    NumberOfFloors INTEGER,
    PRIMARY KEY (Unit, Street, PostalCode),
    FOREIGN KEY (Unit, Street, PostalCode) REFERENCES Property ON DELETE CASCADE
);



-- PropertyManager:
INSERT INTO PropertyManager (Email, ManagerName, PhoneNumber)
VALUES ('propertymanager1@email.com', 'Alice Smith', 4321098765);

INSERT INTO PropertyManager (Email, ManagerName, PhoneNumber)
VALUES ('propertymanager2@email.com', 'Bob Jones', 1234567890);

INSERT INTO PropertyManager (Email, ManagerName, PhoneNumber)
VALUES ('propertymanager3@email.com', 'Carol Williams', 0987654321);

INSERT INTO PropertyManager (Email, ManagerName, PhoneNumber)
VALUES ('propertymanager4@email.com', 'David Brown', 4321098765);

INSERT INTO PropertyManager (Email, ManagerName, PhoneNumber)
VALUES ('propertymanager5@email.com', 'Emily Anderson', 1234567890);


-- Landlord:
INSERT INTO Landlord (LandlordEmail, LandlordName, PhoneNumber, NumProperties, ManagerEmail)
VALUES ('landlord1@email.com', 'John Doe', 1234567890, 1, 'propertymanager1@email.com');

INSERT INTO Landlord (LandlordEmail, LandlordName, PhoneNumber, NumProperties, ManagerEmail)
VALUES ('landlord2@email.com', 'Jane Smith', 9876543210, 1, 'propertymanager1@email.com');

INSERT INTO Landlord (LandlordEmail, LandlordName, PhoneNumber, NumProperties, ManagerEmail)
VALUES ('landlord3@email.com', 'Peter Jones', 0987654321, 3, 'propertymanager2@email.com');

INSERT INTO Landlord (LandlordEmail, LandlordName, PhoneNumber, NumProperties, ManagerEmail)
VALUES ('landlord4@email.com', 'Mary Brown', 1234567890, 4, 'propertymanager2@email.com');

INSERT INTO Landlord (LandlordEmail, LandlordName, PhoneNumber, NumProperties, ManagerEmail)
VALUES ('landlord5@email.com', 'David Wilson', 9876543210, 1, 'propertymanager3@email.com');

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


-- Realtor:
INSERT INTO Realtor (Email, RealtorName, PhoneNumber, YearsOfExperience, ManagerEmail)
VALUES ('realtor1@email.com', 'Alice Smith', 4321098765, 5, 'propertymanager1@email.com');

INSERT INTO Realtor (Email, RealtorName, PhoneNumber, YearsOfExperience, ManagerEmail)
VALUES ('realtor2@email.com', 'Bob Jones', 1234567890, 3, 'propertymanager2@email.com');

INSERT INTO Realtor (Email, RealtorName, PhoneNumber, YearsOfExperience, ManagerEmail)
VALUES ('realtor3@email.com', 'Carol Williams', 0987654321, 7, 'propertymanager3@email.com');

INSERT INTO Realtor (Email, RealtorName, PhoneNumber, YearsOfExperience, ManagerEmail)
VALUES ('realtor4@email.com', 'David Brown', 4321098765, 2, 'propertymanager1@email.com');

INSERT INTO Realtor (Email, RealtorName, PhoneNumber, YearsOfExperience, ManagerEmail)
VALUES ('realtor5@email.com', 'Emily Anderson', 1234567890, 4, 'propertymanager2@email.com');

-- RealtorExperience
INSERT INTO RealtorExperience(YearsOfExperience, CommissionPercentage) 
VALUES ('2', '0.02');

INSERT INTO RealtorExperience(YearsOfExperience, CommissionPercentage) 
VALUES ('15', '0.25');

INSERT INTO RealtorExperience(YearsOfExperience, CommissionPercentage) 
VALUES ('14', '0.22');

INSERT INTO RealtorExperience(YearsOfExperience, CommissionPercentage) 
VALUES ('6', '0.08');

INSERT INTO RealtorExperience(YearsOfExperience, CommissionPercentage) 
VALUES ('1', '0.01');

-- MaintenanceStaff:
INSERT INTO MaintenanceStaff (Email, MaintenanceName, Speciality, PhoneNumber, ManagerEmail)
VALUES ('maintenancestaff1@email.com', 'Alice Smith', 'Plumbing', 4321098765, 'propertymanager1@email.com');

INSERT INTO MaintenanceStaff (Email, MaintenanceName, Speciality, PhoneNumber, ManagerEmail)
VALUES ('maintenancestaff2@email.com', 'Bob Jones', 'Electrical', 1234567890, 'propertymanager2@email.com');

INSERT INTO MaintenanceStaff (Email, MaintenanceName, Speciality, PhoneNumber, ManagerEmail)
VALUES ('maintenancestaff3@email.com', 'Carol Williams', 'Carpentry', 0987654321, 'propertymanager3@email.com');

INSERT INTO MaintenanceStaff (Email, MaintenanceName, Speciality, PhoneNumber, ManagerEmail)
VALUES ('maintenancestaff4@email.com', 'David Brown', 'Painting', 4321098765, 'propertymanager1@email.com');

INSERT INTO MaintenanceStaff (Email, MaintenanceName, Speciality, PhoneNumber, ManagerEmail)
VALUES ('maintenancestaff5@email.com', 'Emily Anderson', 'Landscaping', 1234567890, 'propertymanager2@email.com');

-- Property 
INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms, ManagerEmail, LandlordEmail)
VALUES ('A1', 'Main Street', 'Calgary', 'Alberta', 'T1Y8F6', 1000, 2, 'propertymanager1@email.com', 'landlord1@email.com');

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms, ManagerEmail, LandlordEmail)
VALUES ('A2', 'Elm Street', 'Calgary', 'Alberta', 'T2J2B2', 1200, 3, 'propertymanager1@email.com', 'landlord2@email.com');

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms, ManagerEmail, LandlordEmail)
VALUES ('A3', 'Oak Street', 'Vancouver', 'British Columbia', 'V6A3B3', 2000, 4, 'propertymanager3@email.com', 'landlord5@email.com');

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms, ManagerEmail, LandlordEmail)
VALUES ('A4', 'Cedar Street', 'Vancouver', 'British Columbia', 'V6A4B4', 1800, 3, 'propertymanager2@email.com', 'landlord3@email.com');

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms, ManagerEmail, LandlordEmail)
VALUES ('A5', 'Cypress Street', 'Toronto', 'Ontario', 'M4C5B5', 1500, 4, 'propertymanager2@email.com', 'landlord4@email.com');

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms, ManagerEmail, LandlordEmail)
VALUES ('T1', 'Maple Street', 'Montreal', 'Quebec', 'V6A1B1', 1050, 2, 'propertymanager2@email.com', 'landlord3@email.com');

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms, ManagerEmail, LandlordEmail)
VALUES ('T2', 'Birch Street', 'Montreal', 'Quebec', 'V6A2B2', 1100, 3, 'propertymanager2@email.com', 'landlord4@email.com');

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms, ManagerEmail, LandlordEmail)
VALUES ('T3', 'Pine Street', 'Vancouver', 'British Columbia', 'V6A3B3', 700, 1, 'propertymanager2@email.com', 'landlord4@email.com');

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms, ManagerEmail, LandlordEmail)
VALUES ('T4', 'Willow Street', 'Calgary', 'Alberta', 'V6A4B4', 1600, 4, 'propertymanager2@email.com', 'landlord4@email.com');

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms, ManagerEmail, LandlordEmail)
VALUES ('T5', 'Cedar Street', 'Toronto', 'Ontario', 'V6A5B5', 800, 2, 'propertymanager2@email.com', 'landlord3@email.com');

-- PropertyValue
INSERT INTO PropertyValue (Sqft, Bedrooms, Price) VALUES (1000, 2, 1000000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price) VALUES (1200, 3, 1500000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price) VALUES (1500, 4, 2200000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price) VALUES (1800, 3, 4000000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price) VALUES (2000, 4, 6000000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price) VALUES (1050, 2, 1200000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price) VALUES (1100, 3, 1800000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price) VALUES (700, 1, 1100000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price) VALUES (1600, 4, 2500000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price) VALUES (800, 2, 900000);

-- Apartment:
INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount)
VALUES ('A1', 'Main Street', 'T1Y8F6', 1, 20, 2);

INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount)
VALUES ('A2', 'Elm Street', 'T2J2B2', 2, 4, 1);

INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount)
VALUES ('A3', 'Oak Street', 'V6A3B3', 3, 15, 2);

INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount)
VALUES ('A4', 'Cedar Street', 'V6A4B4', 4, 10, 3);

INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount)
VALUES ('A5', 'Cypress Street', 'M4C5B5', 5, 30, 3);

-- Townhome:
INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors)
VALUES ('T1', 'Maple Street', 'V6A1B1', 2, 3);

INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors)
VALUES ('T2', 'Birch Street', 'V6A2B2', 3, 2);

INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors)
VALUES ('T3', 'Pine Street', 'V6A3B3', 4, 3);

INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors)
VALUES ('T4', 'Willow Street', 'V6A4B4', 5, 2);

INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors)
VALUES ('T5', 'Cedar Street', 'V6A5B5', 6, 3);


-- -- Contract:
-- INSERT INTO Contract (ContractID, DateSigned, ManagerEmail, TenantEmail)
-- VALUES (1, '2023-10-01', 'propertymanager1@email.com', 'tenant1@email.com');

-- INSERT INTO Contract (ContractID, DateSigned, ManagerEmail, TenantEmail)
-- VALUES (2, '2023-11-01', 'propertymanager2@email.com', 'tenant2@email.com');

-- INSERT INTO Contract (ContractID, DateSigned, ManagerEmail, TenantEmail)
-- VALUES (3, '2023-12-01', 'propertymanager3@email.com', 'tenant3@email.com');

-- INSERT INTO Contract (ContractID, DateSigned, ManagerEmail, TenantEmail)
-- VALUES (4, '2023-01-01', 'propertymanager1@email.com', 'tenant4@email.com');

-- INSERT INTO Contract (ContractID, DateSigned, ManagerEmail, TenantEmail)
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

COMMIT;