;; redefine count-leaves as an accumulation

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

;; definition that uses enumerate-tree
(define (count-leaves tree)
  (accumulate +
              0
              (map (lambda (x) 1)
                   (enumerate-tree tree))))

(define t1 (list 1 (list 2 (list 3 4) 5)))
(define t2 (list (list 1 2 3 4) (list 1 2 3 4)))
(count-leaves t1)
(count-leaves t2)

;; recursive definition without enumerate-tree
(define (count-leaves tree)
  (accumulate +
              0
              (map (lambda (sub-tree)
                     (if (pair? sub-tree)
                       (count-leaves sub-tree)
                       1))
                   tree)))

(count-leaves t1)
(count-leaves t2)
