#lang racket
(provide (all-defined-out))

; Dom: string
; Rec: list (string)
; Descripción: Obtiene una lista con los strings de los elementos
; Recursión: No aplica
(define (to-path path)
  (regexp-split "/" path))

; Dom: string
; Rec: path
; Descripción: Obtiene el targetpath a partir de una ruta
; Recursión: No aplica
(define (get-targetPath path)
  (reverse (cdr (reverse (cons (char-downcase (string-ref path 0)) (cdr (regexp-split "/" path)))))))


(get-targetPath "C:/BRUH/")
(to-path "holi")


