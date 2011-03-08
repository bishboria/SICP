;; Exercise 1.3
(define (assert-equal expected actual)
  (if (equal? expected actual) 
    #t
    actual))

(define (largest-two-squared-and-summed a b c)
  (define (square x) (* x x))
  (if (>= a b)
       (+ (square a) (square b))
       (+ (square b) (square c))))

(assert-equal 0 (largest-two-squared-and-summed 0 0 0))
(assert-equal 1 (largest-two-squared-and-summed 1 0 0))
(assert-equal 2 (largest-two-squared-and-summed 1 1 0))
(assert-equal 2 (largest-two-squared-and-summed 0 1 1))
;;(assert-equal 5 (largest-two-squared-and-summed 2 0 1))
