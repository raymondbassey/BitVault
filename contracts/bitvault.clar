;; Title: BitVault Protocol
;; Summary: Revolutionary Bitcoin-native lending ecosystem that transforms dormant STX holdings 
;;          into productive financial instruments through intelligent collateralization and 
;;          algorithmic risk assessment on Stacks blockchain infrastructure.
;;
;; Description: BitVault represents the next evolution in Bitcoin DeFi, offering institutional-grade 
;;              lending services that unlock liquidity from STX assets without forcing users to sell. 
;;              Through advanced collateral management, dynamic interest calculations, and autonomous 
;;              liquidation protocols, BitVault creates a seamless bridge between Bitcoin's security 
;;              and modern financial primitives. The protocol empowers users to leverage their STX 
;;              holdings while maintaining exposure to Bitcoin's long-term value proposition through 
;;              sophisticated risk management and real-time position monitoring.

;; PROTOCOL CONSTANTS & ERROR HANDLING

;; Contract Administration
(define-constant CONTRACT-OWNER tx-sender)

;; System Error Codes
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-INSUFFICIENT-COLLATERAL (err u101))
(define-constant ERR-INVALID-AMOUNT (err u102))
(define-constant ERR-LOAN-NOT-FOUND (err u103))
(define-constant ERR-LOAN-ACTIVE (err u104))
(define-constant ERR-INSUFFICIENT-BALANCE (err u105))
(define-constant ERR-LIQUIDATION-FAILED (err u106))
(define-constant ERR-INVALID-PARAMETER (err u107))

;; Risk Management Parameters
(define-constant MAX-COLLATERAL-RATIO u500) ;; Maximum allowed collateral ratio (500%)
(define-constant MIN-COLLATERAL-RATIO u110) ;; Minimum required collateral ratio (110%)
(define-constant MAX-PROTOCOL-FEE u10) ;; Maximum protocol fee (10%)

;; PROTOCOL STATE VARIABLES

;; Core Risk Parameters
(define-data-var minimum-collateral-ratio uint u150) ;; Default: 150% - Conservative lending ratio
(define-data-var liquidation-threshold uint u130) ;; Default: 130% - Liquidation trigger point
(define-data-var protocol-fee uint u1) ;; Default: 1% - Protocol revenue fee

;; Global Protocol Metrics
(define-data-var total-deposits uint u0) ;; Total STX deposited as collateral
(define-data-var total-borrows uint u0) ;; Total STX borrowed from protocol

;; DATA STRUCTURES & MAPPINGS

;; Individual Loan Records
(define-map loans
  { loan-id: uint }
  {
    borrower: principal,
    collateral-amount: uint,
    borrowed-amount: uint,
    interest-rate: uint,
    start-height: uint,
    last-interest-update: uint,
    active: bool,
  }
)

;; User Portfolio Tracking
(define-map user-positions
  { user: principal }
  {
    total-collateral: uint, ;; Total STX deposited as collateral
    total-borrowed: uint, ;; Total STX borrowed
    loan-count: uint, ;; Number of active loans
  }
)