;; 1.2.6 Testing for Primality

;; Searching for divisors
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (1+ test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 2)
(prime? 3)
(prime? 4)
(prime? 5)

;; The Fermat test
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (-1+ exp) m))
                         m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (1+ (random (-1+ n)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (-1+ times)))
        (else false)))

(fast-prime? 11 3)
(fast-prime? 15 10)
(fast-prime? 101 5)
