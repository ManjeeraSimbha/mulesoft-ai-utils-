%dw 2.0
output application/json
/*
 Example demonstrating why AI-generated DataWeave
 must be hardened before production use.
*/

// ❌ Unsafe AI-generated mapping (demo-only)
var unsafe =
{
  orderId: payload.order_id,
  amount: payload.amount,
  customer: payload.customer.id
}

// ✅ Production-safe mapping with guardrails
var safe =
{
  orderId: payload.order_id default "",
  amount: (payload.amount as Number) default 0,
  customer: payload.customer.id default "UNKNOWN",
  currency: payload.currency default "USD",
  createdAt: payload.created_at default now()
}

---
{
  unsafeExample: unsafe,
  safeExample: safe
}
