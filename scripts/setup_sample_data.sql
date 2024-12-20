-- create employees table
CREATE TABLE EMPLOYEES
(
  EMPLOYEE_ID     NUMBER(6),
  FIRST_NAME      VARCHAR2(20 BYTE),
  LAST_NAME       VARCHAR2(25 BYTE) CONSTRAINT EMP_LAST_NAME_NN NOT NULL,
  EMAIL           VARCHAR2(25 BYTE) CONSTRAINT EMP_EMAIL_NN NOT NULL,
  PHONE_NUMBER    VARCHAR2(20 BYTE),
  HIRE_DATE       DATE CONSTRAINT EMP_HIRE_DATE_NN NOT NULL,
  JOB_ID          VARCHAR2(10 BYTE) CONSTRAINT EMP_JOB_NN NOT NULL,
  SALARY          NUMBER(8,2),
  COMMISSION_PCT  NUMBER(2,2),
  MANAGER_ID      NUMBER(6),
  DEPARTMENT_ID   NUMBER(4),
  RETIRED_BONUS   NUMBER(8,2),
  RETIRED         NUMBER(1),
  CONTRACT_DATE   DATE,
  AGE             NUMBER(12,2)
);
-- create REGIONS table
CREATE TABLE REGIONS
(
  REGION_ID    NUMBER CONSTRAINT REGION_ID_NN   NOT NULL,
  REGION_NAME  VARCHAR2(25 BYTE)
);

-- create COUNTRIES table
CREATE TABLE COUNTRIES
(
  COUNTRY_ID    CHAR(2 BYTE) CONSTRAINT COUNTRY_ID_NN NOT NULL,
  COUNTRY_NAME  VARCHAR2(40 BYTE),
  REGION_ID     NUMBER, 
  CONSTRAINT COUNTRY_C_ID_PK
 PRIMARY KEY
 (COUNTRY_ID)
);

-- create LOCATIONS table

CREATE TABLE LOCATIONS
(
  LOCATION_ID     NUMBER(4),
  STREET_ADDRESS  VARCHAR2(40 BYTE),
  POSTAL_CODE     VARCHAR2(12 BYTE),
  CITY            VARCHAR2(30 BYTE) CONSTRAINT LOC_CITY_NN NOT NULL,
  STATE_PROVINCE  VARCHAR2(25 BYTE),
  COUNTRY_ID      CHAR(2 BYTE)
);

-- create departments table
CREATE TABLE DEPARTMENTS
(
  DEPARTMENT_ID    NUMBER(4),
  DEPARTMENT_NAME  VARCHAR2(30 BYTE) CONSTRAINT DEPT_NAME_NN NOT NULL,
  MANAGER_ID       NUMBER(6),
  LOCATION_ID      NUMBER(4)
);


-- Insert into employees
Insert into EMPLOYEES
   (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, 
    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, 
    DEPARTMENT_ID, RETIRED_BONUS, RETIRED, CONTRACT_DATE, AGE)
 Values
   (100, 'Steven', 'King', 'SKING@oracle.com', '515_123_4567', 
    TO_DATE('09/20/2023 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'AD_PRES', 24000, NULL, NULL, 
    90, NULL, NULL, NULL, NULL);
Insert into EMPLOYEES
   (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, 
    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, 
    DEPARTMENT_ID, RETIRED_BONUS, RETIRED, CONTRACT_DATE, AGE)
 Values
   (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515_123_4568', 
    TO_DATE('09/21/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'AD_VP', 17500, 0.25, 100, 
    90, 387600, NULL, NULL, NULL);
Insert into EMPLOYEES
   (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, 
    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, 
    DEPARTMENT_ID, RETIRED_BONUS, RETIRED, CONTRACT_DATE, AGE)
 Values
   (102, 'Lex', 'De Haan', 'LDEHAAN@oracle.com', '515_123_4569', 
    TO_DATE('01/13/2001 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'AD_VP', 17000, 0.25, 100, 
    90, 484500, NULL, NULL, NULL);
Insert into EMPLOYEES
   (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, 
    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, 
    DEPARTMENT_ID, RETIRED_BONUS, RETIRED, CONTRACT_DATE, AGE)
 Values
   (103, 'Alexander', 'Hunold', 'AHUNOLD@oracle.com', '590_423_4567', 
    TO_DATE('01/03/2006 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'IT_PROG', 10800, NULL, 102, 
    60, NULL, NULL, NULL, NULL);
Insert into EMPLOYEES
   (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, 
    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, 
    DEPARTMENT_ID, RETIRED_BONUS, RETIRED, CONTRACT_DATE, AGE)
 Values
   (104, 'Bruce', 'Ernst', 'BERNST@oracle.com', '590_423_4568', 
    TO_DATE('05/21/2007 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'IT_PROG', 7200, NULL, 103, 
    60, NULL, NULL, NULL, NULL);
Insert into EMPLOYEES
   (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, 
    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, 
    DEPARTMENT_ID, RETIRED_BONUS, RETIRED, CONTRACT_DATE, AGE)
 Values
   (105, 'David', 'Austin', 'DAUSTIN', '590_423_4569', 
    TO_DATE('06/25/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'IT_PROG', 6816, NULL, 103, 
    60, 110880, NULL, NULL, NULL);

    
-- Insert into REGIONS
Insert into REGIONS
   (REGION_ID, REGION_NAME)
 Values
   (1, 'Europe');
Insert into REGIONS
   (REGION_ID, REGION_NAME)
 Values
   (2, 'Americas');
Insert into REGIONS
   (REGION_ID, REGION_NAME)
 Values
   (3, 'Asia');
Insert into REGIONS
   (REGION_ID, REGION_NAME)
 Values
   (4, 'Middle East and Africa');
-- Insert into COUNTRIES
Insert into COUNTRIES
   (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
 Values
   ('AR', 'Argentina', 2);
Insert into COUNTRIES
   (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
 Values
   ('AU', 'Australia', 3);
Insert into COUNTRIES
   (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
 Values
   ('BE', 'Belgium', 1);
Insert into COUNTRIES
   (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
 Values
   ('BR', 'Brazil', 2);
Insert into COUNTRIES
   (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
 Values
   ('CA', 'Canada', 2);
Insert into COUNTRIES
   (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
 Values
   ('CH', 'Switzerland', 1);
Insert into COUNTRIES
   (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
 Values
   ('CN', 'China', 3);



-- Insert into LOCATIONS

Insert into LOCATIONS
   (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, 
    COUNTRY_ID)
 Values
   (4002, NULL, NULL, 'AAAAAA', NULL, 
    NULL);
Insert into LOCATIONS
   (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, 
    COUNTRY_ID)
 Values
   (4003, NULL, NULL, 'bbbbbb', NULL, 
    NULL);
Insert into LOCATIONS
   (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, 
    COUNTRY_ID)
 Values
   (1000, '1297 Via Cola di Rie', '00989', 'Roma', NULL, 
    'IT');
Insert into LOCATIONS
   (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, 
    COUNTRY_ID)
 Values
   (1100, '93091 Calle della Testa', '10934', 'Venice', NULL, 
    'IT');
Insert into LOCATIONS
   (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, 
    COUNTRY_ID)
 Values
   (1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 
    'JP');
Insert into LOCATIONS
   (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, 
    COUNTRY_ID)
 Values
   (1300, '9450 Kamiya-cho', '6823', 'Hiroshima', NULL, 
    'JP');

-- Insert into departments
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (10, 'Administration', 200, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (20, 'Marketing', 201, 1800);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (30, 'Purchasing', 114, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (40, 'Human Resources', 203, 2400);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (50, 'Shipping', 121, 1500);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (60, 'IT', 103, 1400);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (70, 'Public Relations', 204, 2700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (80, 'Sales', 145, 2500);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (90, 'Executive', 100, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (100, 'Finance', 108, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (110, 'Accounting', 205, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (120, 'Treasury', NULL, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (130, 'Corporate Tax', NULL, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (140, 'Control And Credit', NULL, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (150, 'Shareholder Services', NULL, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (160, 'Benefits', NULL, 1700);
Insert into DEPARTMENTS
   (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
 Values
   (170, 'Manufacturing', NULL, 1700);

COMMIT;
