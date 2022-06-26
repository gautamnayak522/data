
-- tables from assi2

SELECT * FROM STUDENT
SELECT * FROM studentdetail
SELECT * FROM studentpresent
SELECT * FROM studenthours

CREATE TABLE Product
(
    productid int primary key,
    name varchar(50) NOT NULL
)

INSERT INTO Product VALUES(1,'Mobile'),(2,'Laptop'),(3,'Bag'),(4,'Book')
INSERT INTO Product VALUES(5,'ABC')

CREATE TABLE productprice(
    productpriceid int primary key IDENTITY(1,1),
    productid int,
    code varchar(10),
    effdt date,
    price int
    CONSTRAINT FK_productid FOREIGN KEY(productid) REFERENCES Product(productid)
)

INSERT INTO productprice VALUES (1,'EC',GETDATE(),10000)
INSERT INTO productprice VALUES (2,'EC',GETDATE(),45000)
INSERT INTO productprice VALUES (3,'AB',GETDATE(),500)
INSERT INTO productprice VALUES (4,'AB',GETDATE(),200)
INSERT INTO productprice VALUES (5,'EN',GETDATE(),150)

SELECT * FROM Product
SELECT * FROM productprice


--Modification requirement:
        
   --Change value of 'student.name' with any other value for student.studentid = 3.

   UPDATE Student
   SET Name='VIDHI'
   WHERE studentid=3

   -- Update all "student" records to append character " A." as the middle name for "student.name" field.

   UPDATE Student
   SET Name = Name + ' ' + 'A. '

   -- Update all "productprice" records to add 25.00 in "price" field.

   UPDATE productprice
   SET price=price+25

   -- Update "product" table to add "A" in 'product.name' where related 'product.code = AB'.

    UPDATE p
    SET p.name=p.name+' '+'A'
    FROM
    Product p JOIN productprice pp
    ON p.productid=pp.productid
    WHERE pp.code='AB'
        
   -- Update all "studentpresent" records to add 2 in 'studentpresentpresent' where related 'studenthours.hours >= 8'.
    
    UPDATE sp1
    SET sp1.present=sp1.present+2
    FROM
    studentpresent sp1 JOIN studenthours sh1
    ON sp1.studentid=sh1.studentid
    WHERE sh1.hours>=8

-- Delete requirement:
        
     -- Remove a record from "product" table where 'product.productid = 5'

     DELETE FROM Product
     WHERE productid=5
        
     -- Remove all "student" records where the 'student.name' starts with character "A".

     DELETE FROM STUDENT
     WHERE name like 'V%'
        
     -- Remove all "studentdetails" record where related 'studenthours.hours <= 3'.
     SELECT * FROM studentdetail
     SELECT * FROM studenthours

     DELETE sd1
     FROM studentdetail sd1 JOIN studenthours sh1
     ON sd1.studentid=sh1.studentid
     WHERE sh1.hours>=8
      
