#lang racket
(provide (all-defined-out))
(require "element.rkt")


(define (make-content content-list)
    content-list)

(define (add-to-content content element)
    (make-content
      (reverse (cons element (reverse content)))))

(define (remove-from-list content-list name)
  (if (null? content-list)
    content-list
    (if (equal? (get-element-name (car content-list)) name)
      (cdr content-list)
      (cons (car content-list) (remove-from-list (cdr content-list) name)))))

(define (remove-from-content content name)
  (make-content (remove-from-list content name)))

(define (S1)
  (make-content null))
(define (S2) (add-to-content S1 "bruh"))
(define (S3) (add-to-content S2 "gwagwa"))

(S3)