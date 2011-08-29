(define (assert-equal x y)
  (if (equal? x y)
    #t
    y))

;; Exercise 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(assert-equal 2 (a-plus-abs-b 1 -1))
(assert-equal 2 (a-plus-abs-b 1 1))
