%dw 2.0

// Safely gets header value or returns default
fun getHeader(headers, key, defaultValue = "") =
    if (key default "") in keysOf(headers)
        headers[key]
    else defaultValue

// Normalizes HTTP status to readable label
fun statusLabel(code) =
    if (code >= 200 and code < 300) "Success"
    else if (code >= 300 and code < 400) "Redirect"
    else if (code >= 400 and code < 500) "ClientError"
    else if (code >= 500) "ServerError"
    else "Unknown"
