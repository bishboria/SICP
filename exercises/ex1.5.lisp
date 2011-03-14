;; Exercise 1.5

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

;; In normal-order evaluation test proc is fully expanded before any
;; of the parameters are evaluated. Normal-order evaluation will produce
;; a result.
;;
;; Applicative-order evaluation evaluates (p) first, which causes an
;; infinite loop and doesn't produce a sensible value.
(test 0 (p))
