%dw 2.0
output application/dw
/*
  Guardrail utilities for production-safe DataWeave transformations.
  Intended for AI-assisted mappings where defensive behavior is mandatory.
*/

fun safeString(value, defaultVal = "") =
  if (value is String) value else defaultVal

fun safeNumber(value, defaultVal = null) =
  if (value is Number) value else defaultVal

fun safeBoolean(value, defaultVal = false) =
  if (value is Boolean) value else defaultVal

fun safeObject(value) =
  if (value is Object) value else {}

fun safeArray(value) =
  if (value is Array) value else []

fun requireField(value, fieldName) =
  if (value == null)
    error("REQUIRED_FIELD_MISSING", "Missing required field: " ++ fieldName)
  else
    value

fun idempotentId(existingId) =
  if (existingId != null) existingId else uuid()

fun normalizeStatus(status) =
  match (status) {
    case "ACTIVE" -> "ACTIVE"
    case "INACTIVE" -> "INACTIVE"
    case "ENABLED" -> "ACTIVE"
    case "DISABLED" -> "INACTIVE"
    else -> "UNKNOWN"
  }
