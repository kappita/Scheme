#lang racket
(provide (all-defined-out))

; Dom: list (string) x string
; Rec: list (string)
; Descripción: Devuelve una lista con el usuario agregado
; Recursión: No aplica
(define (add-user-to-users user-list user)
  (reverse (cons user (reverse user-list))))

