-- SQL test cases to validate the functionality.

-- sql
-- Test Case 1: Verify sequence and trigger creation
SELECT * FROM user_sequences;
SELECT * FROM user_triggers;

-- Test Case 2: Insert a new records and verify the primary key
Insert into EMPLOYEES
   (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, 
    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, 
    DEPARTMENT_ID, RETIRED_BONUS, RETIRED, CONTRACT_DATE, AGE)
 Values
   (106, 'Valli', 'Pataballa', 'VPATABAL', '590_423_4560', 
    TO_DATE('02/05/2006 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'IT_PROG', 5760, 0.1, 103, 
    60, NULL, NULL, NULL, NULL);
SELECT * FROM EMPLOYEES;

-- Test Case 3: Insert a new records and verify the primary key
Insert into COUNTRIES
   (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
 Values
   ('DE', 'Germany', 1);
Insert into COUNTRIES
   (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
 Values
   ('DK', 'Denmark', 1);
Insert into COUNTRIES
   (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
 Values
   ('EG', 'Egypt', 4);

SELECT * FROM COUNTRIES; 

-- Test Case 4: Insert a new records and verify the primary key
Insert into LOCATIONS
   (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, 
    COUNTRY_ID)
 Values
   (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 
    'US');
Insert into LOCATIONS
   (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, 
    COUNTRY_ID)
 Values
   (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 
    'US');
SELECT * FROM LOCATIONS;

-- Test Case 5: Verify trigger behavior on missing primary key
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (180, 'Construction', NULL, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (190, 'Contracting', NULL, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (200, 'Operations', NULL, 1700);

SELECT * FROM DEPARTMENTS;

