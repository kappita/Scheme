#lang racket
(provide (all-defined-out))
(require "date.rkt")

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (file name ext content . args)
    (list "file" name ext content (get-date) (get-date) args null null null))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-file-name file)
  (cadr file))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-file-extension file)
  (caddr file))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-file-content file)
  (cadddr file))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-file-creation-date file)
  (cadddr (cdr file)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-file-modification-date file)
  (cadddr (cddr file)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-file-security file)
  (cadddr (cdddr file)))

(define (get-file-encryption file)
  (cadddr (cdddr (cdr file))))

(define (get-file-decryption file)
  (cadddr (cdddr (cddr file))))

(define (get-file-password file)
  (cadddr (cdddr (cdddr file))))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-file-name file new-name)
  (file new-name (get-file-extension file) (get-file-content file) (get-file-creation-date) (get-date) (get-file-security file)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-file-extension file new-ext)
  (file (get-file-name file) new-ext (get-file-content file) (get-file-creation-date) (get-date) (get-file-security file)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-file-content file new-content)
  (file(get-file-name file) (get-file-extension file) new-content (get-file-creation-date) (get-date) (get-file-security file)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-file-creation-date file new-date)
  (file(get-file-name file) (get-file-extension file) (get-file-content file) new-date (get-date) (get-file-security file)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-file-modification-date file new-date)
  (file(get-file-name file) (get-file-extension file) (get-file-content file) (get-file-creation-date) (get-date) (get-file-security file)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-file-security file new-security)
  (file(get-file-name file) (get-file-extension file) (get-file-content file) (get-file-creation-date) (get-date) new-security))

(file ":3" ".txt" "hola :3" #\C #\D)