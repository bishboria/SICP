(define (count-pairs x)
  (if (not (pair? x))
    0
    (+ (count-pairs (car x))
       (count-pairs (cdr x))
       1)))

(define x (list 'a 'b 'c))
(count-pairs x) ; -> 3

(define second (cons 'a 'b))
(define third (cons 'c 'd))
(define first (cons second third))
(set-car! third second)
(count-pairs first) ; -> 4

(define third (cons 'a 'b))
(define second (cons third third))
(define first (cons second second))
(count-pairs first) ; -> 7

(define x (list 'a 'b 'c))
(set-cdr! (cddr x) x)
; (count-pairs x) never returns
