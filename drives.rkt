#lang racket
(provide (all-defined-out))
(require "folder.rkt")
(require "drive.rkt")


; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-drive-pos-cola drives letter acc)
  (if (null? drives)
    null
    (if (equal? letter (get-drive-letter (car drives)))
      acc
      (get-drive-pos-cola (cdr drives) letter (+ acc 1)))))


; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-drive-pos drives letter)
  (get-drive-pos-cola drives letter 0))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-drive-by-letter drives letter)
  (if (equal? letter (get-drive-letter (car drives)))
    (car drives)
    (get-drive-by-letter (cdr drives) letter)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (add-drive-to-drives drives new-drive)
  (reverse (cons new-drive (reverse drives))))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (check-if-drive-exists drives letter)
  (if (null? drives)
    #f
    (if (equal? letter (car (car drives)))
      #t
      (check-if-drive-exists (cdr drives) letter))))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-drives-drive drives letter drive)
  (if (null? drives)
    drives
    (if (equal? letter (get-drive-letter (car drives)))
      (cons drive (cdr drives))
      (cons (car drives) (set-drives-drive (cdr drives letter drive))))))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (add-to-route-drives drives route element)
  (if (check-if-drive-exists drives (car route))
    (set-drives-drive drives (car route) (add-to-route-drive (get-drive-by-letter drives (car route)) (cdr route) element))
    drives
  ))

(define (del-from-route-drives drives route name)
  (if (check-if-drive-exists drives (car route))
    (set-drives-drive drives (car route) (del-from-route-drive (get-drive-by-letter drives (car route)) (cdr route) name))
    drives))

(define (get-from-route-drives drives route name)
  (if (check-if-drive-exists drives (car route))
    (get-from-route-drive (get-drive-by-letter drives (car route)) (cdr route) name)
    null))

;;
;; Rec: Bool
