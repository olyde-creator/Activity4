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

INSERT INTO appointments (appointid, animalid, appointdate, reason)
VALUES
(1, 1, '2024-01-10', 'General Checkup'),
(2, 2, '2024-01-12', 'Vaccination'),
(3, 3, '2024-01-15', 'Limping'),
(4, 4, '2024-01-18', 'Dental Cleaning'),
(5, 5, '2024-02-01', 'Skin Allergy'),
(6, 6, '2024-02-05', 'Flea Treatment'),
(7, 7, '2024-02-10', 'Vaccination'),
(8, 8, '2024-02-14', 'Eye Infection'),
(9, 9, '2024-02-20', 'Grooming'),
(10, 10, '2024-03-01', 'Checkup');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD registereddate DATE;

ALTER TABLE invoices 
CHANGE paymentdate paymenttime TIME;

DELETE FROM appointments
WHERE animalid = 6;

UPDATE doctors
SET dlastname = 'Reyes-Gonzales'
WHERE doctorid = 4;

SELECT DISTINCT species
FROM animals;

SELECT SUM(totalamount) AS total_sales
FROM invoices;

SELECT COUNT(*) AS total_appointments
FROM appointments a
JOIN animals b ON a.animalid = b.animalid
JOIN owners c ON b.ownerid = c.ownerid
WHERE c.ofirstname = 'Maria';

SELECT animals.name, COUNT(appointments.appointid) AS total_appointments
FROM animals
JOIN appointments ON animals.animalid = appointments.animalid
GROUP BY animals.name
ORDER BY total_appointments DESC
LIMIT 1;