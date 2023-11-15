CREATE TABLE Landlord (
	Email			VARCHAR PRIMARY KEY,
	Name			VARCHAR,
	PhoneNumber		INTEGER,
  NumProperties	INTEGER);

CREATE TABLE PropertyManager (
	Email			VARCHAR PRIMARY KEY,
	Name			VARCHAR,
	PhoneNumber		INTEGER);

CREATE TABLE Tenant (
	Email			VARCHAR PRIMARY KEY,
	Name			VARCHAR,
	PhoneNumber		INTEGER,
  StartDate		DATE,
  EndDate		DATE,
  ContractID		INTEGER,
  FOREIGN KEY (ContractID) REFERENCES Contract(ContractID));

CREATE TABLE LeaseLength (
	StartDate		DATE,
	EndDate		DATE,
	DurationMonths	INTEGER,
	PRIMARY KEY (StartDate, EndDate));

CREATE TABLE Realtor (
	Email			VARCHAR PRIMARY KEY,
	Name			VARCHAR,
	PhoneNumber		INTEGER,
  YearsOfExperience 	INTEGER);

CREATE TABLE RealtorExperience (
	YearsOfExperience		INTEGER PRIMARY KEY,
	CommissionPercentage	NUMBER);

CREATE TABLE Property (
	Unit			VARCHAR,
	Street			VARCHAR,
	City			VARCHAR,
	Province		VARCHAR,
	PostalCode		CHAR(6),
	Sqft			INTEGER,
	Bedrooms		INTEGER,
  PRIMARY KEY (Unit, Street, PostalCode));


CREATE TABLE PropertyValue (
	Sqft		INTEGER,
	Bedrooms	INTEGER,
	Price		INTEGER,
	PRIMARY KEY (Sqft, Bedrooms));

CREATE TABLE Apartment (
  Unit			VARCHAR,
	Street			VARCHAR,
  PostalCode		CHAR(6),
  FloorLevel		INTEGER,
  Stories			INTEGER,
  ElevatorCount		INTEGER,
  PRIMARY KEY (Unit, Street, PostalCode),
  FOREIGN KEY (Unit, Street, PostalCode) REFERENCES Property);



CREATE TABLE Townhome (
  Unit			VARCHAR,
	Street			VARCHAR,
	PostalCode		CHAR(6) ,
	AttachedHomes 	INTEGER,
	NumberOfFloors	INTEGER,
  PRIMARY KEY (Unit, Street, PostalCode),
  FOREIGN KEY (Unit, Street, PostalCode) REFERENCES Property);

CREATE TABLE Contract (
  ContractID	INTEGER PRIMARY KEY,
  DateSigned	DATE);

CREATE TABLE Payment (
  ContractID		INTEGER,
  PaymentNumber  	INTEGER, 
  Amount		NUMBER,
  Date			DATE,
  PRIMARY KEY (ContractID, PaymentNumber),
  FOREIGN KEY (ContractID) REFERENCES Contract(ContractID), ON DELETE CASCADE);

CREATE TABLE MaintenanceStaff (
	Email			VARCHAR,
	Name			VARCHAR,
	Speciality		VARCHAR,
	PhoneNumber	INTEGER);