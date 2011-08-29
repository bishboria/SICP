;; Exercise 1.44 Smoothing function

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (< n 1)
    (lambda (x) x)
    (compose f (repeated f (-1+ n)))))

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (n-folded-smooth f n)
  ((repeated smooth n) f))
