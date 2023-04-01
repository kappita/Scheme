#lang racket

(define (make-system name users drives actual-user actual-drive actual-route )
    (list name users drives actual-user actual-drive actual-route))

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

(define (set-system-users sys users)
    (make-system
        (get-system-name sys)
        users
        (get-system-drives sys)
        (get-system-actual-user sys)
        (get-system-actual-drive sys)
        (get-system-actual-route sys)))

(define (set-system-actual-user sys user)
    (make-system
        (get-system-name sys)
        (get-system-users sys)
        (get-system-drives sys)
        user
        (get-system-actual-drive sys)
        (get-system-actual-route sys)))


(define (set-system-drives sys drives)
    (make-system 
        (get-system-name sys)
        (get-system-users sys)
        drives
        (get-system-actual-user sys)
        (get-system-actual-drive sys)
        (get-system-actual-route sys)))

;; Terminar de crear los getters

(define (system name)
    (make-system name null null null null null))



(define (add-user-to-users user-list user)
    (reverse (cons user (reverse user-list))))
;;(define (register system name)

(define (register sys user)
    (if (member user (get-system-users sys)) sys 
    (set-system-users sys (add-user-to-users (get-system-users sys) user))))



(define (make-drive letter name capacity content)
    (list letter name capacity content))

(define (get-drive-letter drive)
    (car drive))

(define (get-drive-name drive)
    (cadr drive))

(define (get-drive-capacity drive)
    (caddr drive))

(define (get-drive-content drive)
    (cadddr drive))

(define (add-drive-to-drives drives new-drive)
    (reverse (cons new-drive (reverse drives))))

(define (add-drive sys letter name capacity)
    (set-system-drives sys (add-drive-to-drives (get-system-drives sys) (make-drive letter name capacity null))) 
    )



(define (login sys user)
    (if (member user (get-system-users sys)) (set-system-actual-user sys user) (sys)))

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

(define S5
    (add-drive S4 "C" "Holi" 1000))

(define S6
    (add-drive S5 "D" "Hola" 10000))

(define S7
    (login S6 "dross"))

(get-system-actual-user S7)



