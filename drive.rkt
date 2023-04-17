#lang racket
(provide (all-defined-out))
(require "folder.rkt")
(require "element.rkt")
(require "content.rkt")

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

(define (add-element-to-drive drive element)
    (set-drive-content drive (reverse (cons element (reverse (get-drive-content drive))))))



(define (add-to-route-drive drive route element)
  (if (null? route)
    (set-drive-content drive (add-element-to-content (get-drive-content drive) element))
    (set-drive-content drive (set-content-by-name (get-drive-content drive) (car route) (add-to-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) element)))))

(define (del-from-route-drive drive route name)
  (if (null? route)
    (set-drive-content drive (del-element-from-content (get-drive-content drive) name))
    (set-drive-content drive (set-content-by-name (get-drive-content drive) (car route) (del-from-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) name)))))


(define (get-from-route-drive drive route name)
  (if (null? route)
    (get-content-element-by-name (get-drive-content drive) name)
    (get-from-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) name)))

(define (ren-to-route-drive drive route filename new-name)
  (if (null? route)
    (set-drive-content drive (ren-element-from-content (get-drive-content drive) filename new-name))
    (set-drive-content drive (set-content-by-name (get-drive-content drive) (car route) (ren-to-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) filename new-name)))))

(define (show-from-route-drive drive route params)
  (if (null? route)
  (cond 
    [(member "/a" params) (show-content (get-all-names (get-drive-content drive)))]
    [(member "/?" params) (display "Comandos disponibles:\n /s enseña los subdirectorios (no implementado)\n /a enseña los archivos ocultos \n /o enseña en orden (no implementado) \n /? enseña los comandos disponibles\n")]
    [else (show-content (get-showable-names (get-drive-content drive)))])
  (show-from-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) params)
    ))
