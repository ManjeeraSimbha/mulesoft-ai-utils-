%dw 2.0
/*
 Standard retry policy helper for MuleSoft flows.
 Helps distinguish retryable vs non-retryable errors.
*/

fun isRetryable(errorType) =
    errorType in ["TIMEOUT", "CONNECTION", "TRANSIENT"]

---
{
  retry: isRetryable(payload.errorType),
  retryAfterSeconds: payload.retryCount * 2
}
