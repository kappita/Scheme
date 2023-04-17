#lang racket
(provide (all-defined-out))
(require "date.rkt")


; Dom: Elemento
; Rec: string "file" or "folder"
; Descripción: Obtiene si el elemento es un archivo o una carpeta
; Recursión: No aplica
(define (get-element-type element)
  (car element))

; Dom: Element
; Rec: string
; Descripción: Obtiene el nombre de un elemento
; Recursión: No aplica
(define (get-element-name element)
  (cadr element))

; Dom: Element
; Rec: String or list ( elementos )
; Descripción: Obtiene los contenidos de un elemento
; Recursión: No aplica
(define (get-element-content element)
  (cadddr element))

; Dom: element
; Rec: date-string
; Descripción: obtiene la fecha de creación de un elemento
; Recursión: No aplica
(define (get-element-creation-date element)
    (cadddr (cdr element)))

; Dom: element
; Rec: date-string
; Descripción: obtiene la fecha de modificación de un elemento
; Recursión: No aplica
(define (get-element-modification-date element)
    (cadddr (cdr element)))

; Dom: element
; Rec: list (char)
; Descripción: obtiene los atributos de seguridad de un elemento
; Recursión: No aplica
(define (get-element-security element)
  (cadddr (cdddr element)))

; Dom: element x string
; Rec: element
; Descripción: modifica el nombre de un elemento
; Recursión: No aplica
(define (set-element-name element new-name)
  (cons (car element) (cons new-name (cddr element))))


; Dom: element
; Rec: element
; Descripción: modifica la fecha de modificación de un elemento
; Recursión: No aplica
(define (set-element-modification-date element)
  (if (equal? (car element) "file")
    (reverse (cons (car (reverse element)) (cons (cadr (reverse element)) (cons (caddr (reverse element)) (cons (cadddr (reverse element)) (cons (get-date) (cddr (cdddr (reverse element)))))))))
    (reverse (cons (car (reverse element)) (cons (cadr (reverse element)) (cons (caddr (reverse element)) (cons (get-date) (cdr (cdddr (reverse element))))))))))


; Dom: elemento x string
; Rec: boolean
; Descripción: Determina si un elemento tiene el nombre indicado
; Recursión: No aplica
(define (has-name? name element)
  (equal? name (get-element-name element)))


; Dom: elemento
; Rec: Boolean
; Descripción: Determina si un elemento es mostrable en consola o no
; Recursión: No aplica
(define (is-showable? element)
  (if (equal? "folder" (get-element-type element))
    #t
    (if (member #\h (get-element-security element))
      #f
      #t)))
