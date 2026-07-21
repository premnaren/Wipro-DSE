# 📖 Module Guide: Using Single-Row Functions to Customize Output

Single-row functions (also known as Scalar functions) operate on individual rows and return exactly one result per row. These functions are highly useful for data modification, formatting, and calculations within your query blocks.

---

## 🏛️ Classification of Single-Row Functions
1. **Character Functions:** Accept character input and can return both character and number values.
2. **Numeric Functions:** Accept numeric input and return numeric values.
3. **Date Functions:** Operate on values of the `DATE` datatype.
4. **Conversion Functions:** Convert a value from one datatype to another datatype.
5. **General Functions:** Handle `NULL` values and conditional logic flow.

---

## 📝 Detailed Core Notes & Syntax

### 1. Character Functions

* **`UPPER(str)`**
  * **Syntax:** `UPPER(char_expression)`
  * **Description:** Converts lowercase or mixed-case strings to uppercase.
* **`LOWER(str)`**
  * **Syntax:** `LOWER(char_expression)`
  * **Description:** Converts uppercase or mixed-case strings to lowercase.
* **`INITCAP(str)`**
  * **Syntax:** `INITCAP(char_expression)`
  * **Description:** Capitalizes the first letter of each word; converts all other letters to lowercase.
* **`LENGTH(str)`**
  * **Syntax:** `LENGTH(char_expression)`
  * **Description:** Returns the total number of characters in a string, including space constants.
* **`SUBSTR(str, start_position, length)`**
  * **Syntax:** `SUBSTR(char_expression, start_position [, length_to_extract])`
  * **Description:** Extracts a portion of a string from a specified start position for a defined length character run.
* **`INSTR(str, substring)`**
  * **Syntax:** `INSTR(string, search_substring [, start_position [, occurrence_index]])`
  * **Description:** Finds the numeric position of a named character or substring within a target text layout string.
* **`CONCAT(str1, str2)`**
  * **Syntax:** `CONCAT(char_expression1, char_expression2)`
  * **Description:** Joins two values together (equivalent to the `||` concatenation operator).
* **`REPLACE(str, search_string, replacement_string)`**
  * **Syntax:** `REPLACE(char_expression, search_string [, replacement_string])`
  * **Description:** Searches a text field for a matching search pattern and replaces it globally.
* **`LPAD(str, length, 'char')`**
  * **Syntax:** `LPAD(char_expression, total_padded_length [, 'padding_character'])`
  * **Description:** Pads a string expression on the left side to a specified total character length.
* **`RPAD(str, length, 'char')`**
  * **Syntax:** `RPAD(char_expression, total_padded_length [, 'padding_character'])`
  * **Description:** Pads a string expression on the right side to a specified total character length.
* **`TRIM(str)`**
  * **Syntax:** `TRIM([LEADING | TRAILING | BOTH] trim_character FROM source_string)` or shorthand `TRIM(source_string)`
  * **Description:** Truncates all leading and trailing blank spacing gaps away from a text variable completely.

### 2. Numeric Functions

* **`ROUND(number, decimal_places)`**
  * **Syntax:** `ROUND(numeric_expression [, decimal_places_precision])`
  * **Description:** Rounds a target column metric value to a specified decimal precision constraint.
* **`MOD(dividend, divisor)`**
  * **Syntax:** `MOD(dividend_value, divisor_value)`
  * **Description:** Performs dynamic division between parameters and isolates the remaining balance modulo value.
* **`CEIL(number)`**
  * **Syntax:** `CEIL(numeric_expression)`
  * **Description:** Rounds a value up to the next highest structural whole integer asset value.
* **`FLOOR(number)`**
  * **Syntax:** `FLOOR(numeric_expression)`
  * **Description:** Drops a fractional asset down to the next lowest trailing baseline whole integer value.
* **`ABS(number)`**
  * **Syntax:** `ABS(numeric_expression)`
  * **Description:** Eliminates evaluation signs to expose the absolute structural magnitude parameters.
* **`POWER(base, exponent)`**
  * **Syntax:** `POWER(base_value, exponent_value)`
  * **Description:** Calculates a base factor value raised exponentially.
* **`SQRT(number)`**
  * **Syntax:** `SQRT(numeric_expression)`
  * **Description:** Pulls the true mathematical square root factor value.

### 3. Date Functions

* **`SYSDATE` / `CURRENT_DATE`**
  * **Syntax:** `SYSDATE` or `CURRENT_DATE`
  * **Description:** Extracts active system server real-time chronological timestamps. Do not append parentheses.
* **`ADD_MONTHS(date, n)`**
  * **Syntax:** `ADD_MONTHS(date_expression, number_of_months)`
  * **Description:** Advances or decrements dates sequentially by an exact index value of months.
* **`NEXT_DAY(date, 'DAY')`**
  * **Syntax:** `NEXT_DAY(date_expression, 'day_name_string')`
  * **Description:** Discovers the upcoming calendar date match for a specified day name block string parameter.
* **`LAST_DAY(date)`**
  * **Syntax:** `LAST_DAY(date_expression)`
  * **Description:** Isolates the terminal calendar date value bounding the month of the target date parameter.
* **`ROUND(date)`**
  * **Syntax:** `ROUND(date_expression [, 'FORMAT_UNIT'])`
  * **Description:** Rounds a date value to the nearest midnight marker configuration.
* **`TRUNC(date)`**
  * **Syntax:** `TRUNC(date_expression [, 'FORMAT_UNIT'])`
  * **Description:** Resets time variables backward to match the absolute baseline morning start boundary condition.

### 4. Conversion Functions

* **`TO_CHAR(value, format)`**
  * **Syntax:** `TO_CHAR(date_or_number_expression [, 'format_mask_pattern'])`
  * **Description:** Conforms raw date variables or high-precision number blocks into a stylized alphanumeric display pattern.
* **`TO_NUMBER(string)`**
  * **Syntax:** `TO_NUMBER(char_expression [, 'format_mask_pattern'])`
  * **Description:** Converts text characters containing numbers into operational database numeric datatypes.
* **`TO_DATE(string, format)`**
  * **Syntax:** `TO_DATE(char_expression [, 'format_mask_pattern'])`
  * **Description:** Parses string literal variables using an explicit format mask pattern to instantiate a true internal date object.

---