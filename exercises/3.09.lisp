(define (factorial n)
  (if (= n 1)
    1
    (* n (factorial (- n 1)))))

; Environment model
;
; ---------------
; | factorial:  |
; |  |          |
; ---|-->--------
;    |  |
;    > OO
;      |
;      >
; params: n
; body: ...
;
; -------------------------------------------------------------------------
; | global env                                                            |
; |                                                                       |
; --------->----------->----------->----------->----------->----------->---
; (f 6)    |           |           |           |           |           |                     
;          |           |           |           |           |           |
; E1 -> n: 6  E2 -> n: 5  E3 -> n: 4  E4 -> n: 3  E5 -> n: 2  E6 -> n: 1


(define (factorial n)
  (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
  (if (> counter max-count)
    product
    (fact-iter (* counter product)
	       (+ counter 1)
	       max-count)))

; Environment model
;
; -------------------------------------
; | fact-iter: -----------------|     |
; |                             |     |
; | factorial:                  |     |
; |  |                          |     |
; ---|-->-----------------------|-->---
;    |  |                       |  |
;    > OO                       > OO
;      |                          |
;      >                          >
; params: n                   params: product, counter, max-count
; body: call to fact-iter     body: ...
;
; -------------------------------------------------------------------------------------------
; | global env           					                            |
; |                      					                            |
; --------->----------------->------------------->------------------->------------------->---
; (f 6)    |                 |                   |                   |                   |
;          |                 |                   |                   |                   |
; E1 -> n: 6  E2 -> product: 1    E3 -> product: 1    E4 -> product: 2    E5 -> product: 6    
; 		    counter: 1          counter: 2          counter: 3          counter: 4    
; 		    max-count: 6        max-count: 6        max-count: 6        max-count: 6  
;
; E6 -> product: 24   E7 -> product: 120  E8 -> product: 720
;       counter: 5          counter: 6          counter: 7
;       max-count: 6        max-count: 6        max-count: 6
