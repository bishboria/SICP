;; fold-right & fold-left

(define (fold-right op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
;; (/ 1 (/ 2 (/ 3 1)))
;; (/ 1 (/ 2 3))
;; (/ 1 2/3)
;; 3/2

(fold-left / 1 (list 1 2 3))
;; (iter 1 '(1 2 3))
;; (iter (/ 1 1) '(2 3)) -> (iter 1 '(2 3))
;; (iter (/ 1 2) '(3)) -> (iter 1/2 '(3))
;; (iter (/ 1/2 3) '()) -> (iter 1/6 '())
;; 1/6

(fold-right list '() (list 1 2 3))
;; (list 1 (list 2 (list 3 '())))
;; (list 1 (list 2 '(3 ())))
;; (list 1 '(2 (3 ())))
;; '(1 (2 (3 ())))

(fold-left list '() (list 1 2 3))
;; (iter '() '(1 2 3))
;; (iter (list () 1) '(2 3)) -> (iter '(() 1) '(2 3))
;; (iter (list '(() 1) 2) '(3)) -> (iter '((() 1) 2) '(3))
;; (iter (list '((() 1) 2) 3) '()) -> (iter '(((() 1) 2) 3) '())
;; '(((() 1) 2) 3)

;; for fold-right & fold-left to produce the same result
;; the operation has to be associative e.g. (+ 1 (+ 2 3)) == (+ (+ 1 2) 3)
