;; 1.2.4 Exponentiation

;; Linear recursive
(define (expt b n)
  (if (= n 0)
    1
    (* b (expt b (- n 1)))))

(expt 4 2)
(expt 5 7)

;; Linear iterative
(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b
               (- counter 1)
               (* b product))))

(expt 13 1000)

;; Logarithmic exponentiation
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(fast-expt 13 2000)
