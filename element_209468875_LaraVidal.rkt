#lang racket
(provide (all-defined-out))
(require "date_209468875_LaraVidal.rkt")

; Dom: Elemento
; Rec: string "file" or "folder"
; Descripción: Obtiene si el elemento es un archivo o una carpeta
; Recursión: No aplica
(define (get-element-type element)
  (car element))

; Dom: Element
; Rec: string
; Descripción: Obtiene el nombre de un elemento
; Recursión: No aplica
(define (get-element-name element)
  (cadr element))

; Dom: Element
; Rec: String or list ( elementos )
; Descripción: Obtiene los contenidos de un elemento
; Recursión: No aplica
(define (get-element-content element)
  (cadddr element))

; Dom: element
; Rec: date-string
; Descripción: obtiene la fecha de creación de un elemento
; Recursión: No aplica
(define (get-element-creation-date element)
    (cadddr (cdr element)))

; Dom: element
; Rec: date-string
; Descripción: obtiene la fecha de modificación de un elemento
; Recursión: No aplica
(define (get-element-modification-date element)
    (cadddr (cdr element)))

; Dom: element
; Rec: list (char)
; Descripción: obtiene los atributos de seguridad de un elemento
; Recursión: No aplica
(define (get-element-security element)
  (cadddr (cdddr element)))

; Dom: element
; Rec: string
; Descripción: retorna la contraseña de un elemento
; Recursión: No aplica
(define (get-element-password element)
  (last element))

; Dom: element
; Rec: function
; Descripción: retorna la función de desencriptación de un elemento
; Recursión: No aplica
(define (get-element-decryption element)
  (cadr (reverse element)))

; Dom: element x string
; Rec: element
; Descripción: modifica el nombre de un elemento
; Recursión: No aplica
(define (set-element-name element new-name)
  (cons (car element) (cons new-name (cddr element))))


; Dom: element
; Rec: element
; Descripción: modifica la fecha de modificación de un elemento
; Recursión: No aplica
; Nota: la función requiere estar hecha de esta manera para evitar error de importación cíclica
(define (set-element-modification-date element)
  (if (equal? (car element) "file")
    (reverse (cons (car (reverse element)) (cons (cadr (reverse element)) (cons (caddr (reverse element)) (cons (cadddr (reverse element)) (cons (get-date) (cddr (cdddr (reverse element)))))))))
    (reverse (cons (car (reverse element)) (cons (cadr (reverse element)) (cons (caddr (reverse element)) (cons (get-date) (cdr (cdddr (reverse element))))))))))

; Dom: element x función x función x string
; Rec: element
; Descripción: Retorna un elemento con su nombre y sus contenidos encriptados, y guardando su función de desencriptación y contraseña
; Recursión: arbórea
; Nota: la función requiere estar hecha de esta manera para evitar error de importación cíclica
(define (encrypt-element element encryption-fn decryption-fn password)
  (if (equal? "file" (get-element-type element))
    (cons (car element) (cons (encryption-fn (cadr element)) (cons (caddr element) (cons (encryption-fn (cadddr element)) (cons (cadddr (cdr element)) (cons (get-date) (cons (cadddr (cdddr element)) (cons encryption-fn (cons decryption-fn (cons password null))))))))))
    (cons (car element) (cons (encryption-fn (cadr element)) (cons (caddr element) (cons (map (lambda (x) (encrypt-element x encryption-fn decryption-fn password)) (cadddr element)) (cons (cadddr (cdr element)) (cons (get-date) (cons encryption-fn (cons decryption-fn (cons password null)))))))))))
    
; Dom: element
; Rec: element
; Descripción: Desencripta el nombre y los contenidos de un elemento si 
; Recursión: arbórea
; Nota: la función requiere estar hecha de esta manera para evitar error de importación cíclica
(define (decrypt-element element password)
  (if (equal? password (get-element-password element))
    (if (equal? "file" (get-element-type element))
    (cons (car element) (cons ((get-element-decryption element) (cadr element)) (cons (caddr element) (cons ((get-element-decryption element) (cadddr element)) (cons (cadddr (cdr element)) (cons (get-date) (cons (cadddr (cdddr element)) (cons null (cons null (cons null null))))))))))
    (cons (car element) (cons ((get-element-decryption element) (cadr element)) (cons (caddr element) (cons (map (lambda (x) (decrypt-element x password)) (cadddr element)) (cons (cadddr (cdr element)) (cons (get-date) (cons null (cons null (cons null null))))))))))
    element))

; Dom: par
; Rec: string
; Descripción: Transforma un par a string
; Recursión: no aplica
(define (pairs-to-string pairs)
  (string-append
   "("
   (string-join (map (lambda (pair) (string-append (number->string (car pair)) " " (number->string (cdr pair)))) pairs) " ")
   ")"))

; Dom: element x string
; Rec: string
; Descripción: Retorna las ocurrencias de un string en otro
; Recursión: No aplica
(define (grep-element element match)
  (if (equal? "file" (get-element-type element))
    (string-append (get-element-name element) (string-append ":\n" (string-append (pairs-to-string (regexp-match-positions (regexp match) (get-element-content element))) "\n")))
    ""))

; Dom: elemento x string
; Rec: boolean
; Descripción: Determina si un elemento tiene el nombre indicado
; Recursión: No aplica
(define (has-name? name element)
  (equal? name (get-element-name element)))


; Dom: elemento
; Rec: Boolean
; Descripción: Determina si un elemento es mostrable en consola o no
; Recursión: No aplica
(define (is-showable? element)
  (if (equal? "folder" (get-element-type element))
    #t
    (if (member #\h (get-element-security element))
      #f
      #t)))
