#lang racket
(require "date.rkt")
(provide (all-defined-out))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (make-system name users drives actual-user actual-drive actual-route creation-date modification-date trash)
  (list name users drives actual-user actual-drive actual-route creation-date modification-date trash))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-system-name sys)
  (car sys))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-system-users sys)
  (cadr sys))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-system-drives sys)
  (caddr sys))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-system-actual-user sys)
  (cadddr sys))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-system-actual-drive sys)
  (cadddr (cdr sys)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-system-actual-route sys)
  (cadddr (cddr sys)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-system-creation-date sys)
  (cadddr (cdddr sys)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-system-modification-date sys)
  (cadddr (cdddr (cdr sys))))

(define (get-system-trash sys)
  (cadddr (cdddr (cddr sys))))
; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-system-users sys users)
  (make-system
    (get-system-name sys)
    users
    (get-system-drives sys)
    (get-system-actual-user sys)
    (get-system-actual-drive sys)
    (get-system-actual-route sys)
    (get-system-creation-date sys)
    (get-date)
    (get-system-trash sys)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-system-drives sys drives)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   drives
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)
   (get-system-trash sys)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-system-actual-user sys user)
  (make-system
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   user
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)
   (get-system-trash sys)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-system-actual-drive sys drive)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   drive
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)
   (get-system-trash sys)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-system-actual-route sys route)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   route
   (get-system-creation-date sys)
   (get-date)
   (get-system-trash sys))
  )


; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica;; Probably useless
(define (set-system-creation-date sys)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-date)
   (get-date)
   (get-system-trash sys)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-system-modification-date sys)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)
   (get-system-trash sys)))

(define (set-system-trash sys trash)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)
   trash))

(define (add-to-trash sys element route)
  (set-system-trash sys (reverse (cons (list route element) (reverse (get-system-trash sys))))))