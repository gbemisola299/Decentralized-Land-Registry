;; Decentralized Land Registry

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-already-registered (err u102))
(define-constant err-invalid-price (err u103))
(define-constant err-insufficient-funds (err u104))
(define-constant err-not-for-sale (err u105))

(define-constant err-not-verified (err u106))
(define-constant err-already-verified (err u107))
(define-constant err-invalid-dimensions (err u108))
(define-constant err-invalid-dates (err u109))


(define-map property-verification
  { property-id: uint }
  {
    verified: bool,
    verifier: principal,
    verification-date: uint,
    verification-expiry: uint
  }
)

(define-map property-disputes
  { property-id: uint, dispute-id: uint }
  {
    complainant: principal,
    description: (string-ascii 256),
    status: (string-ascii 20),
    filing-date: uint,
    resolution-date: (optional uint)
  }
)

(define-map properties
  { property-id: uint }
  {
    owner: principal,
    details: (string-ascii 256),
    price: uint,
    for-sale: bool,
    registration-date: uint
  }
)

(define-map property-transfers
  { property-id: uint }
  {
    from: principal,
    to: principal,
    status: (string-ascii 7),
    price: uint,
    transfer-date: uint
  }
)
