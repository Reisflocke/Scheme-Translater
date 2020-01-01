#lang scheme
(require scheme/gui)
; link required modules
(require "modules/core/error-manager.rkt") ; error Message Window
(require "modules/extended/extended-math.rkt")
; load required dictonary (dict)
(require "Dictonary.rkt")



(define (translate input-text)
  (send (send output-text-field get-editor) erase)  ; delete current text
  (send (send output-text-field get-editor) insert (search input-text dict)) 
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