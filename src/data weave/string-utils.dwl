%dw 2.0
fun toTitleCase(str) = 
    upper(str[0]) ++ lower(str[1 to -1]) 

fun sanitize(str) =
    str replace /[^A-Za-z0-9 ]/ with ""

fun safeTrim(str) =
    (str default "") trim()
