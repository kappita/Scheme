#lang racket
(provide (all-defined-out))
(require racket/date)


(define (date-string fecha)
  (format "~a-~a-~a ~a:~a:~a"
    (date-day fecha)
    (date-month fecha)
    (date-year fecha)
    (date-hour fecha)
    (date-minute fecha)
    (date-second fecha))
)

(define (get-date)
  (date-string (current-date)))