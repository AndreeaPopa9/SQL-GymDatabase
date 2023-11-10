
-- Creating the CrossFitGym database for storing gym data.
CREATE DATABASE CrossFitGym;

-- Creating the GymMembers table to store information about gym members. 
CREATE TABLE GymMembers (
MemberId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL, 
Gender CHAR(1),
DateofBirth DATE,
Email VARCHAR(50),
Phone VARCHAR (20) NOT NULL
);

-- Renaming the column Phone to PhoneNumber to make the column name more descriptive.
ALTER TABLE GymMembers 
RENAME COLUMN Phone TO PhoneNumber;

-- This statement is used to retrieve and display all the records from the GymMembers table.
SELECT * FROM GymMembers;

-- Insert data into the GymMembers table. 
INSERT INTO GymMembers (FirstName, LastName, Gender, DateOfBirth, Email, PhoneNumber)
VALUES ("Jeff", "Johnson", "M", "1990-07-20", "jeff.johnson@gmail.com", "800-882-8572"),
("Emilia", "Fernandez", "F", "1997-10-18", "emilia.fernandez@email.com", "750-055-5666"),
("Sarah", "Davis", "F", "1993-09-07", "sarah.davis@email.com", "772-233-3444"),
("Michael", "Brown", "M", "1995-06-26", "michael.brown@email.com", "783-411-1222"),
("Pierre", "Dupont", "M", "1989-03-16", "pierre.dupont@yahoo.fr", "750-055-5662"),
("Roger", "Hoffman", "M", "1995-03-24", "r.hoffman@gmail.com", "700-342-4554");

INSERT INTO GymMembers (FirstName, LastName, Gender, PhoneNumber)
VALUES ("Marie", "Connor", "F", "900-234-2753");

INSERT INTO GymMembers (FirstName, LastName, Gender, DateOfBirth, PhoneNumber)
VALUES ("Alexander", "Broadbet", "M", "1996-02-21", "700-235-2342"), 
("Anna", "Lumadeline", "F", "1992-05-08", "700-342-5493");

-- Calculation of the number of records in the GymMembers table with a date of birth between 1990-01-01 and 1993-01-01. 
SELECT COUNT(*)
FROM GymMembers 
WHERE DateOfBirth BETWEEN "1990-01-01" AND "1993-01-01";

-- This view displays basic information about gym members.
CREATE VIEW MemberInfo AS
SELECT MemberId, FirstName, LastName, Gender, DateOfBirth, Email, PhoneNumber
FROM GymMembers;

-- Creating the GymStaff table to store information about the fitness center staff.
CREATE TABLE GymStaff (
StaffId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Position VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL, 
Phone VARCHAR (50) NOT NULL
);

-- Altering the Phone column to reduce the maximum text length to 30 characters. 
ALTER TABLE GymStaff 
MODIFY COLUMN Phone VARCHAR (30);

-- Adding the Address column to store the staff's addresses. 
ALTER TABLE GymStaff
ADD COLUMN Address VARCHAR(100);

-- Dropping the Address column from the table structure. 
ALTER TABLE GymStaff 
DROP COLUMN Address;

-- Selecting all records from the GymStaff table. 
SELECT * FROM GymStaff;

-- Insert data for the fitness center staff into the GymStaff table. 
INSERT INTO GymStaff (FirstName, LastName, Position, Email, Phone)
VALUES ("Pablo", "Gonzalez", "Group Fitness Instructor", "pablo.g@gmail.com", "077-0090-0123"), 
("Jonathan", "Majestic", "Yoga Instructor", "jonathan.majestic@gmail.com", "079-1234-5678"),
("Rafael", "Douglas", "Box Instructor", "rafa.doug@gmail.com", "075-7011-1222"),
("Bernardo", "Temudo", "Swimming Instructor", "bernardo.temudo@gmail.com", "078-4567-8901"),
("Paloma", "Torres", "Group Fitness Instructor", "palomitatorre@gmail.com", "076-5432-1098");

-- Selecting the columns StaffId, FirstName, and Position for employees who do not have the position of "Yoga Instructor." 
SELECT StaffId, FirstName, Position 
FROM GymStaff
WHERE Position != "Yoga Instructor";

-- Selecting the columns FullName (concatenation of first names and last names), Position (without extra spaces), and NameLength (length of the name) for the fitness center employees.
SELECT CONCAT(Firstname, ' ' , LastName) as FullName, TRIM(Position),
LENGTH(FirstName) as NameLength
FROM GymStaff;

/* Creating an index named idx_employees_position on the Position column in the GymStaff table. 
The index is designed to optimize and speed up searches and queries on the column. */
CREATE INDEX idx_employees_position ON GymStaff(Position);

-- Getting the number of employees for each position in the GymStaff table and displaying only the positions with more than one employee.
SELECT Position, COUNT(*) AS TotalEmployees
FROM GymStaff
GROUP BY Position
HAVING COUNT(*) > 1;

-- Creating the GymEquipment table to keep track of fitness equipment. 
CREATE TABLE GymEquipment (
EquipmentID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Name VARCHAR(50),
Description TEXT,
PurchaseDate DATE, 
PurchasePrice DECIMAL(10, 2)
);

-- Moving the EquipmentId column to the front of the table structure.
ALTER TABLE GymEquipment
MODIFY COLUMN EquipmentId INT AUTO_INCREMENT FIRST;

-- Selecting all records from the GymEquipment table. 
SELECT * FROM GymEquipment;

-- Insert data into the GymEquipment table.  
INSERT INTO GymEquipment (Name, Description, PurchaseDate, PurchasePrice)
VALUES ("Treadmill", "A motorized treadmill with adjustable speed and incline settings, perfect for cardio workouts.", "2020-07-15", "1200.00"),
("Dumbbell Set", "A set of adjustable dumbbells ranging from 5 to 50 pounds, perfect for strength training.", "2020-08-09", "400.50"),
("Spinning bike", "A stationary indoor cycling device perfect for cardio training", "2020-08-20", "350.25"),
("Smith Machine", "A machine for safe and controlled weightlifting, featuring a barbell and adjustable bench.", "2020-08-25", "1600.75"),
("Yoga Mats (Set of 10)", "A set of high-quality yoga mats with non-slip surfaces, perfect for group fitness classes.", "2020-08-25", "150.00"),
("Speedy Reflex Bag Box (Set of 3)", "Durable and sturdy punch bag designed for quick strikes and precision training.", "2020-08-30", "239.97"),
("Pro Series Leather Boxing Gloves (Set of 3)", "Top-quality leather gloves provide excellent protection and comfort for both training and sparring.", "2020-08-30", "149.97");

--  Calculating the total purchase price of equipment from the GymEquipment table, using the alias 'TotalPrice'. 
SELECT SUM(PurchasePrice) AS TotalPrice FROM GymEquipment;

-- Finding the minimum purchase price from the GymEquipment table.
SELECT MIN(PurchasePrice) FROM GymEquipment;

-- Finding the maximum purchase price from the GymEquipment table.
SELECT MAX(PurchasePrice) FROM GymEquipment;

-- Calculating the average purchase price of equipment in the GymEquipment table using the AVG aggregate function.
SELECT AVG(PurchasePrice) FROM GymEquipment;

/* Selecting the 'EquipmentId' and 'Name' columns for equipment with a purchase price greater than 400. 
The subquery enclosed in parentheses is used to return all EquipmentId values for which PurchasePrice is greater than 400 from the GymEquipment table.
The main query (SELECT EquipmentId, Name) uses the WHERE clause to select only the records where EquipmentId matches the results of the subquery.
*/
SELECT EquipmentId, Name
FROM GymEquipment 
WHERE EquipmentId IN ( SELECT EquipmentId FROM GymEquipment WHERE PurchasePrice > 400 );

-- Selecting the first 5 records from the GymEquipment table, ordered by PurchaseDate in ascending order.
SELECT * FROM GymEquipment
ORDER BY PurchaseDate ASC LIMIT 5;

-- Analyzing the execution plan for SELECT * FROM GymEquipment.
EXPLAIN SELECT * FROM GymEquipment;

-- Creating the GymClasses table.
CREATE TABLE GymClasses (
ClassId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
ClassName VARCHAR(50) NOT NULL,
ScheduleDate DATE NOT NULL,
StartTime TIME NOT NULL,
EndTime TIME NOT NULL
);

/* Modifying the structure of the GymClasses table by changing the name of the ScheduleDate column to ScheduleDay.
Changing the data type of the column to TEXT and adding the NOT NULL constraint.*/

ALTER TABLE GymClasses
CHANGE COLUMN ScheduleDate ScheduleDay TEXT NOT NULL;

-- Selecting all records from the GymClasses table.  
SELECT * FROM GymClasses;

-- Insert data into the GymClasses table.  
INSERT INTO GymClasses (ClassName, ScheduleDay, StartTime, EndTime)
VALUES ("Box", "MONDAY-FRIDAY", "10:00:00", "11:00:00"),
("Endurance", "MONDAY-FRIDAY", "12:00:00", "13:00:00"),
("Spinning", "MONDAY-FRIDAY", "14:00:00", "15:00:00"),
("CrossFit Kids", "MONDAY-FRIDAY", "16:00:00", "17:00:00"),
("Swimming", "MONDAY-FRIDAY", "17:00:00", "18:00:00"),
("Pilates", "MONDAY-FRIDAY", "18:00:00", "19:00:00");

-- Table to manage the many-to-many relationship between GymClasses and GymStaff
CREATE TABLE ClassInstructor (
    ClassInstructorId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ClassId INT NOT NULL,
    StaffId INT NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES GymClasses (ClassId),
    FOREIGN KEY (StaffId) REFERENCES GymStaff (StaffId)
);

-- Insert data into the ClassInstructor table.
INSERT INTO ClassInstructor (ClassId, StaffId)
VALUES 
(1, 3),
(2, 3),
(3, 1),
(4, 5),
(5, 4),
(6, 5);

-- Selecting all records from the ClassInstructor table. 
SELECT * FROM ClassInstructor;

-- Creating the GymMemberships table to register gym memberships.
CREATE TABLE GymMemberships (
MembershipId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
MemberId INT NOT NULL,
StartDate DATE NOT NULL, 
EndDate DATE NOT NULL, 
MembershipType VARCHAR(50) NOT NULL,
Amount DECIMAL (10, 2) NOT NULL,
FOREIGN KEY (MemberId) 
REFERENCES GymMembers (MemberId)
); 

-- Selecting all records from the GymMemberships table. 
SELECT * FROM GymMemberships;

-- Insert data into the GymMembership table. 
INSERT INTO GymMemberships (MemberId, StartDate, EndDate, MembershipType, Amount)
VALUES
    (1, "2023-09-15", "2023-10-15", "Premium", 50.00),
    (2, "2023-09-16", "2023-10-16", "Standard", 40.00),
    (3, "2023-09-17", "2023-10-17", "Basic", 30.00),
    (4, "2023-09-12", "2023-10-12", "Premium", 50.00),
    (5, "2023-09-10", "2023-10-10", "Premium", 50.00),
    (6, "2023-09-07", "2023-10-07", "Standard", 40.00),
    (7, "2023-09-08", "2023-10-08", "Basic", 30.00),
    (8, "2023-09-17", "2023-10-17", "Premium", 50.00),
    (9,"2023-09-18", "2023-10-18", "Basic", 30.00);
    
-- Adding a new column 'Description' to the GymMemberships table
ALTER TABLE GymMemberships
ADD Description VARCHAR(100);

-- Updating Premium membership description
UPDATE GymMemberships
SET Description = "Includes access to all gym facilities and classes"
WHERE MembershipType = "Premium";

-- Updating Standard membership description
UPDATE GymMemberships
SET Description = "Standard gym access without spinning, swimming and pilates classes"
WHERE MembershipType = "Standard";

-- Updating Basic membership description
UPDATE GymMemberships
SET Description = "Basic gym access with no class privileges"
WHERE MembershipType = "Basic"; 

/* The "MemberWithMembership" view is created using an INNER JOIN operation between two tables, GymMembers and GymMemberships.
   Its primary objective is to consolidate information about gym members and their memberships. */
   
CREATE VIEW MemberWithMembership AS
SELECT M.MemberId, M.FirstName, M.LastName, M.Email, MM.StartDate, MM.EndDate, MM.MembershipType, MM.Amount
FROM GymMembers M
INNER JOIN GymMemberships MM ON M.MemberId = MM.MemberId;

/* After creating this trigger, the "Amount" column will be automatically calculated based on the "MembershipType",
 when inserting data into the GymMemberships table. */
 
DELIMITER //
CREATE TRIGGER CalculateMembershipAmount
BEFORE INSERT ON GymMemberships
FOR EACH ROW
BEGIN
    IF NEW.MembershipType = 'Premium' THEN
        SET NEW.Amount = 50.00;
    ELSEIF NEW.MembershipType = 'Standard' THEN
        SET NEW.Amount = 40.00;
    ELSEIF NEW.MembershipType = 'Basic' THEN
        SET NEW.Amount = 30.00;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid membership type specified.';
    END IF;
END;
// DELIMITER ;
 
/* This trigger, named "UpdateLastMembershipEndDate," automatically updates the "EndDate" of the member's last membership,
 when a new membership is added to the GymMemberships table. */
 
DELIMITER //
CREATE TRIGGER UpdateLastMembershipEndDate
AFTER INSERT ON GymMemberships
FOR EACH ROW
BEGIN
    UPDATE GymMemberships
    SET EndDate = NEW.StartDate - INTERVAL 1 DAY
    WHERE MemberId = NEW.MemberId
    AND MembershipId != NEW.MembershipId
    ORDER BY EndDate DESC
    LIMIT 1;
END;
//
DELIMITER ;

-- Creating the FitnessGoals table to track members' fitness goals.
CREATE TABLE FitnessGoals (
GoalId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
MemberId INT NOT NULL,
GoalDescription TEXT NOT NULL,
TargetDate DATE, 
FOREIGN KEY (MemberId) 
REFERENCES GymMembers (MemberId)
);

-- Selecting all records from the FitnessGoals table.  
SELECT * FROM FitnessGoals;

-- Insert data into the FitnessGoals table. 
INSERT INTO FitnessGoals (MemberId, GoalDescription, TargetDate)
VALUES
    (1, "Lose 10 pounds", "2023-12-31"),
    (2, "Build muscle", "2024-06-30"),
    (3, "Enhance endurance", "2024-02-15"),
    (4, "Improve posture", "2024-03-15"),
    (5, "Gain strength", "2024-03-20"),
    (6, "Maintain weight", "2023-12-30"),
    (7, "Train for a marathon", "2024-07-15"),
    (8, "Increase flexibility", "2023-10-15"),
    (9, "Maintain weight", "2024-02-28");

-- Selecting fitness goals that either end in "rance" in the description or have a TargetDate in February.
SELECT * FROM FitnessGoals
WHERE GoalDescription LIKE "%rance" 
OR TargetDate LIKE "%-02-%";

-- Selecting fitness goals that start with "In" in the description and end with "15" in the TargetDate.
SELECT * FROM FitnessGoals
WHERE GoalDescription LIKE "In%" 
AND TargetDate LIKE "%15";

-- Selecting fitness goals of members with MemberId between 5 and 9.
SELECT * FROM FitnessGoals
WHERE MemberId BETWEEN 5 AND 9;

-- Performing an INNER JOIN query between FitnessGoals and GymMembers based on the MemberId column.
SELECT * FROM FitnessGoals
INNER JOIN GymMembers ON FitnessGoals.MemberId = GymMembers.MemberId;

-- Performing a CROSS JOIN query between FitnessGoals and GymMembers.
SELECT * FROM FitnessGoals
CROSS JOIN GymMembers;

-- Performing a LEFT JOIN query between FitnessGoals and GymMembers based on the MemberId column.
SELECT * FROM FitnessGoals
LEFT JOIN GymMembers ON FitnessGoals.MemberId = GymMembers.MemberId;

-- Performing a RIGHT JOIN query between FitnessGoals and GymMembers based on the MemberId column.
SELECT * FROM FitnessGoals
RIGHT JOIN GymMembers ON FitnessGoals.MemberId = GymMembers.MemberId;

-- Update the description of the goal with "Lose 5 pounds" for GoalId 1.
UPDATE FitnessGoals
SET GoalDescription = "Lose 5 pounds"
WHERE GoalId = 1;

-- Concatenate the text "Gain strength." to the description of the goal with GoalId 1.
UPDATE FitnessGoals
SET GoalDescription = CONCAT(GoalDescription, "Gain strength.")
WHERE GoalId = 1;

-- Display all records from the FitnessGoals table where TargetDate is less than '2024-01-01'.
SELECT * FROM FitnessGoals
WHERE TargetDate < "2024-01-01";

-- Display the first 6 records from the FitnessGoals table.
SELECT * FROM FitnessGoals
LIMIT 6;

-- Display the next 5 records from the FitnessGoals table, starting from the 4th row.
SELECT * FROM FitnessGoals
LIMIT 5 OFFSET 4;

-- Display all the records from the FitnessGoals table where TargetDate is not null.
SELECT * FROM FitnessGoals
WHERE TargetDate IS NOT NULL;

-- Display all records from the FitnessGoals table sorted in ascending order by TargetDate.
SELECT * FROM FitnessGoals
ORDER BY TargetDate ASC;

-- Display all records from the FitnessGoals table sorted in descending order by TargetDate.
SELECT * FROM FitnessGoals
ORDER BY TargetDate DESC;

/* This query counts the total number of goals (TotalGoals) with each unique goal description (GoalDescription) in the FitnessGoals table.
It uses the GROUP BY clause to group the records by goal description, and the COUNT(*) function calculates the count of goals in each group. */

SELECT GoalDescription, COUNT(*) AS TotalGoals
FROM FitnessGoals
GROUP BY GoalDescription;

-- Creating the Workouts table for recording workout sessions.
CREATE TABLE Workouts (
    WorkoutId INT AUTO_INCREMENT NOT NULL,
    WorkoutName VARCHAR(100) NOT NULL,
    WorkoutDate DATE NOT NULL,
    WorkoutDescription TEXT,
    DurationMinutes INT,
    CaloriesBurned DECIMAL(8, 2) NOT NULL,
    MemberId INT NOT NULL,
    PRIMARY KEY (WorkoutId),
    CONSTRAINT fk_Workouts_GymMembers
    FOREIGN KEY (MemberId) 
    REFERENCES GymMembers (MemberId)
);

-- Display all records from the Workouts table.
SELECT * FROM Workouts;

-- Insert records for workout sessions into the Workouts table.
INSERT INTO Workouts (WorkoutName, WorkoutDate, WorkoutDescription, DurationMinutes, CaloriesBurned, MemberId)
VALUES ('Circuit Training', '2023-09-15', 'Intensive circuit training.', 60, 400.00, 1),
('Weightlifting', '2023-09-16', 'Strength training workout.', 45, 300.00, 2),
('Cardio Session', '2023-09-17', 'Intense cardio workout.', 30, 350.00, 3),
('CrossFit Workout', '2023-09-20', 'High-intensity CrossFit training', 60, 500.00, 4),
('Running', '2023-09-20', '5-mile run', 45, 400.00, 5),
('Strength Training', '2023-09-20', 'Weightlifting and strength training', 75, 600.00, 6),
('HIIT Session', '2023-09-20', 'High-Intensity Interval Training', 30, 350.00, 7),
('Yoga', '2023-09-20', 'Vinyasa Flow Yoga', 60, 250.00, 8),
('Swimming', '2023-09-20', 'Swim laps in the pool', 45, 400.00, 9);

/* Display the workout names, burned calories, and the names of male members who participated in these workouts.
Using a RIGHT JOIN to associate records from the Workouts table with records from the GymMembers table based on the MemberId column.
Aliases are used to shorten the table names and make the query easier to read. */ 

SELECT W.WorkoutName, W.CaloriesBurned, G.FirstName, G.LastName
FROM Workouts W
RIGHT JOIN GymMembers G ON W.MemberId = G.MemberId
WHERE G.Gender = 'M';

/* This query performs a CROSS JOIN between the Workouts (aliased as W) and GymMembers tables.
A CROSS JOIN combines every record from the Workouts table with every record from the GymMembers table, creating a Cartesian product.
As a result, it generates all possible combinations of workout sessions and gym members without any specific matching conditions. */ 

SELECT W.WorkoutName, W.CaloriesBurned, FirstName, LastName
FROM Workouts W
CROSS JOIN GymMembers;

/* Selecting the names (FirstName and LastName) of gym members who have performed at least one recorded workout (Workout) in the Workouts table. 
The subquery counts the records in the Workouts table for each member (GROUP BY MemberId).
Then, it filters the groups to return only those who have at least one recorded workout (HAVING COUNT(WorkoutId) >= 1). */

SELECT FirstName, LastName
FROM GymMembers
WHERE MemberId IN (
    SELECT MemberId
    FROM Workouts
    GROUP BY MemberId
    HAVING COUNT(WorkoutId) >= 1
);

-- Display the names of workouts, workout dates, and burned calories, sorted in ascending order by workout dates.
SELECT WorkoutName, WorkoutDate, CaloriesBurned
FROM Workouts
ORDER BY WorkoutDate ASC;

-- Display the names of workouts, workout dates, and burned calories, sorted in ascending order by workout dates and in descending order by burned calories.
SELECT WorkoutName, WorkoutDate, CaloriesBurned
FROM Workouts
ORDER BY WorkoutDate ASC, CaloriesBurned DESC;

-- Update the number of burned calories for WorkoutId = 3.
UPDATE Workouts
SET CaloriesBurned = 400.00
WHERE WorkoutId = 3;

/* By performing an INNER JOIN between Workouts and GymMembers on the MemberId field, this view associates workout records
   with the respective gym members. 
   The purpose of this view is to simplify the retrieval of workout history for gym members. */
   
CREATE VIEW WorkoutHistory AS
SELECT W.WorkoutId, G.FirstName, G.LastName, W.WorkoutName, W.WorkoutDate, W.DurationMinutes, W.CaloriesBurned
FROM Workouts W
INNER JOIN GymMembers G ON W.MemberId = G.MemberId;

-- Creating the CrossGymFitFeedback table to store each member's feedback
CREATE TABLE CrossFitGymFeedback (
    FeedbackId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    MemberId INT NOT NULL,
    FeedbackDate DATE NOT NULL,
    FeedbackText TEXT NOT NULL,
    FOREIGN KEY (MemberId) 
    REFERENCES GymMembers(MemberId)
);

-- Selecting all records from the CrossFitGymFeedback table.
SELECT * FROM CrossFitGymFeedback;

-- Inserting feedback records into CrossFitGymFeedback table.
INSERT INTO CrossFitGymFeedback (MemberId, FeedbackDate, FeedbackText)
VALUES (1, '2023-10-20', 'Great experience.'),
(2, '2023-10-21', 'I love the CrossGymFit classes.'), 
(3, '2023-10-23', 'The instructors are very motivating.'),
(4, '2023-10-24', 'I recommend CrossFitGym.'),
(5, '2023-10-27', 'I have great progress!'),
(6, '2023-10-28', 'The best gym I have been to.'),
(7, '2023-11-03', 'I feel stronger and healthier.'),
(8, '2023-11-01', 'I like the variety of workout options available.'),
(9, '2023-11-08', 'The CrossFitGym community is very supportive.');

-- Updating the feedback text for Member 1 in CrossFitGymFeedback
UPDATE CrossFitGymFeedback
SET FeedbackText = CONCAT(FeedbackText, 'The gym has exceeded my expectations.')
WHERE MemberId = 1;

-- Adding a new column named 'Rating' to store ratings in CrossGymFitFeedback
ALTER TABLE CrossFitGymFeedback
ADD Rating INT NOT NULL; 

-- Changing the name of the 'Rating' column to 'RatingMembers' in CrossFitGymFeedback
ALTER TABLE CrossFitGymFeedback
CHANGE COLUMN Rating RatingMembers INT;

-- Updating the 'RatingMembers' column with rating from members
UPDATE CrossFitGymFeedback
SET RatingMembers = 
    CASE
        WHEN MemberId = 1 THEN 5 
        WHEN MemberId = 2 THEN 4  
        WHEN MemberId = 3 THEN 4  
        WHEN MemberId = 4 THEN 5 
        WHEN MemberId = 5 THEN 4  
        WHEN MemberId = 6 THEN 5  
        WHEN MemberId = 7 THEN 5  
        WHEN MemberId = 8 THEN 4  
        WHEN MemberId = 9 THEN 5  
    END;
    
-- Selecting MemberId and FeedbackText with a rating greater than 4
SELECT MemberId, FeedbackText
FROM CrossFitGymFeedback
WHERE RatingMembers > 4;

-- Calculating the average rating from the CrossFitGymFeedback table
SELECT AVG(RatingMembers) AS AverageRating
FROM CrossFitGymFeedback;

/* This procedure calculates the average rating provided by a specific member in the CrossFitGymFeedback table.
It takes the memberId as input and returns the averageRating as output. */

DELIMITER //
CREATE PROCEDURE CalculateAverageRatingForMember(IN memberId INT, OUT averageRating INT)
BEGIN
    SELECT AVG(RatingMembers) INTO averageRating
    FROM CrossFitGymFeedback
    WHERE MemberId = memberId;
END;
//
DELIMITER ;

/* This SQL statement calls the CalculateAverageRatingForMember procedure to calculate the average rating.
The calculated average rating is stored in the @averageRating variable */
CALL CalculateAverageRatingForMember(1, @averageRating);

/* This procedure counts the total number of feedback entries submitted by a specific member in the CrossFitGymFeedback table.
It takes memberId as an input parameter and returns the totalEntries as an output parameter. */

DELIMITER //
CREATE PROCEDURE CountFeedbackEntriesForMember(IN memberId INT, OUT totalEntries INT)
BEGIN
    -- Declaration Section
    DECLARE feedbackCount INT;

    -- Executable Section
    SELECT COUNT(*) INTO feedbackCount
    FROM CrossFitGymFeedback
    WHERE MemberId = memberId;

    -- Assign the result to the output parameter
    SET totalEntries = feedbackCount;
END;
//
DELIMITER ;

-- This SQL statement calls the CountFeedbackEntriesForMember procedure
CALL CountFeedbackEntriesForMember(1, @totalEntries);

-- InsertFeedbackForMember procedure takes the MemberId, FeedbackDate, and FeedbackText as parameters and directly inserts a new record into the CrossFitGymFeedback table.
DELIMITER //
CREATE PROCEDURE InsertFeedbackForMember(
    IN p_MemberId INT,
    IN p_FeedbackDate DATE,
    IN p_FeedbackText TEXT
)
BEGIN
    -- Insert a new feedback entry for the specified member
    INSERT INTO CrossFitGymFeedback (MemberId, FeedbackDate, FeedbackText)
    VALUES (p_MemberId, p_FeedbackDate, p_FeedbackText);
END; 
//
DELIMITER ;

 -- This SQL statement calls the InsertFeedbackForMember procedure
CALL InsertFeedbackForMember(@memberId, @feedbackDate, @feedbackText);

/* This procedure rates the feedback for a specified feedback ID in the CrossFitGymFeedback table.
It takes feedbackId as an input parameter and returns feedbackMessage as an output parameter.
The procedure retrieves the rating for the specified feedback and categorizes it as positive or negative using IF-ELSE.
If the rating is greater than 3, it sets feedbackMessage as 'Positive feedback,' otherwise, it sets it as 'Negative feedback.' */

DELIMITER //
CREATE PROCEDURE RateFeedback(
    IN p_FeedbackRating INT,
    OUT p_FeedbackMessage VARCHAR(50)
)
BEGIN
    -- Check if the rating is positive or negative
    IF p_FeedbackRating > 3 THEN
        SET p_FeedbackMessage = 'Positive feedback.';
    ELSE
        SET p_FeedbackMessage = 'Negative feedback.';
    END IF;
END;
 //
DELIMITER ; 

CALL RateFeedback(4, @feedbackMessage);















