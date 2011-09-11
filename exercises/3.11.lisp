(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
	     balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  (else (error "Unknown request -- MAKE-ACCOUNT"
		       m)))))

(define acc (make-account 50))

; Environment structure
;
; --------------------------------------------------
; | make-account: -\            acc: -\
; |   /------------/                  |
; |   |                               |
; |   |                               |
; ----|->-----------------------------|----------->-
;     | |                             |           |
;     | |                             |     --------------------
;     | |                             |     | balance: 50      |<----\
;     | |                             |     | withdraw: ----------->OO-------> params: amount
;     | |                             | /-->|                  |               body: (if ...
;     | |                             | |   |                  |<----\
;     | |                             | |   | deposit: ------------>OO-------> params: amount
;     | |                             | |   --------------------               body: (set!...
;     >OO                             >OO
;      |                               |
;      >                               >
; params: balance                      params: m
; body: ((define (withdraw...          body: (cond m...
;        (define (deposit...
;        (define (dispatch...
;        dispatch)
;
((acc 'deposit) 40)
;
; ---------------------------------------------
; | make-account: ...
; | acc: ... --\
; -------------|-->---------------------------
;              |  |
; ------------->--|-                  --------------
; | balance: 50    |<-----------------| amount: 40 |
; | withdraw: ...  |                  |            |
; | deposit: ------------>OO--------->|            |
; ------------------      |           --------------
;                         |
;                         >
;                      params: amount
;                      body: (set!...
;
;
; ---------------------------------------------
; | make-account: ...
; | acc: ... --\
; -------------|-->---------------------------
;              |  |
; ------------->--|-                  --------------
; | balance: 90    |<-----------------| amount: 60 |
; | withdraw: ------------\           |            |
; |                |      >           |            |
; | deposit: ...   |      OO--------->|            |
; ------------------      |           --------------
;                         |
;                         >
;                      params: amount
;                      body: (if (...

; The local state for acc is kept in its own environment.
; When deposit or withdraw is called the resulting procedure
; also creates its own environment for the amount to be 
; altered by.

; Calling
(define acc2 (make-account 100))
; produces a new environment with the internal state of balance
; set to 100.

; The only parts of acc and acc2 environment structure that might
; be shared is the code definition. They do not share environments
; where internal state is stored.
