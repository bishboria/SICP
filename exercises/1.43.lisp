;; Exercise 1.43 repeated procedure

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (< n 1)
    (lambda (x) x)
    (compose f (repeated f (-1+ n)))))
