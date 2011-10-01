(define (last-pair x)
  (if (null? (cdr x))
    x
    (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (contains-cycle? x)
  (let ((tracked-pairs '()))
    (define (internal y)
      (cond ((null? y) false)
	    ((memq y tracked-pairs) true)
	    (else
	      (set! tracked-pairs (cons y tracked-pairs))
	      (internal (cdr y)))))
    (internal x)))

(define x (list 'a 'b))
(contains-cycle? x) ; #f

(define y (make-cycle (list 'a 'b)))
(contains-cycle? y) ; #t
