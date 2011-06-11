(define (div-interval x y)
  (if (<= 0 (* (lower-bound y) (upper-bound y)))
    (error "division error" y)
    (mul-interval x
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y))))))
