(define (make-withdraw initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))))

; Which is equivalent to

(define (make-withdraw initial-amount)
  ((lambda (balance)
     (lambda (amount)
       (if (>= balance amount)
	 (begin (set! balance (- balance amount))
		balance)
	 "Insufficient funds")))
   initial-amount))

; Environment model
;
; global env
; ----------------------------------------------------------------------------------------------------
; |   make-withdraw: -\                                                                              |
; |   /---------------/                                                                              |
; |   |                       (make-withdraw 100): -\                                                |
; |   |                       /---------------------/                                                |
; |   |                       |                                    W1: --\                           |
; ----|--->-------------------|------------------------------->----------|----------------------->----
;     |   |                   |       ---------------------   |          |       --------------  |
;     \->OO                   \->OO-->|initial-amount: 100|---/     / -> -->OO-->|balance: 100|--/
;        |                       |    ---------------------         |       |    --------------
;        >                       >                                          >
; params: initial-amount       params: balance                      |    params: amount
; body: ((l (balance)          body: (l (amount)  -- -- -- -- -- -- /    body: (if (> ...
; 	  (l (amount)                  ...)
; 	    ...))
;         initial-amount)                           
;
; This is different from earlier examples because the (let ((... creates an extra environment
; that is then discarded once (make-withdraw 100) is done. W1 is associated with the result of
; this.
