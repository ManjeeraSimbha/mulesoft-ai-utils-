%dw 2.0
output application/json
/*
 Validation wrapper for AI-generated DataWeave mappings.

 This pattern ensures:
 • Required fields are present
 • Types are enforced
 • AI-generated drafts cannot break production flows
*/

fun require(value, fieldName) =
    if (value == null)
        error(fieldName ++ " is required")
    else
        value

var input = payload

---
{
  orderId: require(input.order_id, "order_id"),
  customerId: require(input.customer.id, "customer.id"),
  totalAmount: (input.amount as Number) default 0,
  currency: input.currency default "USD",
  createdAt: input.created_at default now()
}
