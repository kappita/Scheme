#lang racket
(provide (all-defined-out))
(require "folder.rkt")
(require "element.rkt")

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (make-drive letter name capacity content)
  (list letter name capacity content))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-drive-letter drive)
  (car drive))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-drive-name drive)
  (cadr drive))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-drive-capacity drive)
  (caddr drive))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-drive-content drive)
  (cadddr drive))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-drive-letter drive letter)
  (make-drive 
    letter
    (get-drive-name drive)
    (get-drive-capacity drive)
    (get-drive-content drive)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-drive-name drive name)
  (make-drive 
    (get-drive-letter drive)
    name
    (get-drive-capacity drive)
    (get-drive-content drive)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-drive-capacity drive capacity)
  (make-drive 
    (get-drive-letter drive)
    (get-drive-name drive)
    capacity
    (get-drive-content drive)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-drive-content drive content)
  (make-drive 
    (get-drive-letter drive)
    (get-drive-name drive)
    (get-drive-capacity drive)
    content))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-drive-element-by-name drive-contents name)
  (if (null? drive-contents)
    null
    (if (equal? name (get-element-name (car drive-contents)))
      (car drive-contents)
      (get-drive-element-by-name (cdr drive-contents) name))))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-content-element-by-name drive-contents name element)
  (if (null? drive-contents)
    drive-contents
    (if (equal? name (get-element-name (car drive-contents)))
      (cons element (cdr drive-contents))
      (cons (car drive-contents) (set-content-element-by-name (cdr drive-contents) name element)))))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-drive-contents-by-name drive name element)
  (set-drive-content drive (set-content-element-by-name (get-drive-content drive) name element)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (add-element-to-drive drive element)
  (set-drive-content drive 
  (reverse (cons element (reverse (get-drive-content drive))))))

(define (del-from-drive-contents drive-contents name new-drive)
  (if (null? drive-contents)
    new-drive
    (if (equal? name get-element-name (car drive-contents))
      (del-from-drive-contents (cdr drive-contents) name new-drive)
      (del-from-drive-contents (cdr drive-contents) name (reverse (cons (car drive-contents) (reverse new-drive)))))))



(define (del-element-from-drive drive name)
  (set-drive-content drive
    (filter (lambda (x) (not (has-name? name x))) (get-drive-content drive)))
  )

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (add-to-route-drive drive route element)
  (if (null? route)
    (add-element-to-drive drive element)
    (set-drive-contents-by-name drive (car route) (add-to-route-folder (get-drive-element-by-name (get-drive-content drive) (car route)) (cdr route) element))))

(define (del-from-route-drive drive route name)
  (if (null? route)
    (del-element-from-drive drive name)
    (set-drive-contents-by-name drive (car route) (del-from-route-folder (get-drive-element-by-name (get-drive-content drive) (car route)) (cdr route) name))))


(define (get-from-route-drive drive route name)
  (if (null? route)
    (get-drive-element-by-name (get-drive-content drive) name)
    (get-from-route-folder (get-drive-element-by-name (get-drive-content drive) (car route)) (cdr route) name)))

(del-element-from-drive (list null null null (list (list null "bruh") (list null ":3") (list null ":000"))) ":3")