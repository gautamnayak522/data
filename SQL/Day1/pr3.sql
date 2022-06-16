CREATE TABLE jobs(
	JobId int primary key,
	JobTitle varchar(50) DEFAULT '',
	MinSalary int DEFAULT 8000,
	MaxSalary int DEFAULT NULL
);

SELECT * FROM jobs;

INSERT INTO jobs(JobId) VALUES (1);
INSERT INTO jobs(JobId,JobTitle) VALUES (2,'SW');
INSERT INTO jobs(JobId,JobTitle,MinSalary) VALUES (3,'SW',4000);
INSERT INTO jobs(JobId,JobTitle,MinSalary,MaxSalary) VALUES (4,'SW',4000,17000);