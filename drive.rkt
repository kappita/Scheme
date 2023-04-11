#lang racket
(provide (all-defined-out))
(require "folder.rkt")
(require "element.rkt")

(define (make-drive letter name capacity content)
  (list letter name capacity content))

(define (get-drive-letter drive)
  (car drive))

(define (get-drive-name drive)
  (cadr drive))

(define (get-drive-capacity drive)
  (caddr drive))

(define (get-drive-content drive)
  (cadddr drive))

(define (set-drive-letter drive letter)
  (make-drive 
    letter
    (get-drive-name drive)
    (get-drive-capacity drive)
    (get-drive-content drive)))

(define (set-drive-name drive name)
  (make-drive 
    (get-drive-letter drive)
    name
    (get-drive-capacity drive)
    (get-drive-content drive)))

(define (set-drive-capacity drive capacity)
  (make-drive 
    (get-drive-letter drive)
    (get-drive-name drive)
    capacity
    (get-drive-content drive)))


(define (set-drive-content drive content)
  (make-drive 
    (get-drive-letter drive)
    (get-drive-name drive)
    (get-drive-capacity drive)
    content))

;,
(define (get-drive-element-by-name drive-contents name)
  (if (null? drive-contents)
    null
    (if (equal? name (get-element-name (car drive-contents)))
      (car drive-contents)
      (get-drive-element-by-name (cdr drive-contents) name))))

(define (set-content-element-by-name drive-contents name element)
  (if (null? drive-contents)
    drive-contents
    (if (equal? name (get-element-name (car drive-contents)))
      (cons element (cdr drive-contents))
      (cons (car drive-contents) (set-content-element-by-name (cdr drive-contents) name element)))))

(define (set-drive-contents-by-name drive name element)
  (set-drive-content drive (set-content-element-by-name (get-drive-content drive) name element)))



(define (add-element-to-drive drive element)
  (set-drive-content drive 
  (reverse (cons element (reverse (get-drive-content drive))))))

(define (add-to-route-drive drive route element)
  (if (null? route)
    (add-element-to-drive drive element)
    (set-drive-contents-by-name drive (car route) (add-to-route-folder (get-drive-element-by-name (get-drive-content drive) (car route)) (cdr route) element))))



    