(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(abs -4)

(define (abs-2 x)
  (cond ((< x 0) (- x))
        (else x)))

(define (abs-3 x)
  (if (< x 0)
    (- x)
    x))

(and (> x 5) (< x 10))

(define (>= x y)
  (or (> x y) (= x y)))

(define (>= x y)
  (not (< x y)))
