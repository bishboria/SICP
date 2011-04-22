;; Ex 1.36 Show the sequence of approximations using newline and display.
;; Calculate x -> log(1000)/log(x)
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display next)
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(fixed-point (lambda (y) (/ (log 1000) (log y)))
             1.1)
