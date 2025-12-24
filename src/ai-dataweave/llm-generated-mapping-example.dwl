%dw 2.0
output application/json
/*
 Example: LLM-generated DataWeave mapping
 This file demonstrates how AI-generated mappings
 can be validated, constrained, and production-hardened.
*/

var input = payload

---
{
  orderId: input.order_id default "",
  customerId: input.customer.id default "",
  totalAmount: (input.amount as Number) default 0,
  currency: input.currency default "USD",
  createdAt: input.created_at default now()
}
