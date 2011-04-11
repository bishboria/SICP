;; Ex 1.18 Logarithmic multiplier iterative

(define (double a)
    (+ a a))

(equal? (double 0) 0)
(equal? (double 1) 2)

(define (half a)
    (/ a 2))

(equal? (half 0) 0)
(equal? (half 2) 1)

(define (* a b)
  (*-iter a b 0))

(define (*-iter a b intermediate)
  (cond ((= b 0) intermediate)
        ((even? b) (*-iter (double a) (half b) intermediate))
        (else (*-iter a (- b 1) (+ a intermediate)))))

(equal? (* 1 1) 1)
(equal? (* 2 1) 2)
(equal? (* 3 1) 3)
(equal? (* 2 2) 4)
(equal? (* 2 3) 6)
(equal? (* 2 4) 8)
