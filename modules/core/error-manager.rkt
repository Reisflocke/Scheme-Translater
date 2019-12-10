#lang scheme
(require scheme/gui)

; module:
(provide error-message)

; ---------- ERROR ----------

(define (error-message text)
  (send error_msg set-label text)
  (send error_dialog show #t)
 )

; ---- Error Message >>>>>
(define error_dialog (new dialog% [label "Error"]
        [width 400]
        [height 130]
                         ))

(define error_msg (new message% [parent error_dialog]
        [label "Something bad happened!"]
        [vert-margin 15]
        [horiz-margin 10]
        [auto-resize #t]
                          ))

(new button% [parent error_dialog]
             [label "OK"]
             [vert-margin 10]
             ; Callback procedure for a button click:
             [callback (lambda (button event)
                         (send error_dialog show #f)
                         )])

; <<<<< Error Message -----