(define (assert-equal x y)
  (if (equal? x y)
    #t
    y))

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
