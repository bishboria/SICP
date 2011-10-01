(define (count-pairs x)
  (let ((tracked-pairs '()))
    (define (count-pairs-internal y)
      (if (or (not (pair? y)) (memq y tracked-pairs))
	0
	(begin
	  (set! tracked-pairs (cons y tracked-pairs))
	  (+ (count-pairs-internal (car y))
	     (count-pairs-internal (cdr y))
	     1))))
    (count-pairs-internal x)))

(define x (list 'a 'b 'c))
(count-pairs x) ; -> 3

(define second (cons 'a 'b))
(define third (cons 'c 'd))
(define first (cons second third))
(set-car! third second)
(count-pairs first) ; -> 3

(define third (cons 'a 'b))
(define second (cons third third))
(define first (cons second second))
(count-pairs first) ; -> 3

(define x (list 'a 'b 'c))
(set-cdr! (cddr x) x)
(count-pairs x) ; -> 3
