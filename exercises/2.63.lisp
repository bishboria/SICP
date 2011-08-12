(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree)
                  (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree)
                          (copy-to-list (right-branch tree)
                                        result-list)))))
  (copy-to-list tree '()))

(define t1 (make-tree 7
                      (make-tree 3
                                 (make-tree 1 '() '())
                                 (make-tree 5 '() '()))
                      (make-tree 9
                                 '()
                                 (make-tree 11 '() '()))))
(define t2 (make-tree 3
                      (make-tree 1 '() '())
                      (make-tree 7
                                 (make-tree 5 '() '())
                                 (make-tree 9
                                            '()
                                            (make-tree 11 '() '())))))

(define t3 (make-tree 5
                      (make-tree 3
                                 (make-tree 1 '() '())
                                 '())
                      (make-tree 9
                                 (make-tree 7 '() '())
                                 (make-tree 11 '() '()))))

; a. both procedures produce the same result. They both do an 
; in-order traversal of the tree argument given.

(tree->list-1 t1) ; -> (1 3 5 7 9 11)
(tree->list-2 t1) ; -> (1 3 5 7 9 11)

(tree->list-1 t2) ; -> (1 3 5 7 9 11)
(tree->list-2 t2) ; -> (1 3 5 7 9 11)

(tree->list-1 t3) ; -> (1 3 5 7 9 11)
(tree->list-2 t3) ; -> (1 3 5 7 9 11)

; b. They both do tree recursion, so have a similar growth O(n)
; but tree->list-1 uses append which will make it a bit slower
; than tree->list-2
