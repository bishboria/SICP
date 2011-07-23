(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

;; horner's rule
;; a0 + a1x + a2x^2 + ... + anx^n
;; can be evaluated as (a1 + x(a2 + x(a3 + ... x(an-1 + x(an)...)

;; fill in the template to create a procedure for evaluating
;; poynomials using horner's rule with accumulate
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coefficient higher-terms)
                (+ this-coefficient
                   (* x higher-terms)))
              0
              coefficient-sequence))
(horner-eval 2 (list 1 3 0 5 0 1))
