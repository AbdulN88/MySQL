CREATE TABLE Directorates
(
	Directorate varchar(100) NOT NULL,
	PRIMARY KEY (Directorate)
);

INSERT INTO Directorates
(	Directorate
)
VALUES
(
	'Chief Executive'
);

INSERT INTO Directorates
(
	Directorate
)
VALUES
(
	'People'
);

INSERT INTO Directorates
(Directorate)
VALUES
('Place');

INSERT INTO Directorates
(Directorate)
VALUES
('Resources');

CREATE TABLE Divisions
(
Division varchar(200) NOT NULL,
Directorate varchar(100),
PRIMARY KEY (Division),
FOREIGN KEY (Directorate) REFERENCES Directorates(Directorate)
);

INSERT INTO Divisions
(Division, Directorate)
VALUES
('ICT, Transformation & Customer Services', 'Resources');

INSERT INTO Divisions
(Division, Directorate)
VALUES
('Streetscene and Greenspace', 'Place');

INSERT INTO Divisions
(Division, Directorate)
VALUES
('Strategy, Commissioning and Transformation', 'People');

INSERT INTO Divisions
(Division, Directorate)
VALUES
('Communications', 'Chief Executive');

CREATE TABLE Services
(
Service varchar(200) NOT NULL,
Division varchar(200),
PRIMARY KEY (Service),
FOREIGN KEY (Division) REFERENCES Divisions(Division)
);

INSERT INTO Services
(Service, Division)
VALUES
(
'ICT Strategy, Systems and Web Development', 'ICT, Transformation & Customer Services'
);

INSERT INTO Services
(Service, Division)
VALUES
(
'Childrens Strategy & Commissioning', 'Strategy, Commissioning and Transformation'
);

INSERT INTO Services
(Service, Division)
VALUES
(
'Building Sustainable Communities', 'Streetscene and Greenspace'
);

INSERT INTO Services
(Service, Division)
VALUES
(
'Communications', 'Communications'
);

CREATE TABLE Teams
(
Team varchar(200) NOT NULL,
Service varchar(200) NOT NULL,
PRIMARY KEY (Team),
FOREIGN KEY (Service) REFERENCES Services(Service)
);

INSERT INTO Teams
(Team, Service)
VALUES
('Systems and Web Development', 'ICT Strategy, Systems and Web Development');

INSERT INTO Teams
(Team, Service)
VALUES
('Sustainability and Low Carbon', 'Building Sustainable Communities');

INSERT INTO Teams
(Team, Service)
VALUES
('Participation Team ', 'Childrens Strategy & Commissioning');

CREATE TABLE Employees
(
EmployeeRef int NOT NULL AUTO_INCREMENT,
Team varchar(200),
Forename varchar(255),
Surname varchar(255),
Role varchar(150),
DOB date,
AddressLine1 varchar(255),
AddressLine2 varchar(255),
City varchar(120),
Postcode varchar(8),
PRIMARY KEY (EmployeeRef),
FOREIGN KEY (Team) REFERENCES Teams(Team)
); 

INSERT INTO Employees
(Team, Forename, Surname, Role, DOB,
AddressLine1, AddressLine2, City, Postcode)
VALUES
('Systems and Web Development', 'Abdul', 'Naqshband', 'Graduate Systems Development Analyst',
'1988-12-19', '244 Flaxley Road', 'Stechford', 'Birmingham', 'B33 9HD');

INSERT INTO Employees
(Team, Forename, Surname, Role, DOB,
AddressLine1, AddressLine2, City, Postcode)
VALUES
('Systems and Web Development', 'Cassy', 'Froth', 'Systems Development Officer',
'1968-09-22', '450 Coplow Avenue', 'Evington', 'Leicester', 'LE5 1AD');

INSERT INTO Employees
(Team, Forename, Surname, Role, DOB,
AddressLine1, AddressLine2, City, Postcode)
VALUES
('Participation Team', 'Sheila', 'Cakes', 'Childrens Champion',
'1964-10-01', '56 Cedars Avenue', '', 'Coventry', 'CV6 2FD');

INSERT INTO Employees
(Team, Forename, Surname, Role, DOB,
AddressLine1, AddressLine2, City, Postcode)
VALUES
('Sustainability and Low Carbon', 'Monika', 'Jordan', 'Sustainability Consultant',
'1972-04-25', 'Floor 2', '42 New Union Street', 'Coventry', 'CV1 2HN');

CREATE TABLE Rota
(
RotaNo int NOT NULL AUTO_INCREMENT,
EmployeeRef int,
ShiftDate date,
Hours int,
PayFrequency varchar(50),
RateofPay int,
PRIMARY KEY (RotaNo),
FOREIGN KEY (EmployeeRef) REFERENCES Employees(EmployeeRef)
);
  
INSERT INTO Rota
(EmployeeRef, ShiftDate, Hours, PayFrequency, RateofPay)
VALUES
('1','2016-04-18','7.25','Hourly','10.13');

INSERT INTO Rota
(EmployeeRef, ShiftDate, Hours, PayFrequency, RateofPay)
VALUES
('2','2016-04-18','6.3','Hourly','10.13');