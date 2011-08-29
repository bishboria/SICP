;; Ex 1.16 Iterative Logarthmic Exponentiation

(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b n intermediate)
  (cond ((= n 0) intermediate)
        ((even? n) (expt-iter (square b) (/ n 2) intermediate))
        (else (expt-iter b (- n 1) (* intermediate b)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(equal? (expt 2 0) 1)
(equal? (expt 2 1) 2)
(equal? (expt 2 2) 4)
(equal? (expt 2 3) 8)
(equal? (expt 3 3) 27)
(equal? (expt 2 11) 2048)
