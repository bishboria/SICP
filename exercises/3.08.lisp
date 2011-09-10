; define f such that (+ (f 0) (f 1)) returns 0 if + eval'd L->R
; and returns 1 if + eval'd R->L

(define (initial-value-function)
  (let ((initial '()))
    (lambda (num)
      (if (null? initial)
	(begin
	  (set! initial num)
	  initial)
	initial))))

(define f (initial-value-function))
(f 0)
(f 1)

(define g (initial-value-function))
(g 1)
(g 0)
