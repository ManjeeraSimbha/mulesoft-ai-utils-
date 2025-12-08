# DataWeave Utilities
This folder will contain reusable DataWeave functions and transformation helpers.
===========================================================================================================================================================================
# Number Utility Functions (DataWeave)
===========================================================================================================================================================================
This module contains reusable helpers for safely handling numeric operations in MuleSoft transformations.

## Functions Included

### 1. `safeNumber(value)`
Safely converts a value to a Number.  
If conversion fails or value is null → returns **0**.

#### Example:
```dw
safeNumber("25")
```
Result:
```
25
```

#### Example (invalid input):
```dw
safeNumber("abc")
```
Result:
```
0
```

---

### 2. `percentChange(old, new)`
Calculates percent change between two numbers while preventing division-by-zero errors.

Formula:  
```
((new - old) / old) * 100
```

If `old` = 0 → returns **0**.

#### Example:
```dw
percentChange(100, 120)
```
Result:
```
20
```

#### Example (old = 0):
```dw
percentChange(0, 50)
```
Result:
```
0
```
===========================================================================================================================================================================
# Object Utility Functions (DataWeave)
===========================================================================================================================================================================
This module contains advanced reusable DataWeave functions for handling object transformations in enterprise MuleSoft applications.

## Functions Included

### 1. `safeGet(obj, key, defaultValue)`
Safely retrieves a value from an object without throwing an error if the key is missing.

#### Example:
```dw
safeGet({name: "Manjeera", role: "Architect"}, "Salary")
```
Result: 
```
null
```
### 2. deepMerge(obj1, obj2)

Performs a deep recursive merge of two objects.
Useful for configuration merging, dynamic payload generation, and transformations.

#### Example:
```
deepMerge({a: 1, b: {x: 10}}, {b: {y: 20}})
```
Result: 
```
{ "a": 1, "b": { "x": 10, "y": 20 } }
```
### 3. cleanObject(obj)

Removes null, empty strings, empty objects, and empty arrays from the given object.

#### Example:
```
cleanObject({a: null, b: "", c: 5})
```
Result:  
```
{ "c": 5 }
```
===========================================================================================================================================================================
# Date Utility Functions (DataWeave)
===========================================================================================================================================================================
This module provides helper functions for converting and generating standardized date formats commonly used in enterprise integration flows.

## Functions Included

### 1. `toISO(dateString)`
Converts `"MM/dd/yyyy"` format into ISO `"yyyy-MM-dd"` format.

#### Example:
```dw
toISO("01/25/2025")
```
Result:
```
"2025-01-25"
```

---

### 2. `currentTimestamp()`
Returns the **current timestamp** in ISO format.

#### Example:
```dw
currentTimestamp()
```
Possible Result:
```
"2025-01-25T14:33:20Z"
```
===========================================================================================================================================================================
# String Utility Functions (DataWeave)
===========================================================================================================================================================================
This module provides utility functions to clean, format, and safely transform string values in MuleSoft applications.

## Functions Included

### 1. `capitalizeWords(str)`
Capitalizes the first letter of each word.

#### Example:
```dw
capitalizeWords("john doe")
```
Result:
```
"John Doe"
```

---

### 2. `safeLower(str)`
Converts input string to lowercase.  
If `str` is null → returns empty string.

#### Example:
```dw
safeLower(null)
```
Result:
```
""
```

---

### 3. `safeUpper(str)`
Converts input string to uppercase.  
If `str` is null → returns empty string.

#### Example:
```dw
safeUpper("hello")
```
Result:
```
"HELLO"
```
===========================================================================================================================================================================
# Error Utility Functions (DataWeave)
===========================================================================================================================================================================
This module provides safe execution helpers to prevent flow-breaking errors during transformations, especially useful with unpredictable payloads.

## Functions Included

### 1. `safeTry(fn)`
Executes a function safely.  
If the function fails → returns an error object instead of throwing an exception.

#### Example:
```dw
safeTry(() -> (1 / 0))
```
Result:
```
{
  "error": "Division by zero"
}
```

---

### 2. `unwrapOrDefault(value, defaultValue)`
Returns `value` unless it is null;  
otherwise returns **defaultValue**.

#### Example:
```dw
unwrapOrDefault(payload.age, 0)
```
If age is null →  
Result:
```
0
```

---

### 3. `isError(obj)`
Checks whether an object is an error created by `safeTry()`.

#### Example:
```dw
var attempt = safeTry(() -> payload.a / payload.b)
isError(attempt)
```
Result:
```
true
```
