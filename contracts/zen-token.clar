(define-fungible-token zen-token)

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-invalid-amount (err u101))

(define-data-var token-uri (string-utf8 256) "https://zensync.io/token/metadata")

(define-public (mint (amount uint) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (ft-mint? zen-token amount recipient))
)

(define-public (transfer (amount uint) (sender principal) (recipient principal))
  (begin
    (asserts! (> amount u0) err-invalid-amount)
    (ft-transfer? zen-token amount sender recipient))
)

(define-read-only (get-balance (account principal))
  (ok (ft-get-balance zen-token account))
)
