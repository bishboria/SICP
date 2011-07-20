(define (fringe tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else
          (append (fringe (car tree))
                  (fringe (cdr tree))))))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
(fringe '(3))

;; original solution broke for following example
;; changed ((not (pair? (car tree))) tree)
;; to      ((not (pair? tree)) (list tree))
;; and fixed it.
(fringe (list 1 (list 2) (list 3 4) (list (list 5 6) (list 7 8))))

;; Essentially the same solution as count-leaves from chapter 2.2.2 examples
