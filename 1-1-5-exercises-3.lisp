;; Exercise 1.3
(define (assert-equal expected actual)
  (if (equal? expected actual) 
    #t
    actual))

(define (larger x y)
  (if (> x y)
    x
    y))

(define (smaller x y)
  (if (< x y)
    x
    y))

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (largest-two-squared-and-summed a b c)
  (sum-of-squares (larger a b) (larger (smaller a b) c)))

(assert-equal 0 (largest-two-squared-and-summed 0 0 0))
(assert-equal 1 (largest-two-squared-and-summed 1 0 0))
(assert-equal 2 (largest-two-squared-and-summed 1 1 0))
(assert-equal 2 (largest-two-squared-and-summed 0 1 1))
(assert-equal 2 (largest-two-squared-and-summed 1 0 1))
