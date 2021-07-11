CREATE TABLE Employee (
    EmployeeID INTEGER PRIMARY KEY,
    Name VARCHAR(30),
    Email VARCHAR(200),
    Location VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Flight (
    FlightID INTEGER PRIMARY KEY,
    Departure VARCHAR(50),
    Arrival VARCHAR(50),
    Type VARCHAR(50)
);

CREATE TABLE Crew (
    CrewID INTEGER PRIMARY KEY,
    EmployeeID INTEGER,
    FlightID INTEGER,
    Title VARCHAR(60),
    CONSTRAINT Employee_FK FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT Flight_FK FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

ALTER TABLE Flight ADD COLUMN FlightNo VARCHAR(6);

INSERT INTO Employee (employeeid, name, email, location, phone) 
VALUES (1, 'John Doe', 'john.doe@gmail.com', 'London', '123456789'),
(2, 'Jane Shepard', 'janeshep@gmail.com', 'Vancouver', '987654321');
INSERT INTO Flight (flightid, departure, arrival, type)
VALUES (1, 'London', 'Moscow', 'Economy class'),
(2, 'Budapest', 'Madrid', 'Business class');
INSERT INTO Crew (crewid, employeeid, flightid, title)
VALUES (1, 1, 1, 'best pilot'),
(2, 1, 2, 'prettiest stewardess');

SELECT FlightID, Departure, FlightNo FROM Flight ORDER BY FlightNo;

SELECT * FROM Crew 
INNER JOIN Flight ON crew.flightid = flight.flightid
INNER JOIN Employee ON employee.employeeid = crew.employeeid
ORDER BY crewid desc;

SELECT * FROM Employee;
SELECT * FROM Flight;
SELECT * FROM Crew;
