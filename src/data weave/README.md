# DataWeave Utilities (Coming Soon)
This folder will contain reusable DataWeave functions and transformation helpers.

# Object Utility Functions (DataWeave)

This module contains advanced reusable DataWeave functions for handling object transformations in enterprise MuleSoft applications.

## Functions Included

### 1. `safeGet(obj, key, defaultValue)`
Safely retrieves a value from an object without throwing an error if the key is missing.

#### Example:
```dw
safeGet(payload, "customerId", "UNKNOWN")

deepMerge({a: 1, b: {x: 10}}, {b: {y: 20}})
Result:  { "a": 1, "b": { "x": 10, "y": 20 } }

cleanObject({a: null, b: "", c: 5})
Result:  { "c": 5 }
