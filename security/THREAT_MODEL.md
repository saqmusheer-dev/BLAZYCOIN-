# BLAZYCOIN V1 Threat Model

## Trust boundaries

The mobile/web client is untrusted. A modified APK, rooted device, browser script or automated bot must be assumed capable of changing client-side state.

The backend and database are the authority for:

- identity
- challenge issuance
- challenge validation
- reward authorization
- wallet balance
- ledger history
- emission limits

## Required controls

1. Server-generated unique challenge IDs and nonces.
2. One-time challenge completion with replay protection.
3. Idempotency keys for reward transactions.
4. Per-user, per-device and global rate limits.
5. Suspicious activity logging.
6. Transactional database updates for wallet + ledger.
7. Append-only ledger semantics: corrections use reversal entries rather than silent edits.
8. Password hashing using a modern password-hashing function such as Argon2id where supported.
9. Secure session cookies/tokens with short-lived access credentials.
10. HTTPS-only deployment.
11. Secrets stored outside source control.
12. Admin actions require authentication, authorization and audit logging.
13. Never trust a client-provided reward amount.
14. Never expose database credentials to the app.
15. Never use JavaScript floating-point arithmetic as the authoritative balance calculation.

## Future security direction

The architecture should remain crypto-agile. Future distributed-ledger work can introduce digital signatures, hardware-backed keys, post-quantum algorithms and independent node validation without changing the user-facing wallet model.
