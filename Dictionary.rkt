#lang scheme
(require scheme/gui)
; link required modules
(require "modules/Error.rkt") ; error Message Window


(define dict
'(
		(Hello Hallo)
                (Good_Day Servus)
                (Fun Gaudi)
                (Bratwurst Bratwurst)
                (Be_blessed Grüßdi)
                (Porkchop Schnitzel)
                (Krauts Deutsche)
                (Happy_Hour Freibier)
))

; ---------- Mathe ----------

(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))
      )
  )

(define (binco n k)
  (if (> n k) ; the procedure doesn't works if n < k
      (/ (fact n)
         (* (fact k) (fact (- n k))))
      (error-message "K is greater then n. \n You need to amke sure that the first number is greater then the second.")
   )

  )


(define (translate input-text)
  (send (send output-text-field get-editor) erase)  ; delete current text
  (send (send output-text-field get-editor) insert input-text) 
  )

; ========== GUI ==========



; ---- Main Interface >>>>>
(define main_frame (new frame% [label "Translaty"]
        [width 800]
        [height 400]
                         ))

; --- Main Panel ---
(define main_panel (new vertical-panel% [parent main_frame]
                              ))
; --- Translation Panel ---
(define main_panel_translation (new horizontal-panel% [parent main_panel]
                              ))

; --- Input/Output Panel ---
(define main_panel_io (new vertical-panel% [parent main_panel_translation]
                              	[horiz-margin 10]
                              ))

; Input
(define input-text-field (new text-field% [parent main_panel_io]
     [label "Input"]
     [callback (lambda (text-field-enter event) ; text-field-enter or text-field
                 (translate (send (send input-text-field get-editor) get-text) ))]
     ))

; Output
(define output-text-field (new text-field% [parent main_panel_io]
     [label "Output"]
     ))

; --- Language Selection Panel ---
(define main_panel_lang (new vertical-panel% [parent main_panel_translation]
                              	[horiz-margin 10]
                              ))

; Coices
(define/contract language_choices
    (listof label-string?)
    (list "Deutsch" "Englisch" "Französisch" "Spanisch"))

(new choice% [parent main_panel_lang]
     [label ""]
     [choices language_choices]
     )

(new choice% [parent main_panel_lang]
     [label ""]
     [choices language_choices]
     )

; <<<<< Main Interface -----

; ========== STARTUP ==========

(send main_frame show #t)