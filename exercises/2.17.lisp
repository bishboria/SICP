;; Exercise 2.17 define a procedure last-pair that returns the list that contains only the last element of a given non empty list

(define (last-pair items)
  (if (< (length items) 2)
    items
    (last-pair (cdr items))))

(last-pair (list 23 72 149 34))
