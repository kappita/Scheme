#lang racket
(provide (all-defined-out))
(require "folder_209468875_LaraVidal.rkt")
(require "element_209468875_LaraVidal.rkt")
(require "content_209468875_LaraVidal.rkt")

; Dom: char x string x int x list (element)
; Rec: drive
; Descripción: Crea un drive con las caracterísitcas señaladas
; Recursión: No aplica
(define (make-drive letter name capacity content)
  (list letter name capacity content))

; Dom: Drive
; Rec: char
; Descripción: Obtiene la letra del drive
; Recursión: No aplica
(define (get-drive-letter drive)
  (car drive))

; Dom: Drive
; Rec: string
; Descripción: Obtiene el nombre del drive
; Recursión: No aplica
(define (get-drive-name drive)
  (cadr drive))

; Dom: Drive
; Rec: int
; Descripción: Obtiene la capacidad del drive
; Recursión: No aplica
(define (get-drive-capacity drive)
  (caddr drive))

; Dom: Drive
; Rec: content
; Descripción: Obtiene los contenidos del drive
; Recursión: No aplica
(define (get-drive-content drive)
  (cadddr drive))

; Dom: Drive x char
; Rec: Drive
; Descripción: Modifica la letra del drive
; Recursión: No aplica
(define (set-drive-letter drive letter)
  (make-drive 
    letter
    (get-drive-name drive)
    (get-drive-capacity drive)
    (get-drive-content drive)))

; Dom: Drive x string
; Rec: Drive
; Descripción: Modifica el nombre del drive
; Recursión: No aplica
(define (set-drive-name drive name)
  (make-drive 
    (get-drive-letter drive)
    name
    (get-drive-capacity drive)
    (get-drive-content drive)))

; Dom: Drive
; Rec: Drive x int
; Descripción: Modifica la capacidad del drive
; Recursión: No aplica
(define (set-drive-capacity drive capacity)
  (make-drive 
    (get-drive-letter drive)
    (get-drive-name drive)
    capacity
    (get-drive-content drive)))

; Dom: Drive x content
; Rec: Drive
; Descripción: Modifica el contenido del drive
; Recursión: No aplica
(define (set-drive-content drive content)
  (make-drive 
    (get-drive-letter drive)
    (get-drive-name drive)
    (get-drive-capacity drive)
    content))


; Dom: Drive x path x element
; Rec: Drive
; Descripción: Agrega un elemento en la ruta especificada
; Recursión: No aplica
(define (add-to-route-drive drive route element)
  (if (null? route)
    (set-drive-content drive (add-element-to-content (get-drive-content drive) element))
    (set-drive-content drive (set-content-by-name (get-drive-content drive) (car route) (add-to-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) element)))))

; Dom: Drive x path x string
; Rec: Drive
; Descripción: Elimina un elemento del nombre especificado en la ruta indicada
; Recursión: No aplica
(define (del-from-route-drive drive route name)
  (if (null? route)
    (set-drive-content drive (del-element-from-content (get-drive-content drive) name))
    (set-drive-content drive (set-content-by-name (get-drive-content drive) (car route) (del-from-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) name)))))

; Dom: Drive x path x string
; Rec: Element
; Descripción: Obtiene el elemento del nombre indicado en la ruta especificada
; Recursión: No aplica
(define (get-from-route-drive drive route name)
  (if (null? route)
    (get-content-element-by-name (get-drive-content drive) name)
    (get-from-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) name)))

; Dom: Drive x path x string x string
; Rec: Drive
; Descripción: Renombra el elemento del nombre especificado con el nombre indicado en la ruta señalada
; Recursión: No aplica
(define (ren-to-route-drive drive route filename new-name)
  (if (null? route)
    (set-drive-content drive (ren-element-from-content (get-drive-content drive) filename new-name))
    (set-drive-content drive (set-content-by-name (get-drive-content drive) (car route) (ren-to-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) filename new-name)))))


; Dom: drive x path x string x función x función x string
; Rec: drive
; Descripción: Encripta un elemento de un drive en la ruta señalada con el nombre indicado
; Recursión: Natural
(define (enc-to-route-drive drive route filename enc-fn dec-fn password)
  (if (null? route)
    (set-drive-content drive (enc-element-from-content (get-drive-content drive) filename enc-fn dec-fn password))
    (set-drive-content drive (set-content-by-name (get-drive-content drive) (car route) (enc-to-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) filename enc-fn dec-fn password)))))

; Dom: drive x path x string x string
; Rec: drive
; Descripción: Desencripta un elemento de un drive en la ruta señalada con el nombre indicado
; Recursión: Natural
(define (dec-to-route-drive drive route filename password)
  (if (null? route)
    (set-drive-content drive (dec-element-from-content (get-drive-content drive) filename password))
    (set-drive-content drive (set-content-by-name (get-drive-content drive) (car route) (dec-to-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) filename password)))))

; Dom: Drive x path x list (string)
; Rec: Display
; Descripción: Muestra los contenidos de la ruta señalada
; Recursión: No aplica
(define (show-from-route-drive drive route params)
  (if (null? route)
  (cond 
    [(member "/a" params) (show-content (get-all-names (get-drive-content drive)) "")]
    [(member "/?" params) "Comandos disponibles:\n /s enseña los subdirectorios (no implementado)\n /a enseña los archivos ocultos \n /o enseña en orden (no implementado) \n /? enseña los comandos disponibles\n"]
    [else (show-content (get-showable-names (get-drive-content drive)) "")])
  (show-from-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) params)
    ))

; Dom: drive x path
; Rec: Boolean
; Descripción: Confirma que una ruta exista
; Recursión: No aplica
(define (check-if-route-exists-drive drive route)
  (if (null? route)
    #t
    (if (member (car route) (map (lambda (x) (get-element-name x)) (get-drive-content drive)))
      (if (equal? "folder" (get-element-type (get-content-element-by-name (get-drive-content drive) (car route))))
        (check-if-route-exists-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route))
        #f)
      #f)))

; Dom: drive x path x string x string
; Rec: string
; Descripción: Retorna un string con las ocurrencias de un string en otro
; Recursión: no aplica
(define (grep-from-route-drive drive route filename match)
  (if (null? route)
    (if (equal? "*.*" filename)
      (grep-content (get-drive-content drive) match "")
      (grep-element (get-content-element-by-name (get-drive-content drive) filename) match))
    (grep-from-route-folder (get-content-element-by-name (get-drive-content drive) (car route)) (cdr route) filename match)))
