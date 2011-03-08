(define (assert-equal x y)
  (if (= x y)
    #t
    #f))

(assert-equal 10 10)
(assert-equal (+ 5 3 4) 12)
(assert-equal (- 9 1) 8)
(assert-equal (/ 6 2) 3)
