#lang racket
(require "date_209468875_LaraVidal.rkt")
(provide (all-defined-out))

; Dom: string x list (string) x drives x string x char x path x date-string x date-string x trash
; Rec: System
; Descripción: Crea un sistema a partir de los parámetros entregados
; Recursión: No aplica
(define (make-system name users drives actual-user actual-drive actual-route creation-date modification-date trash)
  (list name users drives actual-user actual-drive actual-route creation-date modification-date trash))

; Dom: System
; Rec: string
; Descripción: Retorna el nombre del sistema
; Recursión: No aplica
(define (get-system-name sys)
  (car sys))

; Dom: System
; Rec: list (string)
; Descripción: Retorna los usuarios del sistema
; Recursión: No aplica
(define (get-system-users sys)
  (cadr sys))

; Dom: System
; Rec: drives
; Descripción: Retorna los drives del sistema
; Recursión: No aplica
(define (get-system-drives sys)
  (caddr sys))

; Dom: System
; Rec: string
; Descripción: Retorna el usuario actual del sistema
; Recursión: No aplica
(define (get-system-actual-user sys)
  (cadddr sys))

; Dom: System
; Rec: char
; Descripción: Retorna el drive actual del sistema
; Recursión: No aplica
(define (get-system-actual-drive sys)
  (cadddr (cdr sys)))

; Dom: System
; Rec: path
; Descripción: Retorna la ruta actual del sistema
; Recursión: No aplica
(define (get-system-actual-route sys)
  (cadddr (cddr sys)))

; Dom: System
; Rec: date-string
; Descripción: Retorna la fecha de creación del sistema
; Recursión: No aplica
(define (get-system-creation-date sys)
  (cadddr (cdddr sys)))

; Dom: System
; Rec: date-string
; Descripción: Retorna la fecha de modificación del sistema
; Recursión: No aplica
(define (get-system-modification-date sys)
  (cadddr (cdddr (cdr sys))))

; Dom: System
; Rec: trash
; Descripción: Retorna la papelera del sistema
; Recursión: No aplica
(define (get-system-trash sys)
  (cadddr (cdddr (cddr sys))))
  
; Dom: System
; Rec: System
; Descripción: Modifica los usuarios del sistema
; Recursión: No aplica
(define (set-system-users sys users)
  (make-system
    (get-system-name sys)
    users
    (get-system-drives sys)
    (get-system-actual-user sys)
    (get-system-actual-drive sys)
    (get-system-actual-route sys)
    (get-system-creation-date sys)
    (get-date)
    (get-system-trash sys)))

; Dom: System
; Rec: System
; Descripción: Modifica los drives del sistema
; Recursión: No aplica
(define (set-system-drives sys drives)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   drives
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)
   (get-system-trash sys)))

; Dom: System
; Rec: System
; Descripción: Modifica el usuario actual del sistema
; Recursión: No aplica
(define (set-system-actual-user sys user)
  (make-system
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   user
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)
   (get-system-trash sys)))

; Dom: System
; Rec: System
; Descripción: Modifica el drive actual del sistema
; Recursión: No aplica
(define (set-system-actual-drive sys drive)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   drive
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)
   (get-system-trash sys)))

; Dom: System
; Rec: System
; Descripción: Modifica la ruta actual del sistema
; Recursión: No aplica
(define (set-system-actual-route sys route)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   route
   (get-system-creation-date sys)
   (get-date)
   (get-system-trash sys))
  )


; Dom: System
; Rec: System
; Descripción: Modifica la fecha de creación del sistema
; Recursión: No aplica
(define (set-system-creation-date sys)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-date)
   (get-date)
   (get-system-trash sys)))

; Dom: System
; Rec: System
; Descripción: Modifica la fecha de modificación del sistema
; Recursión: No aplica
(define (set-system-modification-date sys)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)
   (get-system-trash sys)))

; Dom: System
; Rec: System
; Descripción: Modifica la basura del sistema
; Recursión: No aplica
(define (set-system-trash sys trash)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)
   trash))

; Dom: System
; Rec: System
; Descripción: Agrega un elemento a la basura del sistema
; Recursión: No aplica
(define (add-to-trash sys element route)
  (set-system-trash sys (reverse (cons (list route element) (reverse (get-system-trash sys))))))

