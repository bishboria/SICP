;; Exercise 1.1
(define (assert-equal x y)
  (if (equal? x y)
    #t
    y))

(assert-equal 10 10)
(assert-equal (+ 5 3 4) 12)
(assert-equal (- 9 1) 8)
(assert-equal (/ 6 2) 3)
(assert-equal 6 (+ (* 2 4)
                   (- 4 6)))

(define a 3)
(define b (+ a 1))

(assert-equal 19 (+ a
                    b
                    (* a b)))
(assert-equal #f (= a b))
(assert-equal 4 (if (and (> b a) (< b (* a b)))
                  b
                  a))
(assert-equal 16 (cond ((= a 4) 6)
                       ((= b 4) (+ 6 7 a))
                       (else 25)))
(assert-equal 6 (+ 2
                   (if (> b a)
                     b
                     a)))
(assert-equal 16 (* (cond ((> a b) a)
                          ((< a b) b)
                          (else -1))
                    (+ a 1)))

;; Exercise 1.2
(assert-equal (/ -37 150) (/ (+ 5
                                4
                                (- 2
                                   (- 3
                                      (+ 6
                                         (/ 4 5)))))
                             (* 3
                                (- 6 2)
                                (- 2 7))))
