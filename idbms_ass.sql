CREATE DATABASE bank;
USE bank;
CREATE TABLE userdetails (
userid VARCHAR(60) PRIMARY KEY,
password VARCHAR(80) NOT NULL,
fname VARCHAR(800) NOT NULL,
address VARCHAR(200),
usertype VARCHAR(60)
);
CREATE TABLE creditaccount (
caccno INT(60) PRIMARY KEY,
cbalance INT(80) NOT NULL,
userid VARCHAR(80),
FOREIGN KEY (userid) REFERENCES userdetails(userid)
);
CREATE TABLE debitaccount (
daccno INT(60) PRIMARY KEY,
dbalance INT(80) NOT NULL,
userid VARCHAR(80),
FOREIGN KEY (userid) REFERENCES userdetails(userid)
);
INSERT INTO userdetails(userid, password, fname, address) VALUES('ry','12345','Rahul Reddy Yerva','3627 Gillham', 'admin');
INSERT INTO `userdetails` (`userid`, `password`, `fname`, `address`, `type`) VALUES ('hb', '56789', 'HB', '300 E Armour', 'user');
INSERT INTO creditaccount(userid, caccno, cbalance) VALUES('ry','5595','600');
INSERT INTO creditaccount(userid, caccno, cbalance) VALUES('hb','0811','300');
INSERT INTO debitaccount(userid, daccno, dbalance) VALUES('ry','1995','100');
INSERT INTO debitaccount(userid, daccno, dbalance) VALUES('hb','0811','250');

// SQL Script for stored procedures
CREATE PROCEDURE getDescription
	@userid VARCHAR(50)
    AS
	EXEC('SELECT * 
	FROM userdetails WHERE userid = '" . +$userid+ . "' and password = '" . +$password+ . "' ')
    RETURN
// SQL Script for MAC or RBAC
use access;
CREATE USER 'hb'@'%'
IDENTIFIED BY 'hb';
CREATE VIEW userview AS
SELECT userid,cbalance,dbalance
FROM userdetails, creditaccount, debitaccount;

GRANT select ON userdetails.userview TO 'hb'@'%';


