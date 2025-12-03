%dw 2.0
fun safeNumber(value) = 
    (value as Number default 0)

fun percentChange(old, new) =
    if (old == 0) 0 
    else ((new - old) / old) * 100
