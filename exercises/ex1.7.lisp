(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess)
             x))
     0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; good-enough? is not good for small numbers as their sqrt is larger than they are.
;; results in a 25% error
(sqrt 0.002)
;; results in a 
(sqrt 1000000000001)

;; a better result may be achieved if the internals of good-enough? are replaced with a call to improve... maybe.
;; can stop when the difference between guesses is minimised.
(define (good-enough? guess x)
  (< (absolute-percent-difference guess
                                  (improve guess x))
     0.00001))

(define (absolute-percent-difference guess improved-guess)
  (abs (- 1
          (guess-ratio guess improved-guess))))

(define (guess-ratio guess improved-guess)
  (/ guess improved-guess))
;; this solution improves the answer for numbers < 1.0

(sqrt 0.002)
