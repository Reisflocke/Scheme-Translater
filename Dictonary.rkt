#lang scheme

; list
(provide dict)
; function
(provide search)
(provide translate-word)

; ----- LIST -----

(define test
  '(
    ("A" "a")
    ("B" "b")
    ("C" "c")
    ("D" "d")
    ("E" "e")
    ))

(define dict
'(
		("Hallo" "Hello")
                ("Servus" "Good Day")
                ("Gaudi" "Fun")
                ("Bratwurst" "Sausage")
                ("Grüßdi" "Be blessed")
                ("Schnitzel" "Porkchop")
                ("Deutsche" "Krauts")
                ("Freibier" "Happy Hour")
))



; ----- FUNCTION -----

(define (search s-word dictonary)
  (filter (lambda (i) (member s-word i)) dictonary)
  )


(define (translate-word s-word dictonary lang)
  (if (null? (search s-word dictonary))
      "..."
  (get-word s-word dictonary lang)
  ))


(define (get-word s-word dictonary lang)
  (list-ref (car (search s-word dictonary) ) lang) ; first get the (list) out of ((list)) and then return the word in the language to translate to
 )