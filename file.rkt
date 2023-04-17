#lang racket
(provide (all-defined-out))
(require "date.rkt")

; Dom: name (string) x extensión (string) x content (string) x args (char) 
; Rec: file
; Descripción: Crea un archivo a partir de lo básico
; Recursión: No aplica
(define (file name ext content . args)
    (list "file"
      name
      ext
      content
      (get-date)
      (get-date)
      (map (lambda (x) (char-downcase x)) args)
      null
      null
      null))

; Dom: file
; Rec: string
; Descripción: Retorna el nombre de un archivo
; Recursión: No aplica
(define (get-file-name file)
  (cadr file))

; Dom: file
; Rec: string
; Descripción: retorna la extensión / tipo de un archivo
; Recursión: No aplica
(define (get-file-extension file)
  (caddr file))

; Dom: file
; Rec: string
; Descripción: Retorna el contenido de un archivo
; Recursión: No aplica
(define (get-file-content file)
  (cadddr file))

; Dom: file
; Rec: date-string
; Descripción: retorna la fecha de creación de un archivo
; Recursión: No aplica
(define (get-file-creation-date file)
  (cadddr (cdr file)))

; Dom: file
; Rec: date-string
; Descripción: Retorna la fecha de modificación de un archivo
; Recursión: No aplica
(define (get-file-modification-date file)
  (cadddr (cddr file)))

; Dom: file
; Rec: list (char)
; Descripción: Retorna los parámetros de seguridad de un archivo
; Recursión: No aplica
(define (get-file-security file)
  (cadddr (cdddr file)))


; Dom: file
; Rec: función
; Descripción: retorna la función de encriptación de un archivo
; Recursión: No aplica
(define (get-file-encryption file)
  (cadddr (cdddr (cdr file))))

; Dom: file
; Rec: función
; Descripción: Retorna la función de desencriptación de un archivo
; Recursión: No aplica
(define (get-file-decryption file)
  (cadddr (cdddr (cddr file))))

; Dom: file
; Rec: string
; Descripción: Retorna la contraseña de un archivo
; Recursión: No aplica
(define (get-file-password file)
  (cadddr (cdddr (cdddr file))))

; Dom: file x string
; Rec: file
; Descripción: cambia el nombre de un archivo
; Recursión: No aplica
(define (set-file-name file new-name)
  (file 
    new-name
    (get-file-extension file)
    (get-file-content file)
    (get-file-creation-date)
    (get-date)
    (get-file-security file)
    (get-file-encryption file)
    (get-file-decryption file)
    (get-file-password)))

; Dom: file x string
; Rec: file
; Descripción: Modifica la extensión/tipo de un archivo
; Recursión: No aplica
(define (set-file-extension file new-ext)
  (file
    (get-file-name file)
    new-ext
    (get-file-content file)
    (get-file-creation-date)
    (get-date)
    (get-file-security file)
    (get-file-encryption file)
    (get-file-decryption file)
    (get-file-password file)))

; Dom: file x string
; Rec: file 
; Descripción: modifica el contenido de un archivo
; Recursión: No aplica
(define (set-file-content file new-content)
  (file
    (get-file-name file)
    (get-file-extension file)
    new-content
    (get-file-creation-date)
    (get-date)
    (get-file-security file)
    (get-file-encryption file)
    (get-file-decryption file)
    (get-file-password) file))

; Dom: file x date-string
; Rec: file
; Descripción: modifica la fecha de creación de un archivo
; Recursión: No aplica
(define (set-file-creation-date file new-date)
  (file
    (get-file-name file)
    (get-file-extension file)
    (get-file-content file)
    new-date
    (get-date)
    (get-file-security file)
    (get-file-encryption file)
    (get-file-decryption file)
    (get-file-password file)))

; Dom: file x date-string
; Rec: file
; Descripción: Modifica la fecha de modificación de un archivo
; Recursión: No aplica
(define (set-file-modification-date file new-date)
  (file
    (get-file-name file)
    (get-file-extension file)
    (get-file-content file)
    (get-file-creation-date)
    new-date
    (get-file-security file)
    (get-file-encryption file)
    (get-file-decryption file)
    (get-file-password file)))

; Dom: file x list (char)
; Rec: file
; Descripción: modifica los atributos de seguridad de un archivo
; Recursión: No aplica
(define (set-file-security file new-security)
  (file
    (get-file-name file)
    (get-file-extension file)
    (get-file-content file)
    (get-file-creation-date)
    (get-date)
    new-security
    (get-file-encryption file)
    (get-file-decryption file)
    (get-file-password file)))

; Dom: file x función
; Rec: file
; Descripción: modifica la función de encriptación de un archivo
; Recursión: No aplica
(define (set-file-encryption file new-encrypt)
  (file
    (get-file-name file)
    (get-file-extension file)
    (get-file-content file)
    (get-file-creation-date)
    (get-date)
    (get-file-security file)
    new-encrypt
    (get-file-decryption file)
    (get-file-password file)))

; Dom: file x función
; Rec: file
; Descripción: modifica la función de desencriptación de un archivo
; Recursión: No aplica
(define (set-file-decryption file new-decrypt)
  (file
    (get-file-name file)
    (get-file-extension file)
    (get-file-content file)
    (get-file-creation-date)
    (get-date)
    (get-file-security file)
    (get-file-encryption file)
    new-decrypt
    (get-file-password file)))

; Dom: file x string
; Rec: file
; Descripción: modifica la contraseña de un archivo
; Recursión: No aplica
(define (set-file-password file new-password)
  (file
    (get-file-name file)
    (get-file-extension file)
    (get-file-content file)
    (get-file-creation-date)
    (get-date)
    (get-file-security file)
    (get-file-encryption file)
    (get-file-decryption file)
    new-password))