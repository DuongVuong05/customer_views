USE classicmodels;

-- ============================================================================
-- PHẦN 1: THAM SỐ LOẠI IN (Nhận dữ liệu đầu vào để thực thi câu lệnh SELECT)
-- ============================================================================
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

-- Gọi Store Procedure loại IN với customerNumber = 175
CALL getCusById(175);


-- ============================================================================
-- PHẦN 2: THAM SỐ LOẠI OUT (Đưa kết quả tính toán ra biến toàn cục bên ngoài)
-- ============================================================================
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

-- Gọi Store Procedure loại OUT và kiểm tra giá trị trả về
CALL GetCustomersCountByCity('Lyon', @total);
SELECT @total AS total_customers;


-- ============================================================================
-- PHẦN 3: THAM SỐ LOẠI INOUT (Vừa nhận giá trị truyền vào vừa lưu lại kết quả mới)
-- ============================================================================
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

-- Khởi tạo biến @counter và gọi Store Procedure loại INOUT nhiều lần
SET @counter = 1;

CALL SetCounter(@counter, 1); -- Tăng lên 2
CALL SetCounter(@counter, 1); -- Tăng lên 3
CALL SetCounter(@counter, 5); -- Tăng lên 8

-- Hiển thị giá trị cuối cùng của biến
SELECT @counter AS final_counter;
