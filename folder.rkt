#lang racket
(provide (all-defined-out))
(require "element.rkt")


(define (make-folder type name author content creation-date modification-date size security shared-users encryption-fn decryption-fn password)
  (list 
    type
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


(define (get-folder-name folder)
  (cadr folder))

(define (get-folder-author folder)
  (caddr folder))

(define (get-folder-content folder)
  (cadddr folder))

(define (get-folder-creation-date folder)
  (cadddr (cdr(folder))))

(define (get-folder-modification-date folder)
  (cadddr (cddr(folder))))

(define (get-folder-size folder)
  (cadddr (cdddr (folder))))

(define (get-folder-security folder)
  (cadddr (cdddr (cdr (folder)))))

(define (get-folder-shared-users folder)
  (cadddr (cdddr (cddr (folder)))))

(define (get-folder-encryption-fn folder)
  (cadddr (cdddr (cdddr (folder)))))

(define (get-folder-decryption-fn folder)
  (cadddr (cdddr (cdddr (cdr (folder))))))

(define (get-folder-password folder)
  (cadddr (cdddr (cdddr (cddr (folder))))))

(define (set-folder-name folder new-name)
  (make-folder
    new-name
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date folder)
    (get-folder-modification-date folder)
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users folder)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))


;; Probably useless 
(define (set-folder-author folder new-author)
  (make-folder
    (get-folder-name folder)
    new-author
    (get-folder-content folder)
    (get-folder-creation-date folder)
    (get-folder-modification-date folder)
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users folder)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

(define (set-folder-content folder new-content)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    new-content
    (get-folder-creation-date folder)
    (get-folder-modification-date folder)
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users folder)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))



(define (set-folder-creation-date folder date)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    date
    (get-folder-modification-date folder)
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users folder)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

(define (set-folder-size folder new-size)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-folder-modification-date folder)
    new-size
    (get-folder-security folder)
    (get-folder-shared-users folder)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

(define (set-folder-security folder new-security)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-folder-modification-date folder)
    (get-folder-size)
    new-security
    (get-folder-shared-users folder)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

(define (set-folder-shared-users folder new-shared-users)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-folder-modification-date folder)
    (get-folder-size)
    (get-folder-security folder)
    new-shared-users
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

(define (set-folder-encryption-fn folder new-encryption-fn)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-folder-modification-date folder)
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users folder)
    new-encryption-fn
    (get-folder-decryption-fn folder)
    (get-folder-password folder)))

(define (set-folder-decryption-fn folder new-decryption-fn)
    (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-folder-modification-date folder)
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-shared-users)
    (get-folder-encryption-fn folder)
    new-decryption-fn
    (get-folder-password folder)))

(define (set-folder-password folder new-password)
  (make-folder
    (get-folder-name folder)
    (get-folder-author folder)
    (get-folder-content folder)
    (get-folder-creation-date)
    (get-folder-modification-date folder)
    (get-folder-size folder)
    (get-folder-security folder)
    (get-folder-password folder)
    (get-folder-encryption-fn folder)
    (get-folder-decryption-fn folder)
    new-password))

(define (get-content-element-by-name folder name)
  (if (null? folder)
    null
    (if (equal? name (get-folder-name (car folder)))
      (car folder)
      (get-content-element-by-name (cdr folder) name))))

(define (set-folder-content-by-name folder-contents name element)
  (if (null? folder-contents)
    folder-contents
    (if (equal? name (get-element-name (car folder-contents)))
      (cons element (cdr folder-contents))
      (cons (car folder-contents) (set-folder-content-by-name (cdr folder-contents name element))))))

(define (add-element-to-folder folder element)
  (set-folder-content folder 
    (reverse (cons element (reverse get-folder-content folder)))))


(define (add-to-route-folder folder route element)
  (if (null? route)
    (add-element-to-folder folder element)
    (set-folder-content-by-name folder (car route) (add-to-route-folder (get-content-element-by-name (get-folder-content folder) (car route)) (cdr route) element))))