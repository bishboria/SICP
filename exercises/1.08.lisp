(define (cube-iter guess x)
  (if (good-enough? guess x)
    guess
    (cube-iter (improve guess x)
               x)))

(define (improve guess x)
  (average guess
           (/ (+ (/ x (square guess))
                 (* 2 guess))
              3)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (cube guess)
             x))
     0.001))

(define (cube guess)
  (* guess guess guess))

(define (square guess)
  (* guess guess))

(define (cube-root x)
  (cube-iter 1.0 x))
;; x/y^2 + 2y  / 3
