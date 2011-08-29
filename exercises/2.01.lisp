;; Define a better version of make-rat that handles both positive and negative arguments

(define (numer x)
    (car x))

(define (denom x)
    (cdr x))

(define (make-rat n d)
  (define g ((if (< d 0) - +) (gcd n d)))
  (cons (/ n g) (/ d g)))

(equal? (numer (make-rat 1 1)) 1)
(equal? (denom (make-rat 1 1)) 1)
(equal? (numer (make-rat -1 1)) -1)
(equal? (denom (make-rat -1 1)) 1)
(equal? (numer (make-rat 1 -1)) -1)
(equal? (denom (make-rat 1 -1)) 1)
(equal? (numer (make-rat -1 -1)) 1)
(equal? (denom (make-rat -1 -1)) 1)
