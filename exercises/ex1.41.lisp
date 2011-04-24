;; Define a procedure double that takes a procedure as an argument and returns a procedure that applies
;; the original procedure twice

(define (double f)
  (lambda (x)
    (f (f x))))

((double 1+) 5)

(define (2+ x)
  ((double 1+) x))

(2+ 5)

(((double (double double)) 1+) 5)

((double (double (double 1+))) 5)
