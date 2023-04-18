#lang racket
(require racket/date)
(require "date_209468875_LaraVidal.rkt")
(require "drive_209468875_LaraVidal.rkt")
(require "drives_209468875_LaraVidal.rkt")
(require "system_209468875_LaraVidal.rkt")
(require "date_209468875_LaraVidal.rkt")
(require "folder_209468875_LaraVidal.rkt")
(require "users_209468875_LaraVidal.rkt")
(require "element_209468875_LaraVidal.rkt")
(require "path_209468875_LaraVidal.rkt")
(require "file_209468875_LaraVidal.rkt")
(require "content_209468875_LaraVidal.rkt")
(require "trash_209468875_LaraVidal.rkt")

; Dom: string
; Rec: system
; Descripción: Crea un sistema con el nombre indicado
; Recursión: No aplica
(define (system name)
  (make-system name null null null null null (get-date) (get-date) null))


; Dom: system x función
; Rec: system
; Descripción: Función para la currificación parcial de las funciones
; Recursión: No aplica
(define run (lambda (sys function)
  (curry function sys)))



; Dom: system x string
; Rec: system
; Descripción: registra un usuario en el sistema
; Recursión: No aplica
(define (register sys user)
  (if (member (string-downcase user) (get-system-users sys)) sys 
      (set-system-modification-date
        (set-system-users
          sys
          (add-user-to-users
            (get-system-users sys)
            (string-downcase user))))))


; Dom: system x char
; Rec: system
; Descripción: cambia el drive actual del sistema
; Recursión: No aplica
(define (switch-drive sys letter)
  (if (null? (get-system-actual-user sys))
    sys
    (if (check-if-drive-exists (get-system-drives sys) (char-downcase letter))
      (set-system-actual-route (set-system-actual-drive sys (char-downcase letter))  (list (char-downcase letter)))
      sys)))

; Dom: sys x char x string x int
; Rec: sys
; Descripción: agrega un drive al sistema
; Recursión: No aplica
(define (add-drive sys letter name capacity)
  (set-system-modification-date 
    (set-system-drives 
      sys 
      (add-drive-to-drives
        (get-system-drives sys)
        (make-drive (char-downcase letter) (string-downcase name) capacity null))) 
  ))

; Dom: sys x string
; Rec: sys
; Descripción: inicia sesión con un usuario
; Recursión: No aplica
(define (login sys user)
  (if (member (string-downcase user) (get-system-users sys))
    (set-system-actual-user sys (string-downcase user))
    (sys)))

; Dom: system
; Rec: system
; Descripción: cierra sesión del usuario actual
; Recursión: No aplica
(define (logout sys)
  (set-system-actual-user sys null))


; Dom: system x string
; Rec: system
; Descripción: crea una carpeta en la ruta actual del sistema
; Recursión: No aplica
(define (md sys name)
  (set-system-drives
    sys 
    (add-to-route-drives 
      (get-system-drives sys)
      (get-system-actual-route sys)
      (make-folder
        (string-downcase name)
        (get-system-actual-user sys)
        '()
        (get-date)
        (get-date)
        null
        null
        null))))

; Dom: system x string
; Rec: system
; Descripción: Cambia la ruta actual del sistema
; Recursión: No aplica
(define (cd sys path)
  (if (equal? path "/")
    (set-system-actual-route sys (list (get-system-actual-drive sys)))
    (if (equal? path "..")
      (if (null? (cdr (get-system-actual-route sys)))
        sys
        (set-system-actual-route sys (reverse (cdr (reverse (get-system-actual-route sys))))))

      (if (check-if-route-exists-drives (get-system-drives sys) (reverse (cons (string-downcase path) (reverse (get-system-actual-route sys)))))
        (set-system-actual-route sys (reverse (cons (string-downcase path) (reverse (get-system-actual-route sys)))))
        sys)
      )))


; Dom: system x file
; Rec: system
; Descripción: agrega un archivo en la ruta actual del sistema
; Recursión: No aplica
(define (add-file sys file)
  (set-system-drives 
    sys
    (add-to-route-drives
      (get-system-drives sys)
      (get-system-actual-route sys)
      file)))

; Dom: system x string
; Rec: system
; Descripción: Elimina un archivo del sistema
; Recursión: No aplica
(define (del sys filename)
  (set-system-drives
    (add-to-trash sys (get-from-route-drives (get-system-drives sys) (get-system-actual-route sys) (string-downcase filename)) (get-system-actual-route sys))
    (del-from-route-drives
      (get-system-drives sys)
      (get-system-actual-route sys)
      (string-downcase filename))))

; Dom: system x string
; Rec: system
; Descripción: Elimina una carpeta del sistema siempre que esté vacía
; Recursión: No aplica
(define (rd sys filename)
  (if (check-if-route-exists-drives (get-system-drives sys) (append (get-system-actual-route sys) (to-path (string-downcase filename))))
    (if (null? (get-element-content (get-from-route-drives (get-system-drives sys) (append (get-system-actual-route sys) (reverse (cdr (reverse (to-path (string-downcase filename)))))) (last (to-path (string-downcase filename))))))
      (set-system-drives sys (del-from-route-drives
        (get-system-drives sys)
        (append (get-system-actual-route sys) (reverse (cdr (reverse (to-path (string-downcase filename))))))
        (last (to-path (string-downcase filename)))))
      sys)
    sys))

; Dom: system x filename x route
; Rec: system
; Descripción: Copia un elemento a la ruta indicada
; Recursión: No aplica
(define (copy sys filename route)
  (set-system-drives 
    sys
    (add-to-route-drives
      (get-system-drives sys)
      (get-targetPath route)
      (get-from-route-drives (get-system-drives sys) (get-system-actual-route sys) (string-downcase filename)))))


; Dom: system x filename x route
; Rec: system
; Descripción: Mueve un archivo a la ruta indicada
; Recursión: No aplica
(define (move sys filename route)
  (set-system-drives 
    sys
    (del-from-route-drives
      (get-system-drives (copy sys filename route))
      (get-system-actual-route sys)
      (string-downcase filename))))

; Dom: system x filename x string
; Rec: system
; Descripción: Renombra un archivo 
; Recursión: No aplica
(define (ren sys filename new-name)
  (set-system-drives
    sys
    (ren-to-route-drives
      (get-system-drives sys)
      (get-system-actual-route sys)
      (string-downcase filename)
      new-name)))

; Dom: system x params
; Rec: string formateado
; Descripción: Retorna un string con los archivos presentes en la ruta actual
; Recursión: No aplica
(define (dir sys . params)
  (show-from-route-drives (get-system-drives sys) (get-system-actual-route sys) params))

; Dom: system x función x función x string x string
; Rec: system
; Descripción: Encripta un elemento en la ruta especificada
; Recursión: No aplica
(define (encrypt sys enc-fn dec-fn password filename)
  (set-system-drives
    sys
    (enc-to-route-drives
      (get-system-drives sys)
      (get-system-actual-route sys)
      (string-downcase filename)
      enc-fn
      dec-fn
      (string-downcase password))))

; Dom: system x string x string
; Rec: system
; Descripción: Desencripta un elemento en la ruta indicada
; Recursión: No aplica
(define (decrypt sys password filename)
  (set-system-drives
    sys
    (enc-to-route-drives
      (get-system-drives sys)
      (get-system-actual-route sys)
      (string-downcase filename)
      (string-downcase password))))

; Dom: string
; Rec: string
; Descripción: Corre todos los caracteres un valor a la derecha en tabla ascii
; Recursión: No aplica
(define (plus-one str)
  (list->string
   (map (lambda (c) (integer->char (add1 (char->integer c))))
        (string->list str))))

; Dom: string
; Rec: string
; Descripción: Corre todos los caracteres un valor a la izquierda en tabla ascii
; Recursión: No aplica
(define (minus-one str)
  (list->string
    (map (lambda (c) (integer->char (sub1 (char->integer c))))
      (string->list str))))

; Dom: system x string x string
; Rec: string formateado
; Descripción: Muestra las ocurrencias de una palabra en el contenido de un archivo
; Recursión: No aplica
(define (grep sys pattern filename)
  (grep-from-route-drives (get-system-drives sys) (get-system-actual-route sys) filename pattern))

; Dom: system
; Rec: string formateado
; Descripción: Muestra los contenidos de la papelera de reciclaje
; Recursión: No aplica
(define (view-trash sys)
  (show-trash-elements (get-system-trash sys) ""))



