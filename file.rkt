#lang racket
(provide all-defined-out)
(require "date.rkt")


(define (make-file name author content creation-date modification-date size security shared-users encryption-fn decryption-fn password)
  (list 
    "file"
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



(define (get-file-name folder)
  (cadr folder))

(define (get-file-author folder)
  (caddr folder))

(define (get-file-content folder)
  (cadddr folder))

(define (get-file-creation-date folder)
  (cadddr (cdr folder)))

(define (get-file-modification-date folder)
  (cadddr (cddr folder)))

(define (get-file-size folder)
  (cadddr (cdddr folder)))

(define (get-file-security folder)
  (cadddr (cdddr (cdr folder))))

(define (get-file-shared-users folder)
  (cadddr (cdddr (cddr folder))))

(define (get-file-encryption-fn folder)
  (cadddr (cdddr (cdddr folder))))

(define (get-file-decryption-fn folder)
  (cadddr (cdddr (cdddr (cdr folder)))))

(define (get-file-password folder)
  (cadddr (cdddr (cdddr (cddr folder)))))

(define (set-file-name folder new-name)
  (make-file
    new-name
    (get-file-author folder)
    (get-file-content folder)
    (get-file-creation-date folder)
    (get-date)
    (get-file-size folder)
    (get-file-security folder)
    (get-file-shared-users folder)
    (get-file-encryption-fn folder)
    (get-file-decryption-fn folder)
    (get-file-password folder)))


;; Probably useless 
(define (set-file-author folder new-author)
  (make-file
    (get-file-name folder)
    new-author
    (get-file-content folder)
    (get-file-creation-date folder)
    (get-date)
    (get-file-size folder)
    (get-file-security folder)
    (get-file-shared-users folder)
    (get-file-encryption-fn folder)
    (get-file-decryption-fn folder)
    (get-file-password folder)))

(define (set-file-content folder new-content)
  (make-file
    (get-file-name folder)
    (get-file-author folder)
    new-content
    (get-file-creation-date folder)
    (get-date)
    (get-file-size folder)
    (get-file-security folder)
    (get-file-shared-users folder)
    (get-file-encryption-fn folder)
    (get-file-decryption-fn folder)
    (get-file-password folder)))



(define (set-file-creation-date folder date)
  (make-file
    (get-file-name folder)
    (get-file-author folder)
    (get-file-content folder)
    date
    (get-date)
    (get-file-size folder)
    (get-file-security folder)
    (get-file-shared-users folder)
    (get-file-encryption-fn folder)
    (get-file-decryption-fn folder)
    (get-file-password folder)))

(define (set-file-size folder new-size)
  (make-file
    (get-file-name folder)
    (get-file-author folder)
    (get-file-content folder)
    (get-file-creation-date)
    (get-date)
    new-size
    (get-file-security folder)
    (get-file-shared-users folder)
    (get-file-encryption-fn folder)
    (get-file-decryption-fn folder)
    (get-file-password folder)))

(define (set-file-security folder new-security)
  (make-file
    (get-file-name folder)
    (get-file-author folder)
    (get-file-content folder)
    (get-file-creation-date)
    (get-date)
    (get-file-size)
    new-security
    (get-file-shared-users folder)
    (get-file-encryption-fn folder)
    (get-file-decryption-fn folder)
    (get-file-password folder)))

(define (set-file-shared-users folder new-shared-users)
  (make-file
    (get-file-name folder)
    (get-file-author folder)
    (get-file-content folder)
    (get-file-creation-date)
    (get-date)
    (get-file-size)
    (get-file-security folder)
    new-shared-users
    (get-file-encryption-fn folder)
    (get-file-decryption-fn folder)
    (get-file-password folder)))

(define (set-file-encryption-fn folder new-encryption-fn)
  (make-file
    (get-file-name folder)
    (get-file-author folder)
    (get-file-content folder)
    (get-file-creation-date)
    (get-date)
    (get-file-size folder)
    (get-file-security folder)
    (get-file-shared-users folder)
    new-encryption-fn
    (get-file-decryption-fn folder)
    (get-file-password folder)))

(define (set-file-decryption-fn folder new-decryption-fn)
    (make-file
    (get-file-name folder)
    (get-file-author folder)
    (get-file-content folder)
    (get-file-creation-date)
    (get-date)
    (get-file-size folder)
    (get-file-security folder)
    (get-file-shared-users)
    (get-file-encryption-fn folder)
    new-decryption-fn
    (get-file-password folder)))

(define (set-file-password folder new-password)
  (make-file
    (get-file-name folder)
    (get-file-author folder)
    (get-file-content folder)
    (get-file-creation-date)
    (get-date)
    (get-file-size folder)
    (get-file-security folder)
    (get-file-password folder)
    (get-file-encryption-fn folder)
    (get-file-decryption-fn folder)
    new-password))

(define (file name ext content . args)
    )