(define-non-fungible-token zen-achievement uint)

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))

(define-data-var last-id uint u0)
(define-map achievement-metadata 
  uint 
  {title: (string-ascii 50), 
   description: (string-ascii 256)}
)

(define-public (mint (recipient principal) (title (string-ascii 50)) (description (string-ascii 256)))
  (let ((token-id (+ (var-get last-id) u1)))
    (begin
      (asserts! (is-eq tx-sender contract-owner) err-owner-only)
      (try! (nft-mint? zen-achievement token-id recipient))
      (map-set achievement-metadata token-id {title: title, description: description})
      (var-set last-id token-id)
      (ok token-id)))
)

(define-read-only (get-metadata (token-id uint))
  (ok (map-get? achievement-metadata token-id))
)
