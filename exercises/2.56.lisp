; Extend deriv to include exponentiation

(define (exponentiation? x)
  (and (pair? x)
       (eq? (car x) '**)))

(define base cadr)

(define exponent caddr)

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        ((=number? base 1) 1)
        ((=number? base 0) 0)
        (else (list '** base exponent))))

(define (difference d1 d2)
  (cond ((and (number? d1) (number? d2)) (- d1 d2))
        ((=number? d1 0) '(- 0 d2))
        ((=number? d2 0) d1)
        (else (list '- d1 d2))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
           (make-product
             (exponent exp)
             (make-exponentiation (base exp)
                                  (difference (exponent exp) 1)))
           (deriv (base exp) var)))
        (else
          (error "unknown expression type -- DERIV" exp))))
