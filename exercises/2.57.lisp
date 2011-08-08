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

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (sum? x)
  (and (pair? x)
       (eq? (car x) '+)))

(define addend cadr)

(define (product? x)
  (and (pair? x)
       (eq? (car x) '*)))

(define multiplier cadr)

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

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

(define (augend sum)
  (apply-rest (caddr sum) (cdddr sum) make-sum))

(define (multiplicand mul)
  (apply-rest (caddr mul) (cdddr mul) make-product))

(define (apply-rest acc rest proc)
  (cond ((null? rest) acc)
        (else (apply-rest (proc acc (car rest)) (cdr rest) proc))))

(deriv '(* 3 x) 'x)
(deriv '(* 4 y) 'y)
(deriv '(+ (* 4 x) (** x (* 3 x))) 'x)
(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(+ x y (+ x y 2)) 'x)
(deriv '(+ (* a x x)
           (* b x)
           c)
       'x)
