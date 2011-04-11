(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(equal? (gcd 206 40) 2)
