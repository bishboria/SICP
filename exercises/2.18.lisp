;; Exercise 2.18 define a procedure reverse that takes a list and returns the reverse of it.

(define (reverse items)
  (if (null? (cdr items))
    items
    (append (reverse (cdr items))
            (list (car items)))))

(reverse (list 1 4 9 16 25))
