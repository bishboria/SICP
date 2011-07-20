;; binary mobile

;; Given the following
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; a. Create the accesors to return the components of the branches and mobiles
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;; b. use the selectors to produce total-weight function
(define b1 (make-branch 1 8))
(define b2 (make-branch 2 4))
(define m1 (make-mobile b1 b2))
(define b3 (make-branch 4 2))
(define m2 (make-mobile (make-branch 4 m1) b3))

(define (total-weight structure)
  (if (not (pair? structure)) ;; <- This smells of too much knowledge of the internals...
    structure
    (+ (total-weight (branch-structure (left-branch structure)))
       (total-weight (branch-structure (right-branch structure))))))

(total-weight m2)
