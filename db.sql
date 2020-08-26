/*AUTHOR: MATTHEW HOOPER (hoop0016), SEBASTIAN HOEY (hoey0017)*/

Drop TABLE ClientPhone;
Drop TABLE ServiceHistory;
Drop TABLE CompanyClient;
Drop TABLE DepotPhone;
Drop TABLE Booking;
Drop TABLE HiredVehicle;
Drop TABLE DailyTariff;
Drop TABLE DailyTariffCost;
Drop TABLE Insurance;
Drop TABLE Insures;
Drop TABLE Client;
Drop TABLE HiredVehicleDriver;
Drop Table Invoice;
Drop TABLE PersonalClient;
Drop TABLE Vehicle;
Drop TABLE Records;
DROP VIEW  finalInvoice;
Drop TABLE VehicleType;
Drop TABLE Depot;
VACUUM;

Create TABLE Depot (
depotID int(2) NOT NULL,
street string(45) NOT NULL,
postcode string(4) NOT NULL,
fax string(14),
PRIMARY KEY (depotID)
);

Create TABLE DepotPhone (
depotID int(2) NOT NULL, 
phone string(14) NOT NULL,
Primary Key (depotID, phone),
foreign key (depotID) references Depot(depotID) ON UPDATE CASCADE ON DELETE CASCADE
);

Create TABLE Client (
ClientID Int(8) NOT NULL,
street string(45) NOT NULL,
postcode string(4) NOT NULL,
PRIMARY KEY (clientID)
);

Create TABLE PersonalClient (
clientID int(8) NOT NULL,
fName string(20) NOT NULL,
lName string(20) NOT NULL,
title string(4) NOT NULL,
driversNum string(12) NOT NULL,
Primary Key (clientID),
Foreign Key (ClientID) references Client (ClientID) ON UPDATE CASCADE ON DELETE CASCADE
);

Create TABLE CompanyClient (
ClientID int(8) NOT NULL,
CName string(20) NOT NULL,
Representative_clientID int(8) Not NULL,
Primary Key (clientID),
Foreign Key (ClientID) references Client (ClientID) ON UPDATE CASCADE ON DELETE CASCADE,
Foreign Key (Representative_clientID) references PersonalClient (clientID) ON UPDATE CASCADE ON DELETE RESTRICT
);

Create TABLE ClientPhone (
ClientID int(8) NOT NULL,
phone string(14) NOT NULL,
Primary KEY  (ClientID, phone),
Foreign Key (ClientID) references Client (ClientID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE VehicleType (
mixID INTEGER PRIMARY KEY AUTOINCREMENT,
make      CHAR(8) NOT NULL,
model     CHAR(8) NOT NULL,
doors     INT NOT NULL,
body      CHAR(15) NOT NULL,
VehicleTrim      CHAR(15) NOT NULL
);

Create TABLE Vehicle (
mixID INTEGER NOT NULL,
regNum string(7) NOT NULL,
depotID Int(2),
fleetNum Int(3) NOT NULL,
colour sting (20) NOT NULL,
nextServDate date NOT NULL,
nextServKilom int(5) NOT NULL,
nextServDepotID Int NOT NULL,
Primary Key (regNum),
Foreign Key (depotID) references Depot (depotID) ON UPDATE CASCADE ON DELETE RESTRICT,
Foreign Key (nextServDepotID) references Depot (DepotID) ON UPDATE CASCADE ON DELETE RESTRICT, 
Foreign Key (mixID) references VehicleType (mixID) ON UPDATE CASCADE ON DELETE CASCADE
);

Create TABLE ServiceHistory (
regNum string(7) NOT NULL,
depotID Int(2) NOT NULL DEFAULT '99',
"date" date NOT NULL,
cost decimal(4,2) NOT NULL,
description string(50),
Primary Key (regNum, date)
Foreign Key (regNum) references Vehicle (regNum) ON UPDATE CASCADE ON DELETE NO ACTION,
Foreign Key (depotID) references Depot (depotID) ON UPDATE CASCADE ON DELETE SET DEFAULT
);

Create TABLE Booking (
bookingID string(3) NOT NULL,
ClientID int(8) NOT NULL,
depotID Int(2) NOT NULL,
mixID INTEGER NOT NULL,  
Startdate date NOT NULL,
hireDays INT(2) NOT NULL,
colour string(12),
Primary Key (bookingID),
Foreign Key (ClientID) references Client(ClientID) ON UPDATE CASCADE ON DELETE CASCADE,
Foreign Key (mixID) references VehicleType (mixID) ON UPDATE CASCADE ON DELETE NO ACTION,
Foreign Key (depotID) references Depot (depotID) ON UPDATE CASCADE ON DELETE NO ACTION
);

Create TABLE DailyTariff (
tariffID char(2) NOT NULL, 
conditions string(50),
Primary Key (tariffID)
);

Create TABLE DailyTariffCost (
mixID INTEGER NOT NULL, 
tariffID char(2) NOT NULL, 
rentalPrice decimal(5,2) NOT NULL,
Primary Key (mixID, tariffID),
Foreign Key (mixID) references VehicleType (mixID) ON UPDATE CASCADE ON DELETE CASCADE,
Foreign Key (tariffID) references DailyTariff (tariffID) ON UPDATE CASCADE ON DELETE CASCADE
);

Create TABLE Insurance (
insuranceID Int(5) NOT NULL, 
policyType string(15), 
cost decimal(3,2),
Primary Key (insuranceID)
);


Create TABLE HiredVehicle (
regNum string(7) NOT NULL, 
tariffID char(2) NOT NULL, 
depotID Int(2) NOT NULL DEFAULT '99', 
clientID Int(8) NOT NULL, 
"date" date NOT NULL, 
cardType string(20) Not Null, 
cardNo string(20) NOT NULL, 
kilometrage int(5) NOT NUll,  
"days" Int(2) NOT NULL, 
policyNumber string(12),
UNIQUE(policyNumber),
Primary Key (regNum, date, clientID),
Foreign Key (regNum) references Vehicle (regNum) ON UPDATE CASCADE ON DELETE NO ACTION,
Foreign Key (tariffID) references DailyTariff (tariffID) ON UPDATE CASCADE ON DELETE RESTRICT ,
Foreign Key (depotID) references Depot (depotID) ON UPDATE CASCADE ON DELETE SET DEFAULT,
Foreign Key (clientID) references Client (clientID) ON UPDATE CASCADE  ON DELETE CASCADE
);

Create TABLE HiredVehicleDriver(
regNum              string(7) NOT NULL,
"date"              date NOT NULL,
clientID            Int(8) NOT NULL,
DriverClientID      Int(8) NOT NULL,
Primary Key (regNum, date, clientID, DriverClientID),
Foreign Key (regNum, date, clientID) references HiredVehicle (regNum, date, clientID) ON UPDATE CASCADE ON DELETE RESTRICT,
Foreign Key (DriverClientID) references PersonalClient (clientID) ON UPDATE CASCADE ON DELETE RESTRICT
);

Create TABLE Insures (
policyNumber string(12) NOT NULL, 
insuranceID int(5) NOT NULL,
Primary Key (policyNumber, insuranceID),
Foreign Key (policyNumber) references HiredVehicle(policyNumber) ON UPDATE CASCADE ON DELETE CASCADE,
Foreign Key (insuranceID) references Insurance(insuranceID) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Invoice (
invoiceID       INT(10) NOT NULL,
higherDate      date NOT NULL,
returnDate     date DEFAULT CURRENT_DATE NOT NULL,
qualityCheck    Char(3) NOT NULL,
regNum          varchar(7) NOT NULL,
clientID        int(8) NOT NULL,
datePaid        date, 
Primary Key (invoiceID),
Foreign Key (regNum,higherDate,clientID) references hiredvehicle (regNum,date,clientID) ON UPDATE CASCADE ON DELETE NO ACTION
);

Create TABLE Records (
invoiceID int(10),
cost decimal(5,2),
Primary Key (invoiceID, cost),
Foreign Key (invoiceID) references Invoice (invoiceID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE VIEW finalInvoice as
select invoice.*, records.cost
from invoice invoice, records records
where invoice.invoiceID = records.invoiceID;

Create TRIGGER VehicleType_insert_1 BEFORE INSERT
on VehicleType
Begin
Select
CASE 
when NEW.body NOT IN ('hatch','sedan', 'suv', 'coupe') THEN 
RAISE (
ABORT,
'Invalid Body Type'
)
END;
END;

Create TRIGGER VehicleType_insert_2 BEFORE INSERT
on VehicleType
Begin
Select
CASE
when NEW.VehicleTrim NOT IN ('standard', 'sport', 'luxury') THEN 
RAISE ( 
ABORT, 
'Invalid Trim Type'
 )
END;
END;

Create TRIGGER PersonalClient_title BEFORE INSERT
on PersonalClient
Begin
Select
CASE
when NEW.title NOT IN ('Mr','Ms','Miss','Mrs', 'Mx','Dr','Captain', 'Reverend', 'Sir','Madam', "Ma'am", 'Dame','Lord','Lady','Dr','Prof', 'Br', 'Sr', 'Fr', 'Rev', 'Pr', 'Elder', 'Honourable', 'Rabbi', 'Imam', 'Sayyid', 'Sharif', 'Ambassador','Brigadier', 'Senator', 'Justice'  ) THEN
RAISE ( 
ABORT, 
'Invalid honorifics'
 )
END;
END;

Create TRIGGER phoneClient_1 AFTER INSERT
on ClientPhone
Begin
Select
CASE
when ( Select count(phone) from ClientPhone Group by ClientID) > 2 THEN
RAISE ( 
ABORT, 
'Reached Max Limit of Phone Numbers'
)
END;
END;

Create TRIGGER phoneClient_2 BEFORE INSERT
on ClientPhone
Begin
Select
CASE
when LENGTH(new.phone) < 9 THEN
RAISE ( 
ABORT, 
'Phone Number is too short'
)
END;
END;

Create TRIGGER DepotPhone_1 AFTER INSERT
on DepotPhone
Begin
Select
CASE
when ( Select count(phone) from DepotPhone where depotID=new.depotID Group by depotID) > 4 THEN
RAISE ( 
ABORT, 
'Reached Max Limit of Phone Numbers'
)
END;
END;

Create TRIGGER DepotPhone_2 BEFORE INSERT
on DepotPhone
Begin
Select
CASE
when LENGTH(new.phone) < 9 THEN
RAISE ( 
ABORT, 
'Phone Number is too short'
)
END;
END;

Create TRIGGER Vehicle_regNum_length BEFORE INSERT
on Vehicle
Begin
Select
CASE
when length(new.regNum)<  5 THEN
RAISE ( 
ABORT, 
'regNUM is too short'
)
END;
END;

Create TRIGGER Depot_fax_length BEFORE INSERT
on depot
Begin
Select
CASE
when length(new.fax)<11 THEN
RAISE ( 
ABORT, 
'fax number is too short'
)
END;
END;

Create TRIGGER Depot_postcode_length BEFORE INSERT
on depot
Begin
Select
CASE
when length(new.postcode)< 4 THEN
RAISE ( 
ABORT, 
'post code is too short'
)
END;
END;

Create TRIGGER client_postcode_length BEFORE INSERT
on Client
Begin
Select
CASE
when length(new.postcode)<4 THEN
RAISE ( 
ABORT, 
'post code is too short'
)
END;
END;

Create TRIGGER Insurance_type BEFORE INSERT
on Insurance
Begin
Select
CASE
when NEW.policyType NOT IN ('FULLCOVER', 'EXCESSREDUCTION', 'EXCESSREMOVAL') THEN 
RAISE ( 
ABORT, 
'Invalid Policy Type'
 )
END;
END;

/* this is a pre-set depot for showing that the tuple entry is from a depot that does not exist any more*/
Insert into Depot (depotID, street, postcode) Values ('99',"entry is from a depot that doesn't exist anymore",'9999');

Create TRIGGER Inv_1 BEFORE INSERT
on Invoice
Begin
Select
CASE 
when NEW.qualityCheck NOT IN ('Yes', 'No') THEN 
RAISE (
ABORT,
'Invalid qualityCheck'
)
END;
END;