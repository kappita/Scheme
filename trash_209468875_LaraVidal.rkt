#lang racket
(require "date_209468875_LaraVidal.rkt")
(require "element_209468875_LaraVidal.rkt")
(provide (all-defined-out))

; Dom: trash
; Rec: path
; Descripción: Obtiene la ruta de un elemento de la basura
; Recursión: No aplica
(define (get-trash-route trash)
  (car trash))
; Dom: trash
; Rec: element
; Descripción: Obtiene un elemento de la basura
; Recursión: No aplica
(define (get-trash-element trash)
  (cadr trash))

; Dom: trash string
; Rec: string
; Descripción: Retorna un string con los elementos de la basura
; Recursión: cola
(define (show-trash-elements trash result)
  (if (null? trash)
    result
    (show-trash-elements (cdr trash) (string-append result (string-append (get-element-name (get-trash-element (car trash))) "\n"))))
  )

; Dom: trash x string
; Rec: element
; Descripción: Retorna un elemento de tal nombre en trash
; Recursión: natural
(define (get-trash-element-by-name trash filename)
  (if (null? trash)
    null
    (if (equal? filename (get-element-name (get-trash-element (car trash))))
      (get-trash-element (car trash))
      (get-trash-element-by-name (cdr trash) filename))))

; Dom: trash x string
; Rec: path
; Descripción: Retorna la ruta de tal nombre en trash
; Recursión: natural
(define (get-trash-route-by-name trash filename)
  (if (null? trash)
    null
    (if (equal? filename (get-element-name (get-trash-element (car trash))))
      (get-trash-route (car trash))
      (get-trash-route-by-name (cdr trash) filename))))

; Dom: trash x string
; Rec: trash
; Descripción: Elimina un elemento en trash
; Recursión: no aplica
(define (del-trash-by-name trash filename)
  (filter (lambda (x) (not (has-name? filename (get-trash-element x)))) trash))