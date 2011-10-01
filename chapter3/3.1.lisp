(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))

; z1 and z2 are not the same thing as (car z1) points to the *same* list as (cdr z1)
; (car z2) and (cdr z2) have *different* lists, but point to the same symbols 'a and 'b

(define (set-to-wow! x)
  (set-car! (car x) 'wow)
  x)
z1
(set-to-wow! z1)
z2
(set-to-wow! z2)

; use eq? to detect sharing in list structures
(eq? (car z1) (cdr z1))
(eq? (car z2) (cdr z2))
