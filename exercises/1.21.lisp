;; Use smallest-divisor procedure to find smallest divisor of 199, 1999, 19999

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
                  ((divides? test-divisor n) test-divisor)
                          (else (find-divisor n (1+ test-divisor)))))

(define (divides? a b)
    (= (remainder b a) 0))

(smallest-divisor 199) ;; 199
(smallest-divisor 1999) ;; 1999
(smallest-divisor 19999) ;; 7
