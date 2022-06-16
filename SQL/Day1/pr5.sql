create table JobHistory (
EmployeeId int primary key,
StartDate varchar(200) NOT NULL,
End_date varchar(200) NOT NULL ,
Job_id int NOT NULL,
DepartmentId int NOT NULL,
--constraint CHK_date CHECK (StartDate like '[0-3][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]' AND End_date like '([0-2][0-9]|(3)[0-1])[/](((0)[0-9])|((1)[0-2]))[/]\d{4}')
constraint CHK_date CHECK (StartDate like '[0-3][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]' AND End_date like '[0-3][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]' )
);

Drop table jobhistory;

insert into jobhistory values (7,'05/06/1974','05/06/1947',2,2)

CREATE TABLE jobs(
	JobId int primary key,
	JobTitle varchar(50) DEFAULT '',
	MinSalary int DEFAULT 8000,
	MaxSalary int DEFAULT NULL
);

INSERT INTO jobs(JobId,JobTitle,MinSalary,MaxSalary) VALUES (1,'Software Engineer',40000,70000);
INSERT INTO jobs(JobId,JobTitle,MinSalary,MaxSalary) VALUES (2,'Sr.Software Engineer',70000,90000);

SELECT * FROM Jobs;


---------------------------------------------

ALTER TABLE jobHistory Add location varchar(50);
insert into jobhistory values (11,'05/06/1974','05/06/1947',2,2,'ahmdbd');
select * from jobHistory;

ALTER TABLE jobhistory
ADD CONSTRAINT fk_job_id
FOREIGN KEY (Job_id ) REFERENCES jobs(jobId);

ALTER TABLE jobhistory
DROP CONSTRAINT fk_job_id





