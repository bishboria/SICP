;; Louis Reasoner trying to solve square-list iteratively

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons (square (car things))
                  answer))))
  (iter items '()))

(square-list (list 1 2 3 4))
;; this is producing the list in reverse order because the next item to be squared is added at the beginning of the cons i.e. (cons (square 2) '(1))

;; alternative
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons answer
                  (square (car things))))))
  (iter items '()))

(square-list (list 6 7 8 9 10))
;; this version doesn't work because the last argument passed to cons is not a list, it's a number.
;; it's also adding the new elements at the end of the cons rather than the start.
