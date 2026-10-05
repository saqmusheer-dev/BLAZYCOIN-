# BLAZYCOIN

**Play. Earn. Use.**

BLAZYCOIN is a digital reward-economy project starting with a simple mobile experience and designed to evolve toward wallet utility, merchant payments, legitimate work opportunities, and eventually an independent blockchain.

## V1 — Locked Scope

- User registration and authentication
- BLAZY wallet
- Connect-the-pattern game
- Scratch/reveal reward
- Reward ledger and transaction history
- Referral system
- Advertising integration points
- Reward-pool and emission controls
- Anti-bot / anti-abuse foundations
- Admin dashboard foundation

### Economic principle

V1 rewards are issued from a controlled reward budget. The client application never has authority to mint or edit balances. All balance changes are ledger events authorized by the backend.

Advertising and other legitimate platform revenue may fund the ecosystem reward pool. The initial release does not promise a fixed cash value for BLAZY.

## Architecture direction

V1 is designed for practical deployment on cPanel/PHP/MySQL, with a mobile-friendly React frontend. The ledger uses integer smallest units rather than floating-point balances.

Future stages may introduce a cryptographically signed ledger, distributed nodes, a public testnet, and eventually the BLAZYCOIN blockchain. Blockchain consensus is intentionally out of scope for V1.

## Repository structure

```text
/app          React/PWA client
/api          PHP API and business logic
/database     MySQL schema and migrations
/docs         Product, economics and security specifications
/admin        Admin dashboard
/security     Security policies and threat model
```

## Development status

V1 foundation initialized. Domain and cPanel deployment will be connected later.
