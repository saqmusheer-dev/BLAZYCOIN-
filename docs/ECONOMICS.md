# BLAZYCOIN V1 Economics

## Principles

BLAZY is an accounting unit in V1. The system must never create unlimited rewards merely because users can play unlimited games.

### Reward budget

Every reward must consume an authorized emission budget. The backend should maintain:

- reward_pool_balance
- daily_emission_cap
- per_user_daily_cap
- per_device_daily_cap
- reward_per_valid_completion
- total_issued
- total_redeemed_or_spent (future)

### Revenue allocation target

Current design target:

- 80% of eligible platform revenue → ecosystem/reward pool
- 20% → platform operations, reserves and development

This ratio is a policy target and may change after real operating data, advertising policies, costs and legal review.

### No fixed cash promise in V1

V1 must not display or promise a fixed INR exchange rate. A future redemption system requires sufficient reserves, legal/compliance review and a sustainable funding mechanism.

### Integer accounting

Never use floating-point numbers for monetary or BLAZY balances.

Example internal representation:

`1 BLAZY = 1,000,000 microBLAZY`

`0.005 BLAZY = 5,000 microBLAZY`

The exact decimal precision can be changed before production launch, but the ledger must always store integers.

## Future expansion

Later revenue from merchants, transactions, sponsored offers and legitimate business work may create additional demand and utility. Those features must not be retroactively assumed in V1 financial projections.
