(define-map sessions 
  principal 
  {total-minutes: uint,
   last-session: uint,
   streak: uint}
)

(define-constant min-session-length u5)
(define-constant tokens-per-minute u1)

(define-public (start-session (duration uint))
  (let ((user tx-sender))
    (begin
      (asserts! (>= duration min-session-length) (err u100))
      (ok (map-set sessions user 
        {total-minutes: duration,
         last-session: block-height,
         streak: u1}))))
)

(define-read-only (get-user-stats (user principal))
  (ok (map-get? sessions user))
)
