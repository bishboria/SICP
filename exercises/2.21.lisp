;; complete both implementations of square-list

(define (square-list items)
  (if (null? items)
    '()
    (cons (* (car items) (car items))
          (square-list (cdr items)))))

(square-list (list 1 2 3 4))

(define (square-list items)
  (map (lambda (x) (* x x))
       items))

(square-list (list 2 3 4 5))
