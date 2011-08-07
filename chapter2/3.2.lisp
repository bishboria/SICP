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
        (else
          (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (make-sum a1 a2)
  (list '+ a1 a2))

(define (make-product m1 m2)
  (list '* m1 m2))

(define (sum? x)
  (and (pair? x)
       (eq? (car x) '+)))

(define addend cadr)

(define augend caddr)

(define (product? x)
  (and (pair? x)
       (eq? (car x) '*)))

(define multiplier cadr)

(define multiplicand caddr)

(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(+ (+ (* a
                 (* x x))
              (* b x))
           c) 'x)
