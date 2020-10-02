/*AUTHOR: MATTHEW HOOPER (hoop0016), SEBASTIAN HOEY (hoey0017)*/

/*TEST DATA FOR DEPOT*/
insert into depot (depotID, street, postcode, fax) values ('76', '81 Lorris Way', '6312', '63654190837');
insert into depot (depotID, street, postcode, fax) values ('10', '70 Link Road', '7256', '94128622341');
insert into depot (depotID, street, postcode, fax) values ('77', '70 McLachlan Street', '3401', '39770164939');
insert into depot (depotID, street, postcode, fax) values ('04', '26 Meyer Road', '5355', '34223283879');
/*TEST DATA FOR THE DEPOT BEFORE INSERT FAX LENGTH TRIGGER*/
insert into depot (depotID, street, postcode, fax) values ('33', '33 Quayside Vista', '2601', '4128345213');
/*TEST DATA FOR THE DEPOT POSTCODE BEING TOO SHORT TRIGGER*/
insert into depot (depotID, street, postcode, fax) values ('03', '37 Meyer Road', '535', '34223283870');

/*TEST DATA FOR DEPOTPHONE*/
insert into depotPhone (depotID, phone) values ('76', '0864284018');
insert into depotPhone (depotID, phone) values ('10', '0386730542');
insert into depotPhone (depotID, phone) values ('10', '0361541457');
insert into depotPhone (depotID, phone) values ('10', '0351627546');
insert into depotPhone (depotID, phone) values ('10', '0396630026');
insert into depotPhone (depotID, phone) values ('77', '0343672834');
insert into depotPhone (depotID, phone) values ('04', '0409295833');
insert into depotPhone (depotID, phone) values ('04', '0438938438');
insert into depotPhone (depotID, phone) values ('04', '0414592042');
insert into depotPhone (depotID, phone) values ('04', '0499284682');

/*TEST DATA FOR THE DEPOTPHONE AFTER INSERT NUMBER OF PHONES LIMIT TRIGGER*/
insert into depotPhone (depotID, phone) values ('04', '0419844145');

/*TEST DATA FOR THE DEPOTPHONE BEFORE INSERT  PHONES NUMBER LENGTH TRIGGER*/
insert into depotPhone (depotID, phone) values ('77', '033847953');


/*TEST DATA FOR CLIENT*/
insert into Client (clientID, street, postcode) values ('19844565', '38 Horston Street', '3124');
insert into Client (clientID, street, postcode) values ('20482482', '36 McKillop Street', '3377');
insert into Client (clientID, street, postcode) values ('94729472', '97 Forest Road', '2840');
insert into Client (clientID, street, postcode) values ('92848274', '38 Marloo Street', '5070');
insert into Client (clientID, street, postcode) values ('42042069', '16 Ross Street', '4211');
insert into Client (clientID, street, postcode) values ('69696969', '97 Ferguson Street', '2470');

/*TEST DATA FOR PERSONALCLIENT*/
insert into PersonalClient (clientID, fName, lName, title, driversNum) values ('19844565', 'Eliza', 'Allison', 'Sayyid', 'N293ND39456L');
insert into PersonalClient (clientID, fName, lName, title, driversNum) values ('20482482', 'Gabriella', 'Noack', 'Justice', 'M492DJ6934');
insert into PersonalClient (clientID, fName, lName, title, driversNum) values ('94729472', 'Lucas', 'Hahn', 'Dr', 'C00LK1D');
insert into PersonalClient (clientID, fName, lName, title, driversNum) values ('92848274', 'Matthew', 'Fosbrook', 'Mr', 'DKD30492KF');
/*TEST DATA FOR THE PERSONALCLIENT BEFORE INSERT title TRIGGER*/
insert into PersonalClient (clientID, fName, lName, title, driversNum) values ('42042069', 'Arnold', 'Schwarzenegger', 'Captin', 'CTY363LE');


/*TEST DATA FOR COMPANYCLIENT*/
insert into CompanyClient (ClientID, CName, Representative_clientID) values ('69696969', 'Doofenshmirtz', '92848274');

/*TEST DATA FOR CLIENTPHONE*/
insert into ClientPhone (clientID, phone) values ('19844565', '0385685374');
insert into ClientPhone (clientID, phone) values ('20482482', '0392998273');
insert into ClientPhone (clientID, phone) values ('94729472', '0249937402');
insert into ClientPhone (clientID, phone) values ('92848274', '0450349334');
insert into ClientPhone (clientID, phone) values ('42042069', '0244993231');
insert into ClientPhone (clientID, phone) values ('42042069', '0244993230');
insert into ClientPhone (clientID, phone) values ('69696969', '0203949384');
insert into ClientPhone (clientID, phone) values ('69696969', '0203949385');

/*TEST DATA FOR THE CLIENTPHONE AFTER INSERT NUMBER OF PHONE NUMBERS LIMIT TRIGGER*/
insert into ClientPhone (clientID, phone) values ('69696969', '0203949386');

/*TEST DATA FOR THE CLIENTPHONE BEFORE INSERT PHONES NUMBER LENGTH TRIGGER*/
insert into ClientPhone (clientID, phone) values ('92848274', '04503434');


/*TEST DATA FOR THE VEHICLETYPE*/

insert into VehicleType (make, model, doors, body, VehicleTrim) values ('Ford','Torino','2', 'sedan','sport');
insert into VehicleType (make, model, doors, body, VehicleTrim) values ('Kia','Rio','4', 'hatch','standard');
insert into VehicleType (make, model, doors, body, VehicleTrim) values ('Lambo','Hurrican','2', 'coupe','luxury');
insert into VehicleType (make, model, doors, body, VehicleTrim) values ('Audi','R8','2', 'coupe','sport');
insert into VehicleType (make, model, doors, body, VehicleTrim) values ('Kia','Stinger','4', 'sedan','sport');
insert into VehicleType (make, model, doors, body, VehicleTrim) values ('Jeep','Cherokee','4', 'suv','standard');
insert into VehicleType (make, model, doors, body, VehicleTrim) values ('Holden','Barina' ,'4', 'hatch','standard');
insert into VehicleType (make, model, doors, body, VehicleTrim) values ('Smart','Fortwo' ,'2', 'hatch','standard');

/*TEST DATA FOR THE VEHICLETYPE vechileTrim BEOFRE INSERT TRIGGER*/
insert into VehicleType (make, model, doors, body, VehicleTrim) values ('Holden','Cruze','4', 'sedan','stdard');

/*TEST DATA FOR THE VEHICLETYPE body BEOFRE INSERT TRIGGER*/ 
insert into VehicleType (make, model, doors, body, VehicleTrim) values ('Hyandai','Veloster','2', 'sue','sport');


/*TEST DATA FOR VEHICLE*/
insert into Vehicle (mixID, regNum, depotID, fleetNum, colour, nextServDate, nextServKilom, nextServDepotID) values ('1', '39DE4DL', '76', '001', 'Green', '2019-07-30', '95000', '76');
insert into Vehicle (mixID, regNum, depotID, fleetNum, colour, nextServDate, nextServKilom, nextServDepotID) values ('2', '99ME2KW', '10', '002', 'White', '2019-08-15', '70000', '10');
insert into Vehicle (mixID, regNum, depotID, fleetNum, colour, nextServDate, nextServKilom, nextServDepotID) values ('3', '21CU1ET', '77', '003', 'Orange', '2019-07-20', '20000', '77');
insert into Vehicle (mixID, regNum, depotID, fleetNum, colour, nextServDate, nextServKilom, nextServDepotID) values ('4', '69YE2ET', '04', '004', 'Black', '2019-08-01', '23333', '76');
insert into Vehicle (mixID, regNum, depotID, fleetNum, colour, nextServDate, nextServKilom, nextServDepotID) values ('5', '42BET2E', '10', '005', 'Red', '2019-08-21', '45000', '77');
insert into Vehicle (mixID, regNum, depotID, fleetNum, colour, nextServDate, nextServKilom, nextServDepotID) values ('6', '39QRE2L', '04', '006', 'Yellow', '2019-09-17', '100000', '10');
insert into Vehicle (mixID, regNum, depotID, fleetNum, colour, nextServDate, nextServKilom, nextServDepotID) values ('7', 'SQLITE3', '77', '007', 'Orange', '2019-07-20', '1000', '77');

/*TEST DATA FOR THE VEHICLE REGNUM Length BEOFORE INSERT TRIGGER*/
insert into Vehicle (mixID, regNum, depotID, fleetNum, colour, nextServDate, nextServKilom, nextServDepotID) values ('8', 'five', '77', '008', 'Orange', '2019-07-20', '1000', '77');


/*TEST DATA FOR SERVICEHISTORY*/
insert into ServiceHistory (regNum, depotID, date, cost, description) values ('39DE4DL', '04', '2010-01-20', '300.00', 'Regular Checkup');


/*TEST DATA FOR BOOKING*/
insert into Booking (bookingID, ClientID, depotID, mixID, Startdate, hireDays, colour) values ('ABC', '94729472', '10', '6', '2019-08-21', '3', 'Pink');


/*TEST DATA FOR DAILYTARIFF*/
insert into DailyTariff (tariffID, conditions) values ('01', 'City Driving Only');
insert into DailyTariff (tariffID, conditions) values ('02', 'Non-Full License');
insert into DailyTariff (tariffID, conditions) values ('03', 'Rural Driving');
insert into DailyTariff (tariffID, conditions) values ('04', 'Under 21');

/*TEST DATA FOR DAILYTARIFFCOST*/
insert into DailyTariffCost (mixID, tariffID, rentalPrice) values ('6', '04', '190.00');
insert into DailyTariffCost (mixID, tariffID, rentalPrice) values ('3', '01', '500.00');
insert into DailyTariffCost (mixID, tariffID, rentalPrice) values ('6', '03', '140.00');


/*TEST DATA FOR INSURANCE*/
insert into Insurance (insuranceID, policyType, cost) values ('12345', 'FULLCOVER', '9.99');
insert into Insurance (insuranceID, policyType, cost) values ('23451', 'EXCESSREDUCTION', '5.99');
insert into Insurance (insuranceID, policyType, cost) values ('34512', 'EXCESSREMOVAL', '5.99');

/*TEST DATA FOR THE INSURANCE POLICY TYPE BEOFRE INSERT TRIGGER*/ 
insert into Insurance (insuranceID, policyType, cost) values ('34522', 'EXCESSRMOVAL', '10.99');

/*TEST DATA FOR HIRED VEHICES*/
insert into HiredVehicle (regNum,  tariffID, depotID, clientID, date, cardType, cardNo, kilometrage, days, policyNumber) values ('21CU1ET', '01', '77', '92848274', '2019-01-15', 'MASTERCARD', '5310392029392383464', '85000', '4', null);
insert into HiredVehicle (regNum,  tariffID, depotID, clientID, date, cardType, cardNo, kilometrage, days, policyNumber) values ('21CU1ET', '01', '77', '92848274', '2019-04-20', 'MASTERCARD', '5310392029392383464', '91000', '2', '001539');
insert into HiredVehicle (regNum,  tariffID, depotID, clientID, date, cardType, cardNo, kilometrage, days, policyNumber) values ('69YE2ET', '04', '04', '69696969', '2019-03-20', 'MASTERCARD', '5310392029391383464', '41000', '2', null);
insert into HiredVehicle (regNum,  tariffID, depotID, clientID, date, cardType, cardNo, kilometrage, days, policyNumber) values ('SQLITE3', '01', '10', '69696969', '2019-04-17', 'MASTERCARD', '5310392029391383464', '91000', '2','001534');

/*TEST DATA FOR HIREDVEHICLEDRIVER*/
insert into HiredVehicleDriver (regNum, date, clientID, DriverClientID) values ('21CU1ET', '2019-01-15', '92848274','92848274');
insert into HiredVehicleDriver (regNum, date, clientID, DriverClientID) values ('21CU1ET', '2019-01-15', '92848274','20482482');
insert into HiredVehicleDriver (regNum, date, clientID, DriverClientID) values ('21CU1ET', '2019-04-20', '92848274','92848274');
insert into HiredVehicleDriver (regNum, date, clientID, DriverClientID) values ('69YE2ET', '2019-03-20', '69696969','94729472');
insert into HiredVehicleDriver (regNum, date, clientID, DriverClientID) values ('69YE2ET', '2019-03-20', '69696969','92848274');
insert into HiredVehicleDriver (regNum, date, clientID, DriverClientID) values ('SQLITE3', '2019-04-17', '69696969','94729472');

/*TEST DATA FOR INSURES*/
insert into Insures (policyNumber, insuranceID) values ('001539', '12345');
insert into Insures (policyNumber, insuranceID) values ('001534', '23451');


/*TEST DATA FOR INVOICEINFO*/

insert into Invoice (invoiceID, higherDate, qualityCheck, regNum, clientID)  values ('393', '2019-04-20', 'Yes', '21CU1ET', '92848274');

/*TEST DATA FOR INVOICEINFO  quality Check trigger*/
insert into Invoice (invoiceID, higherDate, qualityCheck, regNum, clientID, datePaid) values ('393', '2019-04-20', 'Ys', '21CU1ET', '92848274', NULL);

insert into Records (invoiceID,cost) values ('393','1019.98');