#lang racket
(provide (all-defined-out))


(define (add-user-to-users user-list user)
  (reverse (cons user (reverse user-list))))