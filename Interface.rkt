#lang scheme
(require scheme/gui)
; link required modules
(require "modules/core/error-manager.rkt") ; error Message Window
(require "modules/extended/extended-math.rkt")
; load required dictonary (dict)
(require "Dictonary.rkt")



(define (translate input-text)
  (send (send output-text-field get-editor) erase)  ; delete current text
  (send (send output-text-field get-editor) insert (translate-word input-text dict (send translate-choice get-selection))) 
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
    (list "Deutsch" "Englisch"))

(define translate-choice (new choice% [parent main_panel_lang]
     [label "Select the language to translate to:"]
     [style (list 'vertical-label)]
     [choices language_choices]
     [callback (lambda (choice event) ; update translation to new selected language
                 (translate (send (send input-text-field get-editor) get-text) ))]
     ))

; (new choice% [parent main_panel_lang]
;      [label ""]
;      [choices language_choices]
;      )


; !!! INFO !!! (WIP) --> will be removed as soon as the feature is added
(new message% [parent main_panel]
     [label "Can't translate sentences right know. You must enter a single word!"]
 )

; <<<<< Main Interface -----

; ========== STARTUP ==========

(send main_frame show #t)
