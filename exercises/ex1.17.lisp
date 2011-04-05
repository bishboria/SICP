;; Ex 1.17 logarithmic mutliplier via doubling & halving

;; example given via addition
(define (* a b)
  (if (= b 0)
    0
    (+ a (* a (- b 1)))))

;; logarithmic version

(define (double a)
  (+ a a))

(equal? (double 0) 0)
(equal? (double 1) 2)

(define (half a)
  (/ a 2))

(equal? (half 0) 0)
(equal? (half 2) 1)

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (* a (half b))))
        (else (+ a (* a (- b 1))))))

(equal? (* 1 1) 1)
(equal? (* 2 1) 2)
(equal? (* 3 1) 3)
(equal? (* 2 2) 4)
(equal? (* 2 3) 6)
(equal? (* 2 4) 8)
