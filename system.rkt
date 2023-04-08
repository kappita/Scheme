#lang racket
(require "date.rkt")
(provide (all-defined-out))

(define (make-system name users drives actual-user actual-drive actual-route creation-date modification-date)
  (list name users drives actual-user actual-drive actual-route creation-date modification-date))

(define (get-system-name sys)
  (car sys))

(define (get-system-users sys)
  (cadr sys))

(define (get-system-drives sys)
  (caddr sys))

(define (get-system-actual-user sys)
  (cadddr sys))

(define (get-system-actual-drive sys)
  (cadddr (cdr sys)))

(define (get-system-actual-route sys)
  (cadddr (cddr sys)))

(define (get-system-creation-date sys)
  (cadddr (cdddr sys)))

(define (get-system-modification-date sys)
  (cadddr (cdddr (cdr sys))))

(define (set-system-users sys users)
  (make-system
   (get-system-name sys)
   users
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-system-modification-date sys)))

(define (set-system-drives sys drives)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   drives
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-system-modification-date sys)))

(define (set-system-actual-user sys user)
  (make-system
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   user
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-system-modification-date sys)))

(define (set-system-actual-drive sys drive)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   drive
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-system-modification-date sys)))

(define (set-system-actual-route sys route)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   route
   (get-system-creation-date sys)
   (get-system-modification-date sys))
  )

;; Probably useless
(define (set-system-creation-date sys)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-date)
   (get-system-modification-date sys)))

(define (set-system-modification-date sys)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)))


