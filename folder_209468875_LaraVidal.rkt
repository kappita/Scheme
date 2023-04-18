#lang racket
(provide (all-defined-out))
(require "date_209468875_LaraVidal.rkt")
(require "content_209468875_LaraVidal.rkt")
(require "element_209468875_LaraVidal.rkt")
; Dom: string, string, list, date-string, date-string 
; Rec: 
; Descripción
; Recursión: No aplica
(define (make-folder name author content creation-date modification-date encryption-fn decryption-fn password)
  (list 
    "folder"
    name
    author
    content
    creation-date
    modification-date
    encryption-fn
    decryption-fn
    password))


; Dom: folder
; Rec: string
; Descripción: Obtiene el nombre de una carpeta
; Recursión: No aplica
(define (get-folder-name folder)
  (cadr folder))

; Dom: folder 
; Rec: String
; Descripción: Obtiene el autor de una carpeta
; Recursión: No aplica
(define (get-folder-author folder)
  (caddr folder))

; Dom: folder
; Rec: list (element)
; Descripción: Obtiene los contenidos de una carpeta
; Recursión: No aplica
(define (get-folder-content folder)
  (cadddr folder))

; Dom: folder
; Rec: date-string
; Descripción: obtiene de creación de la carpeta
; Recursión: No aplica
(define (get-folder-creation-date folder)
  (cadddr (cdr folder)))

; Dom: folder
; Rec: date-string
; Descripción: obtiene la fecha de modificación de una carpeta
; Recursión: No aplica
(define (get-folder-modification-date folder)
  (cadddr (cddr folder)))


; Dom: folder
; Rec: Función
; Descripción: Devuelve la función de encriptación de una carpeta
; Recursión: No aplica
(define (get-folder-encryption-fn folder)
  (cadddr (cdddr folder)))

; Dom: folder
; Rec: Función
; Descripción: Devuelve la función de desencriptación de una carpeta
; Recursión: No aplica
(define (get-folder-decryption-fn folder)
  (cadddr (cdddr (cdr folder))))

; Dom: folder
; Rec: string
; Descripción: Devuelve la contraseña de una carpeta encriptada
; Recursión: No aplica
(define (get-folder-password folder)
  (cadddr (cdddr (cddr folder))))

; Dom: folder
; Rec: folder
; Descripción: Cambia el nombre de una carpeta
; Recursión: No aplica
(define (set-folder-name folder new-name)
  (make-folder
    new-name
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date folder)
    (get-date)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))



; Dom: folder
; Rec: folder
; Descripción: cambia el autor de una carpeta
; Recursión: No aplica
(define (set-folder-author folder new-author)
  (make-folder
    (get-folder-name folder)
    new-author
    (get-folder-content folder)
    (get-folder-creation-date folder)
    (get-date)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

; Dom: folder
; Rec: folder
; Descripción: cambia el contenido de una carpeta
; Recursión: No aplica
(define (set-folder-content folder new-content)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    new-content
    (get-folder-creation-date folder)
    (get-date)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))


; Dom: folder
; Rec: folder
; Descripción: Cambia la fecha de creación de una carpeta
; Recursión: No aplica
(define (set-folder-creation-date folder date)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    date
    (get-date)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

; Dom: folder
; Rec: folder
; Descripción: Cambia la fecha de modificación de una carpeta
; Recursión: No aplica
(define (set-folder-modification-date folder)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date folder)
    (get-date)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))


; Dom: folder x function
; Rec: folder
; Descripción: Cambia la función de encriptación de una carpeta
; Recursión: No aplica
(define (set-folder-encryption-fn folder new-encryption-fn)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-date)
    new-encryption-fn
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

; Dom: folder x function
; Rec: folder
; Descripción: cambia la función de desencriptación de una carpeta
; Recursión: No aplica
(define (set-folder-decryption-fn folder new-decryption-fn)
    (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-date)
    (get-folder-encryption-fn folder)
    new-decryption-fn
    (get-folder-password folder)))

; Dom: folder x string
; Rec: folder
; Descripción: cambia la contraseña de desencriptación de una carpeta
; Recursión: No aplica
(define (set-folder-password folder new-password)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-date)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    new-password))

; Dom: folder x path x element
; Rec: 
; Descripción:
; Recursión: Natural
(define (add-to-route-folder folder route element)
  (if (null? route)
    (set-folder-content folder (add-element-to-content (get-folder-content folder) element))
    (set-folder-content folder (set-content-by-name (get-folder-content folder) (car route) (add-to-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) element)))))

; Dom: folder x path x string
; Rec: folder
; Descripción: Elimina el elemento del nombre señalado en la ruta
; Recursión: natural
(define (del-from-route-folder folder route name)
  (if (null? route)
    (set-folder-content folder (del-element-from-content (get-folder-content folder) name))
    (set-folder-content folder (set-content-by-name (get-folder-content folder) (car route) (del-from-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) name)))))

; Dom: folder x path x string
; Rec: Element
; Descripción: Retorna un elemento del nombre indicado en la ruta indicada
; Recursión: Natural
(define (get-from-route-folder folder route name)
  (if (null? route)
    (get-content-element-by-name (get-folder-content folder) name)
    (get-from-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) name)))

; Dom: folder x path x string x string
; Rec: folder
; Descripción: Renombra un elemento de una carpeta en la ruta señalada con el nombre indicado
; Recursión: Natural
(define (ren-to-route-folder folder route filename new-name)
  (if (null? route)
    (set-folder-content folder (ren-element-from-content (get-folder-content folder) filename new-name))
    (set-folder-content folder (set-content-by-name (get-folder-content folder) (car route) (ren-to-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) filename new-name)))))

; Dom: folder x path x list (string)
; Rec: Display
; Descripción: Muestra los contenidos de la carpeta 
; Recursión: Natural
(define (show-from-route-folder folder route params)
  (if (null? route)
  (cond 
    [(member "/a" params) (show-content (get-all-names (get-folder-content folder)) "")]
    [(member "/?" params) "Comandos disponibles:\n /s enseña los subdirectorios (no implementado)\n /a enseña los archivos ocultos \n /o enseña en orden (no implementado) \n /? enseña los comandos disponibles\n"]
    [else (show-content (get-showable-names (get-folder-content folder)) "")])
  (show-from-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) params)
    ))

; Dom: folder x path x string x función x función x string
; Rec: folder
; Descripción: Encripta un elemento de una carpeta en la ruta señalada con el nombre indicado
; Recursión: Natural
(define (enc-to-route-folder folder route filename enc-fn dec-fn password)
  (if (null? route)
    (set-folder-content folder (enc-element-from-content (get-folder-content folder) filename enc-fn dec-fn password))
    (set-folder-content folder (set-content-by-name (get-folder-content folder) (car route) (enc-to-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) filename enc-fn dec-fn password)))))

; Dom: folder x path x string x string
; Rec: folder
; Descripción: Desencripta un elemento de una carpeta en la ruta señalada con el nombre indicado y su contraseña
; Recursión: Natural
(define (dec-to-route-folder folder route filename password)
  (if (null? route)
    (set-folder-content folder (dec-element-from-content (get-folder-content folder) filename password))
    (set-folder-content folder (set-content-by-name (get-folder-content folder) (car route) (dec-to-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) filename password)))))

; Dom: folder x path
; Rec: Boolean
; Descripción: Determina si una ruta existe o no
; Recursión: Natural
(define (check-if-route-exists-folder folder route)
  (if (null? route)
    #t
    (if (member (car route) (map (lambda (x) (get-element-name x)) (get-folder-content folder)))
      (if (equal? "folder" (get-element-type (get-content-element-by-name (get-folder-content folder) (car route))))
        (check-if-route-exists-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route))
        #f)
      #f)))

; Dom: folder x path x string x string
; Rec: string
; Descripción: Retorna un string con las ocurrencias de un string en otro
; Recursión: natural
(define (grep-from-route-folder folder route filename match)
  (if (null? route)
    (if (equal? "*.*" filename)
      (grep-content (get-folder-content folder) match "")
      (grep-element (get-content-element-by-name (get-folder-content folder) filename) match))
    (grep-from-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) filename match)))