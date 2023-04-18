#lang racket
(provide (all-defined-out))
(require racket/date)

; Dom: Fecha proveniente de racket/date
; Rec: String formateado con la fecha y la hora actual
; Descripción: Función para obtener un string con la hora actual
; Recursión: No aplica
(define (date-string fecha)
  (format "~a-~a-~a ~a:~a:~a"
    (date-day fecha)
    (date-month fecha)
    (date-year fecha)
    (date-hour fecha)
    (date-minute fecha)
    (date-second fecha))
)


; Dom: No aplica
; Rec: String formateado con la fecha y hora actual
; Descripción: Función para utilizar date-string sin argumento
; Recursión: No aplica
(define (get-date)
  (date-string (current-date)))