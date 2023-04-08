#lang racket
(provide (all-defined-out))
(require "folder.rkt")
(require "drive.rkt")


(define (get-drive-pos-cola drives letter acc)
  (if (null? drives)
    null
    (if (equal? letter (get-drive-letter (car drives)))
      acc
      (get-drive-pos-cola (cdr drives) letter (+ acc 1)))))

(define (get-drive-pos drives letter)
  (get-drive-pos-cola drives letter 0))


(define (add-drive-to-drives drives new-drive)
  (reverse (cons new-drive (reverse drives))))



(define (check-if-drive-exists drives letter)
  (if (null? drives)
    #f
    (if (equal? letter (car (car drives)))
      #t
      (check-if-drive-exists (cdr drives) letter))))

(define (set-drives-drive drives letter drive)
  (if (null? drives)
    drives
    (if (equal? letter (get-drive-letter (car drives)))
      (cons drive (cdr drives))
      (cons (car drives) (set-drives-drive (cdr drives letter drive))))))

(define (set-to-route-drives drives route element)
  (if (check-if-drive-exists drives (car route))
    (set-drives-drive drives (car route) (set-to-route-drive drive route element))
    drives
  ))

