#lang racket

(define (make-system name users drives actual-user actual-drive actual-route )
    (list name users drives actual-user actual-drive actual-route))

(define (get-system-name sys)
    (car sys))

(define (get-system-users sys)
    (cadr sys))

(define (get-system-drives sys)
    caddr sys)


(define (get-system-actual-user sys)
    (cadddr sys))

(define (get-system-actual-drive sys)
    (cadddr (cdr sys)))

(define (get-system-actual-route sys)
    (cadddr (cddr sys)))

(define (set-system-users sys users)
    (make-system
        get-system-name
        users
        get-system-drives
        get-system-actual-user
        get-system-actual-drive
        get-system-actual-route))

;; Terminar de crear los getters

(define (system name)
    (make-system name null null null null null))

(define (make-user name)
    (list name))


(define (add-user-to-users user-list user)
    (reverse (cons user (reverse user-list))))
;;(define (register system name)

(define (register sys user)
    (if (member user (get-system-users sys)) sys 
    (set-system-users sys (add-user-to-users (get-system-users sys) user))))

(define S0 (system "newSystem"))
(get-system-actual-route S0)










(define S1
    (register S0 "juan"))

(define S2
    (register S1 "dross"))

(define S3
    (register S2 "COÑOOOOOOOOO"))

(define S4
    (register S3 "dross"))

(get-system-users S4)



