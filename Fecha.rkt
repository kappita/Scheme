#lang racket
(provide (all-defined-out))
(require racket/date)

(define fecha-actual (current-date))

(define fecha-actual-lista
  (list
   (date-year fecha-actual)
   (date-month fecha-actual)
   (date-day fecha-actual)))
  
(define fecha (string-append (number->string(list-ref fecha-actual-lista 0)) "/"
                            (number->string(list-ref fecha-actual-lista 1)) "/"
                            (number->string(list-ref fecha-actual-lista 2))))

