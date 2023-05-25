CREATE TABLE "REGION" (
  "Region_id" Number(10),
  "Region_name" varchar2(250)
);

CREATE INDEX "PK1" ON  "REGION" ("Region_id");

CREATE TABLE "COUNTRIES" (
  "Country_id" Char(5),
  "Country_name" Varchar2(250),
  "Region_id" Number,
  CONSTRAINT "FK_COUNTRIES.Region_id"
    FOREIGN KEY ("Region_id")
      REFERENCES "REGION"("Region_id")
);

CREATE INDEX "PK1" ON  "COUNTRIES" ("Country_id");

CREATE INDEX "fk1" ON  "COUNTRIES" ("Region_id");

CREATE TABLE "LOCATIONS" (
  "Location_id" Number(10),
  "Street_address" Varchar2(250),
  "Postal_code" Varchar2(250),
  "City" Varchar2(250),
  "State_province" Varchar2(250),
  "Country_id" Char(5),
  CONSTRAINT "FK_LOCATIONS.Country_id"
    FOREIGN KEY ("Country_id")
      REFERENCES "COUNTRIES"("Country_id")
);

CREATE INDEX "PK1" ON  "LOCATIONS" ("Location_id");

CREATE INDEX "FK1" ON  "LOCATIONS" ("Country_id");

CREATE TABLE "DEPARTMENTS" (
  "Department_id" Number(10),
  "Department_name" Varchar2(250),
  "Manager_id" Number(10),
  "Location_id" Number(10),
  CONSTRAINT "FK_DEPARTMENTS.Location_id"
    FOREIGN KEY ("Location_id")
      REFERENCES "LOCATIONS"("Location_id")
);

CREATE INDEX "PK1" ON  "DEPARTMENTS" ("Department_id");

CREATE INDEX "PK2" ON  "DEPARTMENTS" ("Manager_id");

CREATE INDEX "FK1" ON  "DEPARTMENTS" ("Location_id");

CREATE TABLE "EMPLOYEES" (
  "Employee_id" Number(10),
  "First_name" Varchar2(250),
  "Last_name" Varchar2(250),
  "Email" Varchar2(250),
  "Phone_numeber" Varchar2(250),
  "Hire_date" Date,
  "Job_id" Varchar2(250),
  "Salary" Number(10),
  "Commission_id" Number(10),
  "Manager_id" Number(10),
  "Department_id" Number(10),
  CONSTRAINT "FK_EMPLOYEES.Department_id"
    FOREIGN KEY ("Department_id")
      REFERENCES "DEPARTMENTS"("Department_id"),
  CONSTRAINT "FK_EMPLOYEES.Manager_id"
    FOREIGN KEY ("Manager_id")
      REFERENCES "DEPARTMENTS"("Manager_id"),
  CONSTRAINT "FK_EMPLOYEES.Employee_id"
    FOREIGN KEY ("Employee_id")
      REFERENCES "EMPLOYEES"("Manager_id")
);

CREATE INDEX "PK1" ON  "EMPLOYEES" ("Employee_id");

CREATE INDEX "FK1" ON  "EMPLOYEES" ("Job_id");

CREATE INDEX "FK2" ON  "EMPLOYEES" ("Manager_id");

CREATE INDEX "FK3" ON  "EMPLOYEES" ("Department_id");

CREATE TABLE "JOBS" (
  "Job_id" Varchar2(250),
  "Job_title" Varchar2(250),
  "Min_salary" Number(10),
  "Max_salary" Number(10),
  CONSTRAINT "FK_JOBS.Job_id"
    FOREIGN KEY ("Job_id")
      REFERENCES "EMPLOYEES"("Job_id")
);

CREATE INDEX "PK1" ON  "JOBS" ("Job_id");

CREATE INDEX "FK1" ON  "JOBS" ("Max_salary");

CREATE TABLE "JOB_hISTORY" (
  "Employee_id" Number(10),
  "Start_date" Date,
  "End_date" Date,
  "Job_id" Number(10),
  "Departtment_id" Number,
  CONSTRAINT "FK_JOB_hISTORY.Employee_id"
    FOREIGN KEY ("Employee_id")
      REFERENCES "EMPLOYEES"("Employee_id"),
  CONSTRAINT "FK_JOB_hISTORY.Departtment_id"
    FOREIGN KEY ("Departtment_id")
      REFERENCES "DEPARTMENTS"("Department_id"),
  CONSTRAINT "FK_JOB_hISTORY.Employee_id"
    FOREIGN KEY ("Employee_id")
      REFERENCES "JOBS"("Job_id")
);

CREATE INDEX "PK1" ON  "JOB_hISTORY" ("Employee_id");

CREATE INDEX "FK1" ON  "JOB_hISTORY" ("Job_id");

CREATE INDEX "FK2" ON  "JOB_hISTORY" ("Departtment_id");


