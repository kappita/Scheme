#lang racket


(define lst '("apple" "banana" "apricot" "avocado"))

(define (filter-by-prefix str lst)
  (define pattern (string-append "^" str))
  (filter
   (lambda (elem)
     (regexp-match pattern elem))
   lst))

(define filtered-list (filter-by-prefix "ba" lst))

(display filtered-list) ; prints '("apple" "apricot")'
