#lang scheme

(provide dict)

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

(define lang_input 0)
(define lang_output 1)

(define (lang_translate content)
  (list-ref content lang_output)
  )

(define (search s-word dictonary)
  (display dictonary)
  
  (if (pair? dictonary)
       (
        if (not (member s-word (car dictonary)))
           (
        (search s-word (cdr dictonary)))
           ; else
        (list-ref (car dictonary) 1)
        )
        (list '(("Word") ("not found")))
       )
  )