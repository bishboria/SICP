(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multipicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multipicand exp))))
        ; more rules can be added here
        (else (error "Unknown expression type - DERIV" exp))))

; redefine as
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp) var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

; a. Because sum? and product? conditions are essentially doing dispatch
; based on the type of operation to be applied, we can use the same put/
; get data-directed approach as what we've seen during chapter 2.4 so far.
;
; We can't assimilate number? and same-variable? into the data-directed
; approach as they are not pairs. The data-directed approach relied on pairs.

; b.
(define (install-deriv-sum-package)
  (define (make-sum a1 a2) (cons a1 a2))
  (define (addend sum) (car sum))
  (define (augend sum) (cdr sum))
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))
  ;; interface to the rest of the system
  (define (tag x) (attach-tag '+ x))
  (put 'deriv '(+) deriv-sum)
  (put 'make-sum '+
       (lambda (a1 a2) (tag (make-sum a1 a2))))
  'done)
(define (make-sum a1 a2)
  ((get 'make-sum '+) a1 a2))

(define (install-deriv-product-package)
  (define (make-product m1 m2) (cons m1 m2))
  (define (multiplier prod) (car prod))
  (define (multipicand prod) (cdr prod))
  (define (deriv-prod exp var)
    (make-sum
      (make-product (multiplier exp)
                    (deriv (multipicand exp) var))
      (make-product (deriv (multiplier exp) var)
                    (multipicand exp))))
  ;; interface to the rest of the system
  (define (tag x) (attach-tag '* x))
  (put 'deriv '(*) deriv-prod)
  (put 'make-product '*
       (lambda (m1 m2) (tag (make-product m1 m2))))
  'done)
(define (make-product m1 m2)
  ((get 'make-product '*) m1 m2))

; c. Add exponentiation and difference to the data-directed system.
(define (install-deriv-difference-package)
  (define (make-diff d1 d2) (cons d1 d2))
  (define (minuend diff) (car diff))
  (define (subtrahend diff) (cdr diff))
  (define (deriv-diff exp var)
    (make-diff (deriv (minuend diff) var) (deriv (subtrahend diff) var)))
  ;; interface to the rest of the system
  (define (tag x) (attach-tag '- x))
  (put 'deriv '(-) deriv-diff)
  (put 'make-diff '-
       (lambda (d1 d2) (tag (make-diff d1 d2))))
  'done)
(define (make-diff d1 d2)
  ((get 'make-diff '-) d1 d2))

(define (install-deriv-exponentiation-package)
  (define (make-exponentiation base exponent) (cons base exponent))
  (define (base exponention) (car exponention))
  (define (exponent exponentiation) (cdr exponentiation))
  (define (deriv-exponentiation exp var)
    (make-product (make-product (exponent exp)
                                (make-exponentiation (base exp)
                                                     (difference (exponent exp) 1)))
                  (deriv (base exp) var)))
  ;; interface to the rest of the system
  (define (tag x) (attach-tag '** x))
  (put 'deriv '(**) deriv-exponentiation)
  (put 'make-exponentiation '**
       (lambda (base exponent) (tag (make-exponentiation base exponent))))
  'done)
(define (make-exponentiation base exponent)
  ((get 'make-exponentiation '**) base exponent))

; d. by changing (get 'deriv (operator exp)) to (get (operator exp) 'deriv)
; all we have to change is the one put operation in each install package.
