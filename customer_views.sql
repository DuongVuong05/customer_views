USE classicmodels;

DROP PROCEDURE IF EXISTS getCusById;

DELIMITER //

CREATE PROCEDURE getCusById(
    IN cusNum INT
)
BEGIN
    SELECT * 
    FROM customers 
    WHERE customerNumber = cusNum;
END //

DELIMITER ;


CALL getCusById(175);

DROP PROCEDURE IF EXISTS GetCustomersCountByCity;

DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(
    IN in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END //

DELIMITER ;
CALL GetCustomersCountByCity('Lyon', @total);
SELECT @total AS 'Total_Customers_In_Lyon';

DROP PROCEDURE IF EXISTS SetCounter;

DELIMITER //

CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END //

DELIMITER ;

SET @counter = 1;

CALL SetCounter(@counter, 1); 
CALL SetCounter(@counter, 1); 
CALL SetCounter(@counter, 5); 

SELECT @counter AS 'Final_Counter_Value';
