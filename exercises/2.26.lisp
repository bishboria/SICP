(define x (list 1 2 3))
(define y (list 4 5 6))

;; What is the expected output when evaluating the following?

(append x y) ;; -> (1 2 3 4 5 6)
(cons x y) ;; -> ((1 2 3) 4 5 6)
(list x y) ;; -> ((1 2 3) (4 5 6))
