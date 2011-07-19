;; use car and cdr to get 7 from each of the following

(define a '(1 3 (5 7) 9))
(define b '((7)))
(define c '(1 (2 (3 (4 (5 (6 7)))))))

(car (cdr (car (cdr (cdr a))))) ;; -> 7
(car (car b)) ;; -> 7
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c)))))))))))) ;; -> 7
