#lang racket
(provide (all-defined-out))
(require "element.rkt")

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


(define (get-showable-names content)
  (map (lambda (x) (string-append(get-element-name x) "\n")) (filter (lambda (x) (is-showable? x)) content)))

(define (get-all-names content)
  (map (lambda (x) (string-append (get-element-name x) "\n")) content))

; Dom: contents
; Rec: display 
; Descripción: muestra los contenidos cuando sea posible
; Recursión: No aplica

(define (show-content names)
  (if (null? names)
      (display "")
      (begin
        (display (car names))
        (show-content (cdr names)))))



;;(define (show-content content)
  ;;(apply (lambda (x) (if (is-showable? x) (display (string-append (get-element-name x) "\n")) (display ""))) content))



(display "bruh")
(get-showable-names (list (list "file" ":3" null null null null (list #\c)) (list "file" "DDD:" null null null null null) (list "folder" ":DDDD" null null null)))
(list (list "file" ":3" null null null null (list #\h)) (list "file" "DDD:" null null null null null))
(show-content (get-showable-names (list (list "file" ":3" null null null null (list #\h)) (list "file" "DDD:" null null null null null) (list "folder" ":DDDD" null null null)))) 
;;(define (show-content-sub content)
;;  (map (lambda (x) ()) content))