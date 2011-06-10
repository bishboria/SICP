;; Exercise 2.7

(define (make-interval a b)
  (cons a b))

(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))
