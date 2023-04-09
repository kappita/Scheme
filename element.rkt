#lang racket
(provide (all-defined-out))


(define (get-element-type element)
  (car element))

(define (get-element-name element)
  (cadr element))

(define (get-element-author element)
  (caddr element))

(define (get-element-content element)
  (cadddr element))

