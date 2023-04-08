#lang racket
(provide (all-defined-out))
(require "system.rkt")
(require "drive.rkt")
(require "folder.rkt")
;;(require "file.rkt")

(define (get-folderPath sys path)
  (append (get-system-actual-route sys) (regexp-split "/" path))  
  )


;; Rec: list folder x file
(define (get-targetPath path)
    (cons (string-ref path 0) (cdr (regexp-split "/" path))))



(define S0
  (make-system "bruh" null null null null null null null))

(get-system-name S0)


(define S1
  (set-system-actual-route S0 '(#\C "gwagwa" "tequiero")))


(get-folderPath S1 "poto/peo")
(get-targetPath "C:/gwagwa/tequiero/batard")

(define (add-to-route-system sys route item)
  (set-system-drives sys ))