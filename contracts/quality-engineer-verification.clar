;; Quality Engineer Verification Contract
;; Manages verification and certification of quality engineers

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_VERIFIED (err u101))
(define-constant ERR_NOT_FOUND (err u102))
(define-constant ERR_INVALID_CERTIFICATION (err u103))

;; Data structures
(define-map verified-engineers principal {
    certification-level: uint,
    verification-date: uint,
    expiry-date: uint,
    specialization: (string-ascii 50),
    is-active: bool
})

(define-map certification-levels uint {
    name: (string-ascii 30),
    requirements: (string-ascii 200),
    validity-period: uint
})

(define-data-var next-cert-level uint u1)

;; Initialize certification levels
(map-set certification-levels u1 {
    name: "Junior Quality Engineer",
    requirements: "Basic quality control knowledge",
    validity-period: u31536000 ;; 1 year in seconds
})

(map-set certification-levels u2 {
    name: "Senior Quality Engineer",
    requirements: "Advanced statistical analysis skills",
    validity-period: u63072000 ;; 2 years in seconds
})

;; Public functions
(define-public (verify-engineer (engineer principal) (cert-level uint) (specialization (string-ascii 50)))
    (let ((cert-info (unwrap! (map-get? certification-levels cert-level) ERR_INVALID_CERTIFICATION))
          (current-time (unwrap-panic (get-block-info? time (- block-height u1)))))
        (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
        (asserts! (is-none (map-get? verified-engineers engineer)) ERR_ALREADY_VERIFIED)
        (ok (map-set verified-engineers engineer {
            certification-level: cert-level,
            verification-date: current-time,
            expiry-date: (+ current-time (get validity-period cert-info)),
            specialization: specialization,
            is-active: true
        }))))

(define-public (revoke-verification (engineer principal))
    (begin
        (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
        (asserts! (is-some (map-get? verified-engineers engineer)) ERR_NOT_FOUND)
        (ok (map-set verified-engineers engineer
            (merge (unwrap-panic (map-get? verified-engineers engineer)) {is-active: false})))))

;; Read-only functions
(define-read-only (is-verified-engineer (engineer principal))
    (match (map-get? verified-engineers engineer)
        engineer-data (and (get is-active engineer-data)
                          (> (get expiry-date engineer-data)
                             (unwrap-panic (get-block-info? time (- block-height u1)))))
        false))

(define-read-only (get-engineer-info (engineer principal))
    (map-get? verified-engineers engineer))

(define-read-only (get-certification-info (cert-level uint))
    (map-get? certification-levels cert-level))
