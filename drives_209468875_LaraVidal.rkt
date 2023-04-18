#lang racket
(provide (all-defined-out))
(require "folder_209468875_LaraVidal.rkt")
(require "drive_209468875_LaraVidal.rkt")

; Dom: Drives x char
; Rec: drive
; Descripción: Obtiene el drive de la letra señalada
; Recursión: No aplica
(define (get-drive-by-letter drives letter)
  (if (equal? letter (get-drive-letter (car drives)))
    (car drives)
    (get-drive-by-letter (cdr drives) letter)))

; Dom: Drives x drive
; Rec: Drives
; Descripción: agrega un nuevo drive a los drives
; Recursión: No aplica
(define (add-drive-to-drives drives new-drive)
  (reverse (cons new-drive (reverse drives))))

; Dom: Drives x char
; Rec: Boolean
; Descripción: Comprueba si cierto drive existe
; Recursión: Natural
(define (check-if-drive-exists drives letter)
  (if (null? drives)
    #f
    (if (equal? letter (car (car drives)))
      #t
      (check-if-drive-exists (cdr drives) letter))))

; Dom: Drives x char x drive
; Rec: Drives 
; Descripción: Modifica el drive de la letra indicada
; Recursión: Natural
(define (set-drives-drive drives letter drive)
  (if (null? drives)
    drives
    (if (equal? letter (get-drive-letter (car drives)))
      (cons drive (cdr drives))
      (cons (car drives) (set-drives-drive (cdr drives) letter drive)))))

; Dom: Drives x path x element
; Rec: Drives
; Descripción: Agrega un elemento a la ruta señalada
; Recursión: No aplica
(define (add-to-route-drives drives route element)
  (if (check-if-drive-exists drives (car route))
    (set-drives-drive drives (car route) (add-to-route-drive (get-drive-by-letter drives (car route)) (cdr route) element))
    drives
  ))

; Dom: Drives x path x string
; Rec: Drives
; Descripción: Elimina un elemento con el nombre señalado en la ruta señalada
; Recursión: No aplica
(define (del-from-route-drives drives route name)
  (if (check-if-drive-exists drives (car route))
    (set-drives-drive drives (car route) (del-from-route-drive (get-drive-by-letter drives (car route)) (cdr route) name))
    drives))

; Dom: Drives x path x string
; Rec: Element
; Descripción: Obtiene un elemento del nombre señalado en la ruta señalada
; Recursión: No aplica
(define (get-from-route-drives drives route name)
  (if (check-if-drive-exists drives (car route))
    (get-from-route-drive (get-drive-by-letter drives (car route)) (cdr route) name)
    null))

; Dom: Drives x path x string x string x string
; Rec: Drives
; Descripción: Renombra un elemento del nombre señalada en la ruta señalada con el nombre señalado
; Recursión: No aplica
(define (ren-to-route-drives drives route filename new-name)
  (if (check-if-drive-exists drives (car route))
    (set-drives-drive drives (car route) (ren-to-route-drive (get-drive-by-letter drives (car route)) (cdr route) filename new-name))
    drives))

; Dom: Drives x path x string x función x función x string
; Rec: Drives
; Descripción: Encripta un elemento en los drives del nombre señalada en la ruta señalada con el nombre señalado
; Recursión: No aplica
(define (enc-to-route-drives drives route filename enc-fn dec-fn password)
  (if (check-if-drive-exists drives (car route))
    (set-drives-drive drives (car route) (enc-to-route-drive (get-drive-by-letter drives (car route)) (cdr route) filename enc-fn dec-fn password))
    null))

; Dom: Drives x path x string x string
; Rec: Drives
; Descripción: Desencripta un elemento del nombre señalada en la ruta señalada con el nombre señalado
; Recursión: No aplica
(define (dec-to-route-drives drives route filename password)
  (if (check-if-drive-exists drives (car route))
    (set-drives-drive drives (car route) (dec-to-route-drive (get-drive-by-letter drives (car route)) (cdr route) filename password))
    null))


; Dom: Drives x path x list (string)
; Rec: Drives
; Descripción:Display
; Recursión: No aplica
(define (show-from-route-drives drives route params)
  (if (check-if-drive-exists drives (car route))
    (show-from-route-drive (get-drive-by-letter drives (car route)) (cdr route) params)
    ""))

; Dom: Drives x path
; Rec: Boolean
; Descripción: Determina si una ruta existe o no
; Recursión: No aplica
(define (check-if-route-exists-drives drives route)
  (if (check-if-drive-exists drives (car route))
    (check-if-route-exists-drive (get-drive-by-letter drives (car route)) (cdr route))
    #f))

; Dom: folder x path x string x string
; Rec: string
; Descripción: Retorna un string con las ocurrencias de un string en otro
; Recursión: no aplica
(define (grep-from-route-drives drives route filename match)
  (if (check-if-drive-exists drives (car route))
    (grep-from-route-drive (get-drive-by-letter drives (car route)) (cdr route) filename match)
    ""))