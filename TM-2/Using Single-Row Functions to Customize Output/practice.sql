-- MUST RUN THIS FIRST IN SQL DEVELOPER TO ACCESS THE PLUGGABLE DATABASE
ALTER SESSION SET CONTAINER = FREEPDB1;

-- ====================================================================
-- 🔤 1. CHARACTER FUNCTIONS
-- ====================================================================

-- UPPER
-- Syntax: UPPER(char_expression)
SELECT UPPER('aruna sri') AS name FROM dual;

-- UPPER WITH ALIAS
-- Syntax: UPPER(char_expression)
SELECT UPPER('aruna sri') AS Name FROM dual;

-- LOWER
-- Syntax: LOWER(char_expression)
SELECT LOWER('ARUNA SRI') AS Name FROM dual;

-- INITCAP
-- Syntax: INITCAP(char_expression)
SELECT INITCAP('aruna sri') AS Name FROM dual;

-- LENGTH
-- Syntax: LENGTH(char_expression)
SELECT LENGTH('aruna sri') AS Name_of_the_length FROM dual;

-- SUBSTR
-- Syntax: SUBSTR(char_expression, start_position [, length_to_extract])
SELECT SUBSTR('aruna sri', 3, 8) AS sub_string FROM dual;

-- INSTR
-- Syntax: INSTR(string, search_substring [, start_position [, occurrence_index]])
SELECT INSTR('aruna sri', 's') AS in_string FROM dual;

-- CONCAT
-- Syntax: CONCAT(char_expression1, char_expression2)
SELECT CONCAT('aruna sri', 'sumaya chandran') AS FULLNAME FROM dual;

-- CONCAT WITH SPACE
-- Syntax: CONCAT(char_expression1, char_expression2)
SELECT CONCAT('aruna sri', ' sumaya chandran') AS FULLNAME FROM dual;

-- REPLACE
-- Syntax: REPLACE(char_expression, search_string [, replacement_string])
SELECT REPLACE('ARUNA', 'A', 'X') FROM dual;

-- LPAD (TRUNCATING CASE)
-- Syntax: LPAD(char_expression, total_padded_length [, 'padding_character'])
SELECT LPAD('Oracle', 5, '*') AS padding FROM dual;

-- LPAD (PADDING CASE)
-- Syntax: LPAD(char_expression, total_padded_length [, 'padding_character'])
SELECT LPAD('Oracle', 10, '*') AS padding FROM dual;

-- RPAD
-- Syntax: RPAD(char_expression, total_padded_length [, 'padding_character'])
SELECT RPAD('Oracle', 10, '*') AS padding FROM dual;

-- LENGTH BEFORE TRIM
-- Syntax: LENGTH(char_expression)
SELECT LENGTH('     Oracle    ') FROM dual;

-- TRIM
-- Syntax: TRIM([LEADING | TRAILING | BOTH] trim_character FROM source_string) or TRIM(source_string)
SELECT TRIM('     Oracle    ') FROM dual;


-- ====================================================================
-- 🔢 2. NUMERIC FUNCTIONS
-- ====================================================================

-- ROUND (NUMERIC)
-- Syntax: ROUND(numeric_expression [, decimal_places_precision])
SELECT ROUND(1567.89345, 2) AS numbers FROM dual;

-- MOD (REMAINDER 0)
-- Syntax: MOD(dividend_value, divisor_value)
SELECT MOD(20, 4) FROM dual;

-- MOD (REMAINDER 6)
-- Syntax: MOD(dividend_value, divisor_value)
SELECT MOD(20, 7) FROM dual;

-- CEIL
-- Syntax: CEIL(numeric_expression)
SELECT CEIL(23.2) FROM dual;

-- FLOOR
-- Syntax: FLOOR(numeric_expression)
SELECT FLOOR(23.2) FROM dual;

-- ABS
-- Syntax: ABS(numeric_expression)
SELECT ABS(-23) FROM dual;

-- POWER
-- Syntax: POWER(base_value, exponent_value)
SELECT POWER(2, 4) FROM dual;

-- SQRT
-- Syntax: SQRT(numeric_expression)
SELECT SQRT(16) FROM dual;


-- ====================================================================
-- 📅 3. DATE FUNCTIONS
-- ====================================================================

-- SYSDATE
-- Syntax: SYSDATE
SELECT SYSDATE FROM dual;

-- CURRENT_DATE
-- Syntax: CURRENT_DATE
SELECT CURRENT_DATE FROM dual;

-- ADD_MONTHS
-- Syntax: ADD_MONTHS(date_expression, number_of_months)
SELECT ADD_MONTHS(SYSDATE, 5) FROM dual;

-- NEXT_DAY
-- Syntax: NEXT_DAY(date_expression, 'day_name_string')
SELECT NEXT_DAY(SYSDATE, 'MONDAY') FROM dual;

-- LAST_DAY
-- Syntax: LAST_DAY(date_expression)
SELECT LAST_DAY(SYSDATE) FROM dual;

-- ROUND (DATE)
-- Syntax: ROUND(date_expression [, 'FORMAT_UNIT'])
SELECT ROUND(SYSDATE) FROM dual;

-- TRUNC (DATE)
-- Syntax: TRUNC(date_expression [, 'FORMAT_UNIT'])
SELECT TRUNC(SYSDATE) FROM dual;


-- ====================================================================
-- 🔄 4. CONVERSION FUNCTIONS
-- ====================================================================

-- TO_NUMBER
-- Syntax: TO_NUMBER(char_expression [, 'format_mask_pattern'])
SELECT TO_NUMBER('1989') FROM dual;

-- TO_DATE WITH SHORT MONTH
-- Syntax: TO_DATE(char_expression [, 'format_mask_pattern'])
SELECT TO_DATE('03-aug-1989', 'dd-mon-yyyy') AS date_format FROM dual;

-- TO_DATE WITH FULL MONTH
-- Syntax: TO_DATE(char_expression [, 'format_mask_pattern'])
SELECT TO_DATE('03-august-1989', 'dd-month-yyyy') AS date_format FROM dual;

-- TO_DATE AUTO PARSE
-- Syntax: TO_DATE(char_expression [, 'format_mask_pattern'])
SELECT TO_DATE('03-august-1989') AS date_format FROM dual;

-- TO_CHAR (DATE TO SPELLED YEAR)
-- Syntax: TO_CHAR(date_or_number_expression [, 'format_mask_pattern'])
SELECT TO_CHAR(SYSDATE, 'dd-mon-year') FROM dual;

-- TO_CHAR (DATE TO SHORT YEAR)
-- Syntax: TO_CHAR(date_or_number_expression [, 'format_mask_pattern'])
SELECT TO_CHAR(SYSDATE, 'dd-mon-yy') FROM dual;

-- TO_CHAR (DATE TO FULL MONTH NAME)
-- Syntax: TO_CHAR(date_or_number_expression [, 'format_mask_pattern'])
SELECT TO_CHAR(SYSDATE, 'dd-month-yy') FROM dual;