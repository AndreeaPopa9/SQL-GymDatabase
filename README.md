# SQL-GymDatabase

The CrossFitGym database is designed to manage various aspects of a fitness center, including information about gym members, staff, equipment, classes, memberships, workouts, feedback, and fitness goals. 

Objectives:

1. Member Management:
- Capture and store detailed information about gym members, including names, gender, date of birth, contact details, and membership information.
2. Staff Information:
- Manage details about fitness center staff, including their roles, contact information.
3. Equipment Tracking:
- Keep track of fitness equipment, such as treadmills, dumbbell sets, yoga mats, spinning, etc., including purchase information.
4. Class Scheduling:
- Schedule and organize fitness classes, specifying class names, schedules, and instructors.
5. Membership Records:
- Record and track gym memberships, including membership types, start and end dates, and associated member information.
6. Fitness Goals:
- Allow members to set and track fitness goals, specifying descriptions and target dates.
7. Workouts: 
- Maintain a record of members workout sessions, capturing details like workout names, dates, durations, and calories burned.
8. Feedback System:
- Collect and manage member feedback, including ratings, comments, and feedback dates.

Commands Used:

1. Data Definition Language (DDL):   
- Database and Table Creation:
CREATE DATABASE CrossFitGym;
CREATE TABLE ...;

- Column Alteration and Modification:
ALTER TABLE ...MODIFY COLUMN ...;
ALTER TABLE ... ADD COLUMN ...;
ALTER TABLE ... DROP COLUMN ...;

- Index Creation:
CREATE INDEX ...ON ...;

2. Data Manipulation Language (DML):
- Data Insertion:
INSERT INTO ... VALUES ...;

- Data Updating:
UPDATE ... SET ... WHERE ...;

- Data Deletion:
DELETE FROM ... WHERE ...;

3. Data Query Language (DQL):
- Data Retrieval:
SELECT ... FROM ... WHERE ...;
SELECT ... JOIN ... ON ...;

- Sorting and Limiting:
ORDER BY ...;
LIMIT ... OFFSET ...;

- Aggregation and Grouping:
SELECT ... COUNT(...), AVG(...), SUM(...), MIN(...), MAX(...) FROM ... GROUP BY ... HAVING ...;

- Subqueries:
SELECT ... FROM ... WHERE ... IN (SELECT ... FROM ... WHERE ...);

- Triggers:
Trigger Creation:
CREATE TRIGGER ...;
Trigger Execution:
Automatic execution on specified events, such as BEFORE INSERT and AFTER UPDATE.

- Views:
View Creation:
CREATE VIEW ... SELECT ... FROM ...;

- Procedures:
Procedure Creation:
CREATE PROCEDURE ...;
Procedure Execution:
CALL ...;

