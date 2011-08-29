;; Ex 1.20 Use substitute method, but with normal order evaluation, for gcd(206, 40)

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(gcd 206 40) ;; becomes...
(if (= 40 0)
  206
  (gcd 40 (remainder 206 40)))

(gcd 40 (remainder 206 40)) ;; becomes...
(if (= (remainder 206 40) 0) ;; eval remainder
  40
  (gcd (remainder 206 40)
       (remainder 40 (remainder 206 40))))

(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40))) ;; becomes...
(if (= (remainder 40 (remainder 206 40)) 0) ;; -> eval remainder 2x
  (remainder 206 40)
  (gcd (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) ;; becomes...
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ;; -> eval remainder 4x
  (remainder 40 (remainder 206 40))
  (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
       (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) ;; becomes...
(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) ;; -> eval remainder 7x. remainder is 0
  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
  (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
       (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ;; -> eval remainder 4x

;; remainder is evaluated 18x using normal order evaluation


;; Now using applicative order evaluation
(gcd 206 40) ;; becomes...
(if (= 40 0)
  206
  (gcd 40 (remainder 206 40)))

(gcd 40 (remainder 206 40)) ;; eval remainder
(gcd 40 6) ;; becomes...
(if (= 6 0)
  40
  (gcd 6 (remainder 40 6)))

(gcd 6 (remainder 40 6)) ;; eval remainder
(gcd 6 4) ;; becomes...
(if (= 4 0)
  6
  (gcd 4 (remainder 6 4)))

(gcd 4 (remainder 6 4)) ;; eval remainder
(gcd 4 2) ;; becomes
(if (= 2 0)
  4
  (gcd 2 (remainder 4 2)))

(gcd 2 (remainder 4 2)) ;; eval remainder
(gcd 2 0) ;; becomes...
(if (= 0 0)
  2
  (gcd 0 (remainder 2 0)))

;; remainder is evaluated 4x using applicative order evaluation.
