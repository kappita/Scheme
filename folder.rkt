#lang racket
(provide (all-defined-out))
(require "element.rkt")
(require "date.rkt")

; Dom: string, string, list, date-string, date-string 
; Rec: 
; Descripción
; Recursión: No aplica
(define (make-folder name author content creation-date modification-date size security shared-users encryption-fn decryption-fn password)
  (list 
    "folder"
    name
    author
    content
    creation-date
    modification-date
    size
    security
    shared-users
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
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-folder-size folder)
  (cadddr (cdddr folder)))

; Dom: folder
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-folder-security folder)
  (cadddr (cdddr (cdr folder))))

; Dom: folder
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-folder-shared-users folder)
  (cadddr (cdddr (cddr folder))))

; Dom: folder
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-folder-encryption-fn folder)
  (cadddr (cdddr (cdddr folder))))

; Dom: folder
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-folder-decryption-fn folder)
  (cadddr (cdddr (cdddr (cdr folder)))))

; Dom: folder
; Rec: 
; Descripción
; Recursión: No aplica
(define (get-folder-password folder)
  (cadddr (cdddr (cdddr (cddr folder)))))

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
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users folder)
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
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users folder)
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
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users folder)
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
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users folder)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

; Dom: folder
; Rec: folder
; Descripción: cambia la fecha de modi
; Recursión: No aplica
(define (set-folder-size folder new-size)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-date)
    new-size
    (get-folder-security folder)
    (get-folder-shared-users folder)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-folder-security folder new-security)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-date)
    (get-folder-size)
    new-security
    (get-folder-shared-users folder)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (set-folder-shared-users folder new-shared-users)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-date)
    (get-folder-size)
    (get-folder-security folder)
    new-shared-users
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
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users folder)
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
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users)
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
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-password folder)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    new-password))

; Dom: folder-contents x string
; Rec: element
; Descripción: Retorna un elemento de los contenidos de la carpeta según su nombre
; Recursión: natural
(define (get-content-element-by-name folder name)
  (if (null? folder)
    null
    (if (equal? name (get-folder-name (car folder)))
      (car folder)
      (get-content-element-by-name (cdr folder) name))))

; Dom: folder-contents x string x element
; Rec: folder-contents
; Descripción: Reemplaza o modifica un elemento del contenido de la carpeta según su nombre
; Recursión: No aplica
(define (set-folder-content-by-name folder-contents name element)
  (if (null? folder-contents)
    folder-contents
    (if (equal? name (get-element-name (car folder-contents)))
      (cons element (cdr folder-contents))
      (cons (car folder-contents) (set-folder-content-by-name (cdr folder-contents name element))))))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (add-element-to-folder folder element)
  (set-folder-content folder 
    (reverse (cons element (reverse (get-folder-content folder))))))

(define (del-element-from-folder folder name)
  (set-folder-content folder
    (filter (lambda (x) (not (has-name? name x))) (get-folder-content folder))))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define (add-to-route-folder folder route element)
  (if (null? route)
    (add-element-to-folder folder element)
    (set-folder-content-by-name folder (car route) (add-to-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) element))))

(define (del-from-route-folder folder route name)
  (if (null? route)
    (del-element-from-folder folder name)
    (set-folder-content-by-name folder (car route) (del-from-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) name))))

(define (get-from-route-folder folder route name)
  (if (null? route)
    (get-content-element-by-name (get-folder-content folder) name)
    (get-from-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) name))
  )
; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define folderlol
 (make-folder null ":3" null null null null null null null null null))

; Dom: 
; Rec: 
; Descripción
; Recursión: No aplica
(define folderlol2
  (set-folder-name folderlol ":3"))
 (get-folder-content folderlol)
