;; Define square-tree (analogue of square-list)
;;
;; define directly and in terms of map + recursion

;; direct version
(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define t1 (list 1
                 (list 2 (list 3 4) 5)
                 (list 6 7)))

(square-tree t1)

;; map + recursion
(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree-map sub-tree)
           (* sub-tree sub-tree)))
       tree))

(square-tree-map t1)
