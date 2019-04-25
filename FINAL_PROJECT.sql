CREATE DATABASE TechAcademy_Library;

USE TechAcademy_Library;

CREATE TABLE Library_Branch( --DONE
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName varchar(50) NOT NULL,
	Address varchar(50) NOT NULL
);

CREATE TABLE Publisher ( --DONE
	PublisherName varchar(50) PRIMARY KEY NOT NULL,
	Address varchar(50) NOT NULL,
	Phone varchar(20) NOT NULL
);

CREATE TABLE Books( --DONE
	BookId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title varchar(50) NOT NULL,
	PublisherName varchar(50) --FOREIGN KEY REFERENCES Publisher(PublisherName)
);

CREATE TABLE Borrower( --DONE
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	Name varchar(50) NOT NULL,
	Address varchar(50) NOT NULL,
	Phone varchar(20) NOT NULL
);

CREATE TABLE Book_Copies( --DONE
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE Book_Loans( --DONE 
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	CardNo INT NOT NULL, --FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut varchar(20) NOT NULL,
	DateDue varchar(20) NOT NULL
);

CREATE TABLE Book_Authors( --DONE
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	AuthorName varchar(50) NOT NULL
);

/*-	-	-	-	-	-	-	-	-	-	-	-	INSERT STATEMENTS-	-	-	-	-	-	-	-	-	-	-	-	-	-*/

INSERT INTO Library_Branch --DONE
(BranchName,Address)
VALUES
('John''s Books','59 32nd Street'),
('Ben''s Books','104 4th Street'),
('Good-Reads',' 506 East Flag Ave.'),
('Sharpstown','100 Sharp Street'),
('Central','49 55th Street')
;

INSERT INTO Publisher --DONE	
(PublisherName, Address, Phone)
VALUES
('You Print!','77 51st Street','(343)868-9593'),
('Cat-tastic Reads' , '42 6th Street' , '(496)493-5925'),
('Huewart''s Printing Co.', '77 3rd Street','(496)837-4938'),
('We Love Stephen King','23 3rd Street','(477)877-8976'),
('Animal Lovers','36 33rd Street','(738)383-9283')
;

INSERT INTO Books --DONE 
(Title,PublisherName)
VALUES
('Norton Hears a ''CLICK''','You Print!'), --IDs	1
('The Truth about Love and Dogs','You Print!'),--	2
('Cats in Space','Cat-tastic Reads'),--		3
('The Animal Kingdom','Animal Lovers'),--	4
('Pet Sematary','We Love Sstephen King'),--	5
('Misery','We Love Stephen King'),--	6
('The Lost Tribe', 'Huewart''s Printing Co.'),--	7
('Chloe Goes Outsie', 'Cat-tastic Reads'),--	8
('The History of Itallian Sign-Language','You Print!'),--	9
('Glass-Blowing for Beginners','Huewart''s Printing Co.'),--10
('Mouse Control','Cat-tastic Reads'),--11
('Bermuda Triangle Stories','Huewart''s Printing Co.'),--12
('A Funny Thing Happened with my Dog...','Animal Lovers'),--13
('How Cheetahs Hunt','Animal Lovers'),--14
('All about Elephants','Animal Lovers'),--15
('How to take care of your Snake','Animal Lovers'),--16
('Lovers in a Dangerous Spacetime','You Print!'),--17
('Stephen King at the Bar: Let''s talk','We Love Stephen King'),--18
('Dragons: A Mythical Story','Animal Lovers'),--19
('Unicorns! They exist!','You Print!'),--20
('How I made Millions Overnight','Huewart''s Printing Co.'),--21
('Billion Dollar Ideas: Why They Do NOT Work','You Print!')--22
;


INSERT INTO Borrower  -- DONE
(Name, Address, Phone)
VALUES
('John','15 1st Street','(345)626-6949'),--100
('Sammy', '44 1st Street', '(345)584-5969'),--101
('Kato' , '410 1st Street' ,'(493)699-5285' ),--102
('Patricia','54 4th Street','(424)493-9593'),--103
('Liza','3 9th Street','(959)876-5424'),--104
('Jeff','3 9th Street','(959)876-5432'),--105
('Alexander','18 6th Street','(593)593-8539'),--106
('Connie','73 12th Street','(462)623-2357'),--107
('Stan',' 99 9th Street','(483)236-5472'),--108
('Steve','99 8th Street','(158)100-1588'),--109
('Penny', '4 Stardew Ave','(777)777-7777')--110
;

INSERT INTO Book_Copies--DONE
(BookID, BranchID, Number_Of_Copies)
VALUES
(1, 1 ,15),(2 ,1 ,10),(3,1,21),(4,1,39),(5,1,32),(6,1,16),(7,1,48),(8,1,10),(9,1,20),(10,1,17), --Branch 1
(1, 2, 34), (2,2,12),(4,2,51),(7,2,35),(11,2,124),(12,2,12),(18,2,53),(19,2,41),(20,2,16),(21,2,12),--Branch 2
(1,3,13),(6,3,15),(11,3,35),(12,3,42),(13,3,34),(14,3,31),(15,3,12),(17,3,7),(18,3,8),(21,3,32),--Branch 3
(1,4,9),(7,4,15),(12,4,15),(13,4,25),(14,4,15),(15,4,13),(16,4,16),(17,4,81),(18,4,34),(19,4,15),--Branch 4
(1,5,29),(2,5,24),(3,5,63),(4,5,26),(5,5,28),(6,5,29),(7,5,74),(8,5,10),(9,5,8),(10,5,51),(22,5,100)--Branch 5
;

INSERT INTO Book_Loans --DONE 
(BookID, BranchID, CardNo,DateOut,DateDue)
VALUES
(1,1,100, '04/12/19', '04/29/19'),(4,1,100,'04/12/19','04/29/19'),(6,1,100,'04/12/19','04/29/19'),(8,1,100,'04/12/19','04/29/19'),(19,2,100,'04/12/19','04/29/19'),
(1,2, 101, '03/23/19', '04/29/19'),(12,2,101,'03/23/19','04/29/19'),(18,2,101,'03/23/19','04/29/19'),(6,3,101,'03/25/19','04/29/19'),(21,3,101,'03/25/19','04/29/19'),(17,3,101,'03/25/19','04/29/19'),
(1,3,102,'04/10/19','04/15/19'),(11,3,102,'04/10/19','04/15/19'),(13,3,102,'04/10/19','04/29/19'),
(7,4,103,'04/11/19','04/16/19'),(13,4,103,'04/11/19','04/16/19'),(15,4,103,'04/11/19','04/29/19'),(16,4,103,'04/11/19','04/29/19'),(19,4,103,'04/11/19','04/29/19'),(18,4,103,'04/11/19','04/29/19'),
(10,5,104,'03/30/19','04/10/19'),(4,5,104,'03/30/19','04/10/19'),(2,5,104,'03/30/19','04/10/19'),(5,5,104,'04/10/19','04/29/19'),(6,5,104,'04/10/19','04/29/19'),
(7,5,105,'03/16/19','04/29/19'),(12,2,105,'03/24/19','04/10/19'),(4,2,105,'03/24/19','04/12/19'),(10,1,105,'03/30/19','04/05/19'),(2,1,105,'03/31/19','04/01/19'),(22,5,105,'04/01/19','04/16/19'),
(5,1,106,'04/01/19','04/16/19'),(12,4,106,'04/08/19','04/11/19'),(16,4,106,'04/08/19','04/24/19'),(8,1,106,'04/01/19','04/16/19'),(19,2,106,'04/08/19','04/16/19'),(21,3,106,'04/16/19','04/18/19'),(1,1,106,'04/16/19','04/24/19'),
(1,4,107,'03/30/19','04/08/19'),(7,4,107,'03/30/19','04/08/19'),(12,4,107,'03/30/19','04/08/19'),(12,2,107,'04/09/19','04/16/19'),(20,2,107,'04/09/19','04/16/19'),
(2,1,108,'03/15/19','03/22/19'),(4,2,108,'03/23/19','03/30/19'),(12,3,108,'03/31/19','04/10/19'),(14,3,108,'03/31/19','04/10/19'),(18,4,108,'04/10/19','04/16/19'),(22,5,108,'04/16/19','04/29/19'),
(5,5,109,'04/10/19','04/16/19'),(6,5,109,'04/10/19','04/16/19'),
(6,3,110,'04/04/19','04/10/19'),(13,3,110,'04/04/19','04/10/19'),(15,3,110,'04/04/19','04/10/19'),(21,3,110,'04/04/19','04/10/19'),(18,2,110,'04/11/19','04/16/19'),(11,2,110,'04/10/19','04/16/19')
;




INSERT INTO Book_Authors -- DONE
(BookID,AuthorName)
VALUES
(1,'Doctor Who'),
(2,'Courtney Blar'),(3,'Courtney Blar'),(8,'Courtney Blar'),
(4,'Jeffry Whittman'),
(5,'Stephen King'),(6,'Stephen King'),
(7,'Lucy Goldberg'),
(9,'Mario Gambino'),
(10,'Trevor Ngo'),
(11,'Mimi Alvarez'), (13,'Mimi Alvarez'),
(12,'Amy Hoffman'),
(14,'Tony Woods'),(16,'Tony Woods'),
(15,'Eugune Bard'),
(17,'Garry Benson'),
(18,'Steffanie King'),
(19,'Brandon Long'),
(20,'Brenda Lo'),
(21,'John Adams'),
(22,'Johnathan Adams')
;

------------------------------------Procedures

CREATE PROC LostTribeCountSharpstown --1 DONE 
AS
SELECT  Number_Of_Copies
FROM Book_Copies
WHERE BookID = 7 AND  BranchID = 4;

EXEC  LostTribeCountSharpstown



CREATE PROC TotalLostTribeCopies  --DONE
AS 
SELECT  Library_Branch.BranchName , SUM(Number_of_Copies)
FROM Book_Copies
INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
WHERE BookID = 7
GROUP BY Library_Branch.BranchName;

EXEC TotalLostTribeCopies;




CREATE PROC NoBooksOut  --3 DONE
AS 
SELECT Borrower.Name
FROM Borrower
EXCEPT 
SELECT Borrower.Name
FROM Borrower
INNER JOIN Book_Loans ON Book_Loans.CardNo = Borrower.CardNo
WHERE DateDue > CONVERT(varchar, GETDATE(), 1)
GROUP BY Borrower.Name;	
			
EXEC NoBooksOut ;



CREATE PROC DueToday  -- DONE
AS
SELECT Title,Borrower.Name,Borrower.Address
FROM Book_Loans
INNER JOIN Borrower ON Borrower.CardNo = Book_Loans.CardNo
INNER JOIN Books ON Books.BookId = Book_Loans.BookID
WHERE DateDue = CONVERT(varchar, GETDATE(), 1) AND  BranchId = 4  

EXEC DueToday ;
DROP PROC DueToday






CREATE PROC TotalBooksLoaned  --5   DONE
AS 
SELECT	BranchName, COUNT(Book_Loans.BranchID)					
FROM Book_Loans
INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Loans.BranchID
WHERE DateDue > CONVERT(varchar, GETDATE(),1)  -- <---------If the assignment meant the TOTAL books checked out OVERALL then simply comment out the Where statement
GROUP BY Book_Loans.BranchID, Library_Branch.BranchName
ORDER BY Book_Loans.BranchID;

EXEC TotalBooksLoaned;



CREATE PROC FivePlusCheckedOut -- 6 DONE 
AS
SELECT Borrower.Name, Borrower.Address, COUNT(BookID) AS 'BooksOut'
FROM Book_Loans
INNER JOIN Borrower ON Borrower.CardNo = Book_Loans.CardNo
GROUP BY  Borrower.Name, Borrower.Address
HAVING COUNT(Book_Loans.CardNo) > 5;

EXEC FivePlusCheckedOut;



CREATE PROC StephenKingCentralCopies --7  DONE
AS 
SELECT Title,Number_Of_Copies
FROM Book_Copies
INNER JOIN Book_Authors ON Book_Authors.BookID= Book_Copies.BookId
INNER JOIN Books ON Books.BookId=Book_Copies.BookID
INNER JOIN Library_Branch ON  Library_Branch.BranchID = Book_Copies.BranchID
WHERE Library_Branch.BranchID = 5    AND AuthorName = 'Stephen King'  ;  

EXEC StephenKingCentralCopies;

--Testing
SELECT * FROM Book_Loans
DROP DATABASE TechAcademy_Library;
