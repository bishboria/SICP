;; Exercise 1.12 
;; Write a procedure that computes elements of Pascal's Triangle

(define (pascal row column)
  (cond ((= column 0) 1)
        ((>= column row) 1)
        (else (+ (pascal (-1+ row) (-1+ column))
                 (pascal (-1+ row) column)))))

(equal? (pascal 0 0) 1)
(equal? (pascal 1 0) 1)
(equal? (pascal 1 1) 1)
(equal? (pascal 2 1) 2)
(equal? (pascal 4 2) 6)
(equal? (pascal 4 3) 4)
