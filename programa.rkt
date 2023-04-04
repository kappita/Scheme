#lang racket
(require racket/date)


(define (date-string fecha)
  (format "~a-~a-~a ~a:~a:~a"
    (date-day fecha)
    (date-month fecha)
    (date-year fecha)
    (date-hour fecha)
    (date-minute fecha)
    (date-second fecha))
)

(define (get-date)
  (date-string (current-date)))

(define (make-system name users drives actual-user actual-drive actual-route creation-date modification-date)
  (list name users drives actual-user actual-drive actual-route creation-date modification-date))

(define (get-system-name sys)
  (car sys))

(define (get-system-users sys)
  (cadr sys))

(define (get-system-drives sys)
  (caddr sys))

(define (get-system-actual-user sys)
  (cadddr sys))

(define (get-system-actual-drive sys)
  (cadddr (cdr sys)))

(define (get-system-actual-route sys)
  (cadddr (cddr sys)))

(define (get-system-creation-date sys)
  (cadddr (cdddr sys)))

(define (get-system-modification-date sys)
  (cadddr (cdddr (cdr sys))))

(define (set-system-users sys users)
  (make-system
   (get-system-name sys)
   users
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-system-modification-date sys)))

(define (set-system-drives sys drives)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   drives
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-system-modification-date sys)))

(define (set-system-actual-user sys user)
  (make-system
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   user
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-system-modification-date sys)))

(define (set-system-actual-drive sys drive)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   drive
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-system-modification-date sys)))

(define (set-system-actual-route sys route)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   route
   (get-system-creation-date sys)
   (get-system-modification-date sys))
  )

;; Probably useless
(define (set-system-creation-date sys)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-date)
   (get-system-modification-date sys)))

(define (set-system-modification-date sys)
  (make-system 
   (get-system-name sys)
   (get-system-users sys)
   (get-system-drives sys)
   (get-system-actual-user sys)
   (get-system-actual-drive sys)
   (get-system-actual-route sys)
   (get-system-creation-date sys)
   (get-date)))
;; Terminar de crear los getters

(define (system name)
  (make-system name null null null null null (get-date) (get-date)))


(define (add-user-to-users user-list user)
  (reverse (cons user (reverse user-list))))
;;(define (register system name)

(define (register sys user)
  (if (member user (get-system-users sys)) sys 
      (set-system-modification-date
        (set-system-users
          sys
          (add-user-to-users
            (get-system-users sys)
            user)))))

(define (make-drive letter name capacity content)
  (list letter name capacity content))

(define (get-drive-letter drive)
  (car drive))

(define (get-drive-name drive)
  (cadr drive))

(define (get-drive-capacity drive)
  (caddr drive))

(define (get-drive-content drive)
  (cadddr drive))

(define (add-drive-to-drives drives new-drive)
  (reverse (cons new-drive (reverse drives))))

(define (check-if-drive-exists drives letter)
  (if (null? drives)
    #f
    (if (equal? letter (car (car drives)))
      #t
      (check-if-drive-exists (cdr drives) letter))))

(define (switch-drive sys letter)
  (if (null? (get-system-actual-user sys))
    sys
    (if (check-if-drive-exists (get-system-drives sys) letter)
      (set-system-actual-drive sys letter)
      sys)))

;;(define (get-drives-drive drives letter)
;;    (if (equal? (car drives) letter)))


(define (add-drive sys letter name capacity)
  (set-system-modification-date 
    (set-system-drives 
      sys 
      (add-drive-to-drives
        (get-system-drives sys)
        (make-drive letter name capacity null))) 
  ))



(define (login sys user)
  (if (member user (get-system-users sys))
    (set-system-actual-user sys user)
    (sys)))

(define (logout sys)
  (set-system-actual-user sys null))
;;(define (switch-drive ))

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




(define (get-route route)
  (regexp-split "/" route)
  )



(define S0 (system "newSystem"))
(get-system-actual-route S0)










(define S1
  (register S0 "juan"))

(define S2
  (register S1 "dross"))

(define S3
  (register S2 "COÑOOOOOOOOO"))

(define S4
  (register S3 "dross"))

(define S5
  (add-drive S4 "C" "Holi" 1000))

(define S6
  (add-drive S5 "D" "Hola" 10000))

(define S7
  (login S6 "dross"))

(define S8
  (switch-drive S7 "E"))

(define S9
  (switch-drive S8 "E"))

(define S10
  (logout S9))

(define S11
  (switch-drive S10 "C"))


(get-system-actual-drive S11)
(get-system-modification-date S11)

