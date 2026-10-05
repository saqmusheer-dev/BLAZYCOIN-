# BLAZYCOIN V1 Product Specification

## Core loop

1. User opens BLAZYCOIN.
2. User starts a connect-the-pattern challenge.
3. A server-authorized challenge is presented.
4. User completes the pattern correctly.
5. A scratch/reveal card displays the reward.
6. Backend records the reward as a ledger transaction.
7. Wallet balance increases.

The scratch interaction is a reveal animation in V1. Rewards are deterministic unless a future compliance review explicitly approves randomized rewards.

## Initial reward

The working prototype may display `0.005 BLAZY` per valid completion. Internally, balances must use integer smallest units. The exact emission rate is configurable and must be governed by the reward budget.

At 0.005 BLAZY per completion, 20,000 successful completions equal 100 BLAZY. This is a product/economic parameter, not a guaranteed cash value.

## Revenue model

Potential V1 revenue sources:
- Google/AdMob advertising
- Sponsored placements
- Referral/affiliate revenue where compliant

The target economic policy is to allocate a substantial portion of eligible platform revenue to the ecosystem reward pool, with 80% as the current design target. This is an internal allocation policy, not a promise of user returns.

## V1 screens

- Splash
- Welcome / Sign in
- Home
- Pattern Game
- Scratch Reward
- Wallet
- Transaction History
- Referral
- Offers / Ads area
- Profile / Security

## Non-goals for V1

- Public blockchain
- Mining
- User-created tokens
- Exchange listing
- Guaranteed returns
- Fixed INR redemption
- Business job marketplace

These can be evaluated only after the V1 economy, security, compliance and revenue model have been validated.
