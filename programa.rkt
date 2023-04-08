#lang racket
(require racket/date)
(require "date.rkt")
(require "drive.rkt")
(require "system.rkt")
(require "date.rkt")
(require "folder.rkt")
(require "user.rkt")



;; Terminar de crear los getters

(define (system name)
  (make-system name null null null null null (get-date) (get-date)))


;;(define (register system name)

(define (register sys user)
  (if (member user (get-system-users sys)) sys 
      (set-system-modification-date
        (set-system-users
          sys
          (add-user-to-users
            (get-system-users sys)
            user)))))



(define (switch-drive sys letter)
  (if (null? (get-system-actual-user sys))
    sys
    (if (check-if-drive-exists (get-system-drives sys) letter)
      (set-system-actual-drive sys letter)
      sys)))

;;(define (get-drives-drive drives letter)
;;    (if (equal? (car drives) letter)))


(define (add-drive sys letter name capacity)
  (set-system-modification-date 
    (set-system-drives 
      sys 
      (add-drive-to-drives
        (get-system-drives sys)
        (make-drive letter name capacity null))) 
  ))



(define (login sys user)
  (if (member user (get-system-users sys))
    (set-system-actual-user sys user)
    (sys)))

(define (logout sys)
  (set-system-actual-user sys null))
;;(define (switch-drive ))

(define (md sys name)
  (set-system-drives sys ))





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
  (add-drive S4 #\C "Holi" 1000))

(define S6
  (add-drive S5 "D" "Hola" 10000))

(define S7
  (login S6 "dross"))

(define S8
  (switch-drive S7 "E"))

(define S9
  (switch-drive S8 "E"))

(define S10
  (logout S9))

(define S11
  (switch-drive S10 "C"))


(get-system-actual-drive S11)
(get-system-modification-date S11)
(get-system-drives S11)

