#lang racket
(provide (all-defined-out))
(require "folder.rkt")

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
  
(define (add-element-to-drive drive element)
  (set-drive-content drive 
  (reverse (cons element (reverse get-drive-content drive)))))

(define (set-to-route-drive drive route element)
  (if (null? route)
    (add-element-to-drive drive element)
    (set-to-route-folder )))
    




