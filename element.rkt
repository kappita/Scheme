#lang racket
(provide (all-defined-out))


; Dom: Elemento
; Rec: string "file" or "folder"
; Descripción: Obtiene si el elemento es un archivo o una carpeta
; Recursión: No aplica
(define (get-element-type element)
  (car element))

; Dom: Elemento
; Rec: string
; Descripción: Obtiene el nombre de un elemento
; Recursión: No aplica
(define (get-element-name element)
  (cadr element))

; Dom: Elemento
; Rec: String or list ( elementos )
; Descripción: Obtiene los contenidos de un elemento
; Recursión: No aplica
(define (get-element-content element)
  (cadddr element))


(define (has-name? name element)
  (equal? name (get-element-name element)))
  


