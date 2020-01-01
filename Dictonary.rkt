#lang scheme

; list
(provide dict)
; function
(provide search)


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
		("Hello" "Hallo")
                ("Good_Day" "Servus")
                ("Fun" "Gaudi")
                ("Bratwurst" "Bratwurst")
                ("Be_blessed" "Grüßdi")
                ("Porkchop" "Schnitzel")
                ("Krauts" "Deutsche")
                ("Happy_Hour" "Freibier")
))



; ----- FUNCTION -----

(define (search s-word dictonary)
  (filter (lambda (i) (member s-word i)) dictonary)
  )