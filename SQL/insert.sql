-- Landlord
INSERT INTO Landlord (Email, Name, PhoneNumber, NumProperties)
VALUES ('hspecter@gmail.com', 'Harvey Specter', '6045555294', 10);

INSERT INTO Landlord (Email, Name, PhoneNumber, NumProperties)
VALUES ('mross@gmail.com', 'Mike Ross', '6045551234', 5);

INSERT INTO Landlord (Email, Name, PhoneNumber, NumProperties)
VALUES ('llitt@gmail.com', 'Louis Litt', '6045555678', 7);

INSERT INTO Landlord (Email, Name, PhoneNumber, NumProperties)
VALUES ('jpearson@gmail.com', 'Jessica Pearson', '6045559876', 9);

INSERT INTO Landlord (Email, Name, PhoneNumber, NumProperties)
VALUES ('rzane@gmail.com', 'Rachel Zane', '6045553456', 3);

INSERT INTO Landlord (Email, Name, PhoneNumber, NumProperties)
VALUES ('dpaulsen@gmail.com', 'Donna Paulsen', '6045557890', 6);

-- Property Manager

INSERT INTO PropertyManager (Email, Name, PhoneNumber)
VALUES ('jake@bosa.com', 'Jake Peralta', '7785550924');

INSERT INTO PropertyManager (Email, Name, PhoneNumber)
VALUES ('amy@bosa.com', 'Amy Santiago', '7785551234');

INSERT INTO PropertyManager (Email, Name, PhoneNumber)
VALUES ('terry@bosa.com', 'Terry Jeffords', '7785555678');

INSERT INTO PropertyManager (Email, Name, PhoneNumber)
VALUES ('rosa@bosa.com', 'Rosa Diaz', '7785559876');

INSERT INTO PropertyManager (Email, Name, PhoneNumber)
VALUES ('raymond@bosa.com', 'Raymond Holt', '7785553456');

INSERT INTO PropertyManager (Email, Name, PhoneNumber)
VALUES ('gina@bosa.com', 'Gina Linetti', '7785557890');

-- Tenant

INSERT INTO Tenant (Email, Name, PhoneNumber, StartDate, EndDate, PropertyUnit)
VALUES ('robin@gmail.com', 'Robin Scherbatsky', '6045550130', '2022-03-01', '2024-03-01', '304');

INSERT INTO Tenant (Email, Name, PhoneNumber, StartDate, EndDate, PropertyUnit)
VALUES ('barney@gmail.com', 'Barney Stinson', '6045552468', '2021-04-01', '2024-04-01', '304');

INSERT INTO Tenant (Email, Name, PhoneNumber, StartDate, EndDate, PropertyUnit)
VALUES ('lily@gmail.com', 'Lily Aldrin', '6045558642', '2020-05-01', '2025-05-01', '304');

INSERT INTO Tenant (Email, Name, PhoneNumber, StartDate, EndDate, PropertyUnit)
VALUES ('marshall@gmail.com', 'Marshall Eriksen', '6045557310', '2023-01-01', '2024-11-01', '304');

INSERT INTO Tenant (Email, Name, PhoneNumber, StartDate, EndDate, PropertyUnit)
VALUES ('ted@gmail.com', 'Ted Mosby', '6045559175', '2022-07-01', '2023-12-01', '304');

INSERT INTO Tenant (Email, Name, PhoneNumber, StartDate, EndDate, PropertyUnit)
VALUES ('tracy@gmail.com', 'Tracy McConnell', '6045556089', '2022-08-01', '2028-08-01', '304');


-- Lease Length 

INSERT INTO LeaseLength (StartDate, EndDate, DurationMonths)
VALUES ('2022-03-01', '2024-03-01', 24);

INSERT INTO LeaseLength (StartDate, EndDate, DurationMonths)
VALUES ('2021-04-01', '2024-04-01', 24);

INSERT INTO LeaseLength (StartDate, EndDate, DurationMonths)
VALUES ('2022-07-01', '2023-12-01', 18);

INSERT INTO LeaseLength (StartDate, EndDate, DurationMonths)
VALUES ('2020-03-01', '2024-03-01', 48);

INSERT INTO LeaseLength (StartDate, EndDate, DurationMonths)
VALUES ('2023-01-01', '2028-01-01', 60);

INSERT INTO LeaseLength (StartDate, EndDate, DurationMonths)
VALUES ('2023-01-01', '2030-01-01', 84);

-- Realtor

INSERT INTO Realtor (Email, Name, PhoneNumber, YearsOfExperience)
VALUES ('walterwhite@bosa.com', 'Walter White', '1112223334', 1);

INSERT INTO Realtor (Email, Name, PhoneNumber, YearsOfExperience)
VALUES ('gusfring@bosa.com', 'Gus Fring', '1122233354', 15);

INSERT INTO Realtor (Email, Name, PhoneNumber, YearsOfExperience)
VALUES ('mikeehrmantraut@bosa.com', 'Mike Ehrmantraut', '1142273364', 14);

INSERT INTO Realtor (Email, Name, PhoneNumber, YearsOfExperience)
VALUES ('jessepinkman@bosa.com', 'Jesse Pinkman', '116223555', 6);

INSERT INTO Realtor (Email, Name, PhoneNumber, YearsOfExperience)
VALUES ('skylerwhite@bosa.com', 'Skyler White', '1112828834', 2);

-- Realtor Experience

INSERT INTO RealtorExperience (YearsOfExperience, CommissionPercentage)
VALUES (1, 0.01);

INSERT INTO RealtorExperience (YearsOfExperience, CommissionPercentage)
VALUES (2, 0.02);

INSERT INTO RealtorExperience (YearsOfExperience, CommissionPercentage)
VALUES (6, 0.08);

INSERT INTO RealtorExperience (YearsOfExperience, CommissionPercentage)
VALUES (14, 0.22);

INSERT INTO RealtorExperience (YearsOfExperience, CommissionPercentage)
VALUES (15, 0.25);

-- Property

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms)
VALUES ('101', '1408 Fir St', 'Vancouver', 'BC', 'V5P9F5', 1000, 2);

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms)
VALUES ('202', '123 Main St', 'Vancouver', 'BC', 'V6H2X2', 800, 3);

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms)
VALUES ('203', '789 Elm St', 'Vancouver', 'BC', 'V7R1Z1', 1200, 2);

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms)
VALUES ('104', '456 Oak St', 'Vancouver', 'BC', 'V6E3Y5', 700, 1);

INSERT INTO Property (Unit, Street, City, Province, PostalCode, Sqft, Bedrooms)
VALUES ('205', '987 Maple St', 'Vancouver', 'BC', 'V5N6W8', 900, 2);

-- Property Value

INSERT INTO PropertyValue (Sqft, Bedrooms, Price)
VALUES (1000, 2, 2000000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price)
VALUES (3300, 3, 1500000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price)
VALUES (1200, 2, 1800000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price)
VALUES (700, 1, 900000);

INSERT INTO PropertyValue (Sqft, Bedrooms, Price)
VALUES (900, 2, 1200000);

-- Apartment 

INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount)
VALUES ('121', '6597 Maclean Rd', 'V9M2J7', 1, 20, 4);

INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount)
VALUES ('305', '1234 Elm Street', 'V6J2J9', 3, 4, 1);

INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount)
VALUES ('402', '456 Oak Avenue', 'V9M2J3', 4, 12, 3);

INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount)
VALUES ('500', '789 Pine Road', 'V7K2L7', 5, 6, 2);

INSERT INTO Apartment (Unit, Street, PostalCode, FloorLevel, Stories, ElevatorCount)
VALUES ('250', '1010 Maple Lane', 'V9Y5P4', 2, 8, 1);


-- Townhome

INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors)
VALUES ('101', '1408 Fir St', 'V5P9F5', 3, 3);

INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors)
VALUES ('202', '123 Main St', 'V6H2X2', 4, 2);

INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors)
VALUES ('203', '789 Elm St', 'V7R1Z1', 2, 4);

INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors)
VALUES ('104', '456 Oak St', 'V6E3Y5', 1, 3);

INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors)
VALUES ('205', '987 Maple St', 'V5N6W8', 3, 2);

INSERT INTO Townhome (Unit, Street, PostalCode, AttachedHomes, NumberOfFloors)
VALUES ('206', '321 Pine St', 'V7K8Q3', 2, 4);

-- Contract

INSERT INTO Contract (ContractID, DateSigned)
VALUES ('15000', '2023-01-01');

INSERT INTO Contract (ContractID, DateSigned)
VALUES ('16000', '2022-01-01');

INSERT INTO Contract (ContractID, DateSigned)
VALUES ('17000', '2022-03-15');

INSERT INTO Contract (ContractID, DateSigned)
VALUES ('18000', '2022-05-05');

INSERT INTO Contract (ContractID, DateSigned)
VALUES ('19000', '2022-01-20');

INSERT INTO Contract (ContractID, DateSigned)
VALUES ('20000', '2022-08-10');

-- Payment

INSERT INTO Payment (ContractID, PaymentNumber, Amount, Date)
VALUES ('15000', '5000', 2750.00, '2023-10-01');

INSERT INTO Payment (ContractID, PaymentNumber, Amount, Date)
VALUES ('16000', '5001', 3000.00, '2023-10-15');

INSERT INTO Payment (ContractID, PaymentNumber, Amount, Date)
VALUES ('17000', '5002', 3250.50, '2023-11-15');

INSERT INTO Payment (ContractID, PaymentNumber, Amount, Date)
VALUES ('18000', '5003', 2800.75, '2023-11-01');

INSERT INTO Payment (ContractID, PaymentNumber, Amount, Date)
VALUES ('19000', '5004', 2900.25, '2023-12-15');

INSERT INTO Payment (ContractID, PaymentNumber, Amount, Date)
VALUES ('20000', '5005', 3100.00, '2024-01-01');

-- Maintenance Staff

INSERT INTO MaintenanceStaff (Email, Name, Speciality, PhoneNumber)
VALUES ('plumbing@bosa.com', 'John Smith', 'Plumbing', '2365550101');

INSERT INTO MaintenanceStaff (Email, Name, Speciality, PhoneNumber)
VALUES ('electrician@bosa.com', 'Alice Johnson', 'Electrician', '2365550543');

INSERT INTO MaintenanceStaff (Email, Name, Speciality, PhoneNumber)
VALUES ('hvac@bosa.com', 'Robert Davis', 'HVAC', '2365555436');

INSERT INTO MaintenanceStaff (Email, Name, Speciality, PhoneNumber)
VALUES ('carpenter@bosa.com', 'Emily Turner', 'Carpentry', '2365559999');

INSERT INTO MaintenanceStaff (Email, Name, Speciality, PhoneNumber)
VALUES ('painter@bosa.com', 'Michael Clark', 'Painting', '2365554903');

INSERT INTO MaintenanceStaff (Email, Name, Speciality, PhoneNumber)
VALUES ('locksmith@bosa.com', 'Sarah White', 'Locksmith', '2365559042');


