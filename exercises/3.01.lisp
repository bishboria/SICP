; define a procedure make-accumulator that stores the sum of the input values.
(define (make-accumulator initial)
  (lambda (value)
    (set! initial (+ initial value))
    initial))

(define A (make-accumulator 5))
(A 10)
(A 10)
