(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

;; Defining sqrt-iter with new-if fails as new-if is a function and has its parameters applied in applicative order.
;; and that involves a recursive call. Hence, the special form "if" is needed.
