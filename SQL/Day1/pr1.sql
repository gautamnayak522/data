CREATE TABLE countries(
	CountryId int NOT NULL,
	CountryName varchar(40),
	RegionId int NOT NULL,
	constraint uc_countries UNIQUE(CountryId,RegionId),
	constraint CHK_contryname CHECK (CountryName='italy' OR CountryName='india' OR CountryName='china')
);

insert into countries values(1,'india',1)
insert into countries values(2,'china',1)
insert into countries values(2,'italy',2)

select * from countries;

--error
--insert into countries values(2,'china',1)
--insert into countries values(4,'america',4)
