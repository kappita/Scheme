#lang racket

(define (make-user name)
    list name)

(define (make-system name users drives drive-actual ruta-actual)
    (list name users drives drive-actual ruta-actual))

(define (get-system-name sys)
    (car sys))

(define (get-system-users sys)
    (cadr sys))

(define (get-system-drives sys)
    caddr sys)

;; Terminar de crear los getters


(define (system name)
    (make-system name null null null null))

(define (get-users sys) (cadr sys))

(define (add-user username . users)
    list users username)
;;(define (register system name)

(define S0 (system "newSystem"))
(define S1 (get-system-users S0))

S1
