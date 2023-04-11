#lang racket
(require racket/date)
(require "date.rkt")
(require "drive.rkt")
(require "drives.rkt")
(require "system.rkt")
(require "date.rkt")
(require "folder.rkt")
(require "user.rkt")
(require "element.rkt")
(require "path.rkt")



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
      (set-system-actual-route (set-system-actual-drive sys letter)  (list letter))
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
  (set-system-drives
    sys 
    (add-to-route-drives 
      (get-system-drives sys)
      (get-system-actual-route sys)
      (make-folder
        name
        (get-system-actual-user sys)
        '()
        (get-date)
        (get-date)
        0
        0
        '()
        null
        null
        null))))

(define (cd sys path)
  (if (equal? path "/")
    (set-system-actual-route sys (list (get-system-actual-drive sys)))
    (if (equal? path "..")
      (set-system-actual-route sys (reverse (cdr (reverse (get-system-actual-route sys)))))
      (set-system-actual-route sys (reverse (cons path (reverse (get-system-actual-route sys))))))))




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
  (add-drive S5 #\D "Hola" 10000))

(define S7
  (login S6 "juan"))

(define S8
  (switch-drive S7 #\C))

(define S9
  (switch-drive S8 #\C))


(define S10
  (switch-drive S9 "C"))

(get-system-actual-route S10)
(get-system-drives S10)
(get-date)

(get-system-users S10)
(set-system-drives S10 (get-system-drives S10))
(define S11
  (md S10 "bruh"))

(define S12
  (cd S11 "bruh"))

(define S13
  (md S12 "bruh2"))
(get-system-drives S13)