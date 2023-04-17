#lang racket
(require racket/date)
(require "date.rkt")
(require "drive.rkt")
(require "drives.rkt")
(require "system.rkt")
(require "date.rkt")
(require "folder.rkt")
(require "users.rkt")
(require "element.rkt")
(require "path.rkt")
(require "file.rkt")
(require "content.rkt")


;; Terminar de crear los getters

(define (system name)
  (make-system name null null null null null (get-date) (get-date) null))


;;(define (register system name)


; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (register sys user)
  (if (member user (get-system-users sys)) sys 
      (set-system-modification-date
        (set-system-users
          sys
          (add-user-to-users
            (get-system-users sys)
            user)))))


; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (switch-drive sys letter)
  (if (null? (get-system-actual-user sys))
    sys
    (if (check-if-drive-exists (get-system-drives sys) letter)
      (set-system-actual-route (set-system-actual-drive sys letter)  (list letter))
      sys)))

;;(define (get-drives-drive drives letter)
;;    (if (equal? (car drives) letter)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (add-drive sys letter name capacity)
  (set-system-modification-date 
    (set-system-drives 
      sys 
      (add-drive-to-drives
        (get-system-drives sys)
        (make-drive letter name capacity null))) 
  ))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (login sys user)
  (if (member user (get-system-users sys))
    (set-system-actual-user sys user)
    (sys)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (logout sys)
  (set-system-actual-user sys null))


; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
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
        null
        null
        null))))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (cd sys path)
  (if (equal? path "/")
    (set-system-actual-route sys (list (get-system-actual-drive sys)))
    (if (equal? path "..")
      (set-system-actual-route sys (reverse (cdr (reverse (get-system-actual-route sys)))))
      (set-system-actual-route sys (reverse (cons path (reverse (get-system-actual-route sys))))))))


; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (add-file sys file)
  (set-system-drives 
    sys
    (add-to-route-drives
      (get-system-drives sys)
      (get-system-actual-route sys)
      file)))


(define (del sys filename)
  (set-system-drives
    (add-to-trash sys (get-from-route-drives (get-system-drives sys) (get-system-actual-route sys) filename) (get-system-actual-route sys))
    (del-from-route-drives
      (get-system-drives sys)
      (get-system-actual-route sys)
      filename)))


(define (copy sys filename route)
  (set-system-drives 
    sys
    (add-to-route-drives
      (get-system-drives sys)
      (get-targetPath route)
      (get-from-route-drives (get-system-drives sys) (get-system-actual-route sys) filename))))

(define (move sys filename route)
  (set-system-drives 
    sys
    (del-from-route-drives
      (get-system-drives (copy sys filename route))
      (get-system-actual-route sys)
      filename)))

(define (ren sys filename new-name)
  (set-system-drives
    sys
    (ren-to-route-drives
      (get-system-drives sys)
      (get-system-actual-route sys)
      filename
      new-name)))

(define (dir sys . params)
  (show-from-route-drives (get-system-drives sys) (get-system-actual-route sys) params))

      
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
  (add-drive S5 #\E "Hola" 10000))

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
(set-system-drives S8 (get-system-drives S8))
(set-system-drives S10 (get-system-drives S10))
(define S11
  (md S10 "bruh"))


(define S12
  (cd S11 "bruh"))

(define S13
  (md S12 "bruh2"))

(define S14
  (cd S13 "bruh2"))

(get-system-drives S14)
(define S15
  (md S14 "bruhhhh"))

(get-system-drives S15)
(get-system-trash S15)



(define S16
  (add-file S15 (file ":3" ".txt" "holaaa" #\C #\C)))

(dir S16)

(get-from-route-drives (get-system-drives S16) (list #\C "bruh" "bruh2") "bruhhhh")
(get-system-drives S16)



(define S17
  (move S16 ":3" "E:/"))

(define S18
  (ren S16 ":3" ":333"))
(get-system-drives S18)
