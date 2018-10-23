DELETE FROM Employee
WHERE EmployeeId = 1;

DELETE FROM Employee;

DROP TABLE ItemOrder;


-------------------------Customer--------------------------


CREATE TABLE Customer (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	FirstName TEXT NOT NULL,
	LastName TEXT NOT NULL,
	DateCreated DATETIME NOT NULL, 
	Active BOOLEAN NOT NULL
);

CREATE TABLE Product (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Price DOUBLE NOT NULL,
	Title TEXT NOT NULL,
	Description TEXT NOT NULL,
	Quantity INTEGER NOT NULL,
	DateCreated DATETIME NOT NULL,
	CustomerId INTEGER NOT NULL,
	ProductTypeId INTEGER NOT NULL,
		FOREIGN KEY(CustomerId) REFERENCES Customer(Id),
		FOREIGN KEY(ProductTypeId) REFERENCES ProductType(Id)
);

CREATE TABLE ProductType (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Type TEXT NOT NULL
);

CREATE TABLE PaymentType (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Type TEXT NOT NULL,
	AccountNumber INTEGER NOT NULL,
	DateCreated DATETIME NOT NULL,
	CustomerId INTEGER NOT NULL,
		FOREIGN KEY(CustomerId) REFERENCES Customer(Id)
);

CREATE TABLE ItemOrder (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	CustomerId INTEGER NOT NULL,
	PaymentTypeId INTEGER NOT NULL,
	DateCreated DATETIME NOT NULL,
		FOREIGN KEY(CustomerId) REFERENCES Customer(Id),
		FOREIGN KEY(PaymentTypeId) REFERENCES PaymentType(Id)
);

CREATE TABLE ProductOrder (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ProductId INTEGER NOT NULL,
	ItemOrderId INTEGER NOT NULL,
		FOREIGN KEY(ProductId) REFERENCES Product(Id),
		FOREIGN KEY(ItemOrderId) REFERENCES ItemOrder(Id)
);


---------------------------Company--------------------------



CREATE TABLE Employee (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	FirstName TEXT NOT NULL,
	LastName TEXT NOT NULL,
	Supervisor BOOLEAN NOT NULL,
	DepartmentId INTEGER NOT NULL,
		FOREIGN KEY(DepartmentId) REFERENCES Department(Id)
);

CREATE TABLE Department (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	DepartmentName TEXT NOT NULL,
	Budget DOUBLE NOT NULL
);

CREATE TABLE Training (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	TrainingName TEXT NOT NULL,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
	Capacity INTEGER NOT NULL
);

CREATE TABLE EmployeeTraining (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	EmployeeId INTEGER NOT NULL,
	TrainingId INTEGER NOT NULL,
		FOREIGN KEY(EmployeeId) REFERENCES Employee(Id),
		FOREIGN KEY(TrainingId) REFERENCES Training(Id)
);

CREATE TABLE Computer (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	PurchaseDate DATETIME NOT NULL,
	DecommissionDate DATETIME NOT NULL,
	Manufacturer TEXT NOT NULL,
	Model TEXT NOT NULL
);

CREATE TABLE EmployeeComputer (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	AssignedDate DATETIME NOT NULL,
	UnassignedDate DATETIME NOT NULL,
	EmployeeId INTEGER NOT NULL,
	ComputerId INTEGER NOT NULL,
		FOREIGN KEY(EmployeeId) REFERENCES Employee(Id),
		FOREIGN KEY(ComputerId) REFERENCES Computer(Id)
);

INSERT INTO Department (DepartmentName, Budget) VALUES ("Looney Tunes", 1000000);

INSERT INTO Employee (FirstName, LastName, Supervisor, DepartmentId) VALUES ("Donald", "Duck", 1, 1); 

INSERT INTO Training (TrainingName, StartDate, EndDate, Capacity) VALUES ("English", "2018-01-31 06: 06: 06[.666]", "2018-10-31 06: 06: 06[.666]", "666");

INSERT INTO EmployeeTraining (EmployeeId, TrainingId) VALUES (1, 1);

INSERT INTO Computer (PurchaseDate, DecommissionDate, Manufacturer, Model) VALUES ("2017-12-25 12: 12: 12[.1212]", "", "HP", "EliteBook 8460p");

INSERT INTO EmployeeComputer (AssignedDate, UnassignedDate, EmployeeId, ComputerId) VALUES ("2018-01-31 06: 06: 06[.666]", "", 1, 1);

INSERT INTO Customer (FirstName, LastName, DateCreated, Active) VALUES ("Mickey", "Mouse", "2018-02-01 06: 06: 06[.666]", 1);

INSERT INTO PaymentType (Type, AccountNumber, DateCreated, CustomerId) VALUES ("Credit Card", 1234, "2018-02-01 06: 06: 06[.666]", 1);

INSERT INTO ItemOrder (CustomerId, PaymentTypeId, DateCreated) VALUES (1, 1, "2018-02-01 06: 06: 06[.666]");

INSERT INTO ProductType (Type) VALUES ("Sweater"); 

INSERT INTO Product (Price, Title, Description, Quantity, DateCreated, CustomerId, ProductTypeId) VALUES ("$6.66", "Halloween Bat Sweater", "Pure Egyptian Cotton", 3, "2018-02-02 06: 06: 06[.666]", 1, 1);

INSERT INTO ProductOrder (ProductId, ItemOrderId) VALUES (1, 1);
