#lang racket
(provide (all-defined-out))
;;(require "file.rkt")


; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica


; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
;; Rec: list folder x file
(define (get-targetPath path)
    (reverse (cdr (reverse (cons (string-ref path 0) (cdr (regexp-split "/" path)))))))


(get-targetPath "C:/BRUH/")
