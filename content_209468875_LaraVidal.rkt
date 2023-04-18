#lang racket
(provide (all-defined-out))
(require "element_209468875_LaraVidal.rkt")

; Dom: contents x string
; Rec: element
; Descripción: Retorna un elemento de los contenidos según su nombre
; Recursión: natural
(define (get-content-element-by-name content name)
  (if (null? content)
    null
    (if (equal? name (get-element-name (car content)))
      (car content)
      (get-content-element-by-name (cdr content) name))))

; Dom: contents x string x element
; Rec: contents
; Descripción: Reemplaza o modifica un elemento del contenido según su nombre
; Recursión: Natural
(define (set-content-by-name contents name element)
  (if (null? contents)
    contents
    (if (equal? name (get-element-name (car contents)))
      (cons element (cdr contents))
      (cons (car contents) (set-content-by-name ((cdr contents) name element))))))

; Dom: contents x element
; Rec: contents
; Descripción: agrega un elemento a contenidos
; Recursión: No aplica
(define (add-element-to-content contents element)
    (if (member (get-element-name element) (map (lambda (x) (get-element-name x)) contents))
      contents
      (reverse (cons element (reverse contents)))))

; Dom: contents x string
; Rec: contents
; Descripción: Elimina un elemento de contenido si tiene el nombre indicado
; Recursión: No aplica
(define (del-element-from-content contents name)
  (filter (lambda (x) (not (has-name? name x))) contents))

; Dom: contents x string x string
; Rec: contents
; Descripción: renombra un elemento de contenido
; Recursión: No aplica
(define (ren-element-from-content contents name new-name)
  (if (member new-name (map (lambda (x) (get-element-name x)) contents))
  contents
  (map (lambda (x) (if (has-name? name x)
                      (set-element-modification-date (set-element-name x new-name))
                      x)) contents)))

; Dom: contents x string x función x función x string
; Rec: contents
; Descripción: Encripta un elemento  de cierto nombre
; Recursión: No aplica
(define (enc-element-from-content contents name enc-fn dec-fn password)
  (if (member name (map (lambda (x) (get-element-name x)) contents))
    (map (lambda (x) (if (has-name? name x)
                        (encrypt-element x enc-fn dec-fn password)
                        x)) contents)
    contents))

; Dom: contents x string x string
; Rec: contents
; Descripción: Desencripta un elemento de cierto nombre
; Recursión: No aplica
(define (dec-element-from-content contents name password)
  (if (member name (map (lambda (x) (get-element-name x)) contents))
    (map (lambda (x) (if (has-name? name x)
                        (decrypt-element x password)
                        x)) contents)
    contents))

; Dom: Content
; Rec: list (string)
; Descripción: Retorna una lista con el nombre de todos los elementos mostrables
; Recursión: No aplica
(define (get-showable-names content)
  (map (lambda (x) (string-append(get-element-name x) "\n")) (filter (lambda (x) (is-showable? x)) content)))

; Dom:  content
; Rec: list (string)
; Descripción: Retorna una lista con el nombre de todos los elementos
; Recursión: No aplica
(define (get-all-names content)
  (map (lambda (x) (string-append (get-element-name x) "\n")) content))

; Dom: contents x string
; Rec: string
; Descripción: retorna los contenidos cuando sea posible
; Recursión: cola

(define (show-content names result)
  (if (null? names)
    result
    (show-content (cdr names) (string-append result (car names)))))

; Dom: contents x string x string
; Rec: string
; Descripción: Retorna las ocurrencias de un string en contenido
; Recursión: cola
(define (grep-content content match result)
  (if (null? content)
    result
    (grep-content (cdr content) match (string-append result (grep-element (car content) match)))))

