;; Exercise 2.8

(define (sub-interval x y)
 (add-interval x
               (make-interval (- (upper-bound y))
                              (- (lower-bound y)))))
