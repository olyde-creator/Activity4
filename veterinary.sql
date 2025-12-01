CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments;(
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid)
    REFERENCES animals(animalid)
);

CREATE TABLE doctors ( 
doctorid INT PRIMARY KEY, 
dfirstname VARCHAR(50), 
dlastname VARCHAR(50), 
speciality VARCHAR(50), 
phone VARCHAR(15), 
email VARCHAR(100) 
); 

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10,2),
    paymentdate TIME,
    FOREIGN KEY (appointid) 
    REFERENCES appointments (appointid)
);

CREATE TABLE medicalrecords ( 
recordid INT PRIMARY KEY, 
animalid INT, 
recorddate DATETIME, 
doctorid INT, 
diagnosis VARCHAR(255), 
prescription VARCHAR(255), 
notes TEXT, 
FOREIGN KEY (animalid) REFERENCES animals(animalid), 
FOREIGN KEY (doctorid) REFERENCES doctors(doctorid) 
); 

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES
(1, 'Maria', 'Santos', '123 Mango St., Cebu City', '09171234567', 'maria.santos@example.com'),
(2, 'Juan', 'Dela Cruz', '45 Banilad Ave., Cebu City', '09281234567', 'juan.delacruz@example.com'),
(3, 'Anna', 'Reyes', '78 Lopez Jaena St., Mandaue City', '09391234567', 'anna.reyes@example.com'),
(4, 'Mark', 'Torres', '256 Mabolo St., Cebu City', '09451234567', 'mark.torres@example.com'),
(5, 'Carla', 'Gomez', '12 Lapu-Lapu Village, Lapu-Lapu City', '09561234567', 'carla.gomez@example.com'),
(6, 'Peter', 'Lim', '92 Hernan Cortes, Mandaue City', '09671234567', 'peter.lim@example.com'),
(7, 'Jenny', 'Fernandez', '34 Tres de Abril, Cebu City', '09781234567', 'jenny.fernandez@example.com'),
(8, 'Robert', 'Hernandez', '56 A.S. Fortuna, Mandaue City', '09891234567', 'robert.hernandez@example.com'),
(9, 'Liza', 'Navarro', '18 Colon St., Cebu City', '09901234567', 'liza.navarro@example.com'),
(10, 'Daniel', 'Morales', '77 Osmeña Blvd., Cebu City', '09181235555', 'daniel.morales@example.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Buddy', 'Dog', 'Labrador', '2020-03-10', 'Male', 'Yellow', 1),
(2, 'Whiskers', 'Cat', 'Persian', '2019-07-22', 'Female', 'White', 2),
(3, 'Rex', 'Dog', 'German Shepherd', '2021-01-15', 'Male', 'Black', 3),
(4, 'Mittens', 'Cat', 'Siamese', '2020-11-05', 'Female', 'Cream', 4),
(5, 'Max', 'Dog', 'Bulldog', '2018-04-18', 'Male', 'Brown', 5),
(6, 'Simba', 'Cat', 'Bengal', '2021-06-25', 'Male', 'Orange', 6),
(7, 'Luna', 'Cat', 'Maine Coon', '2019-09-30', 'Female', 'Gray', 7),
(8, 'Charlie', 'Dog', 'Beagle', '2022-02-14', 'Male', 'Tri-color', 8),
(9, 'Bella', 'Dog', 'Poodle', '2017-12-08', 'Female', 'White', 9),
(10, 'Coco', 'Cat', 'Ragdoll', '2020-05-27', 'Female', 'Brown', 10);