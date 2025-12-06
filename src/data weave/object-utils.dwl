%dw 2.0

// Safely gets a value from an object using a key.
// Returns default if key does not exist.
fun safeGet(obj, key, defaultValue = null) =
    if (key as String) in keysOf(obj) 
        obj[key] 
    else 
        defaultValue

// Deep merge two objects (right object overrides left)
fun deepMerge(obj1, obj2) = 
    if (isObject(obj1) and isObject(obj2))
        (obj1 ++ obj2) mapObject ((value, key) -> 
            if ((key in obj1) and (key in obj2)) 
                deepMerge(obj1[key], obj2[key])
            else 
                value
        )
    else obj2

// Removes null or empty fields from an object
fun cleanObject(obj) =
    obj filterObject ((value, key) -> 
        value != null 
        and value != "" 
        and value != [] 
        and value != {}
    )
