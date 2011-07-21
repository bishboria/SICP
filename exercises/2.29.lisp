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

(define (structure-is-a-mobile? structure)
  (pair? structure))

;; b. use the selectors to produce total-weight function
(define b1 (make-branch 1 8))
(define b2 (make-branch 2 4))
(define m1 (make-mobile b1 b2))
(define b3 (make-branch 4 2))
(define m2 (make-mobile (make-branch 4 m1) b3))

(define (total-weight structure)
  (+ (branch-weight (left-branch structure))
     (branch-weight (right-branch structure))))

;; After several attempts at getting part c. done, total-weight needs to have duplication removed and a new method pulled out.
(define (branch-weight branch)
  (define structure (branch-structure branch))
  (if (structure-is-a-mobile? structure)
    (total-weight structure)
    structure))

(total-weight m2)


;; c. design a predicate that tests whether a binary mobile is balanced.
(define (torque-applied-to branch)
  (* (branch-length branch)
     (branch-weight branch)))

(torque-applied-to b1)
(torque-applied-to b2)
(torque-applied-to b3)

(define (balanced? mobile)
  (if (and (= (torque-applied-to (left-branch mobile))
              (torque-applied-to (right-branch mobile)))
           (branch-balanced? (left-branch mobile))
           (branch-balanced? (right-branch mobile)))
    #t
    #f))

(define (branch-balanced? branch)
  (define structure (branch-structure branch))
  (if (structure-is-a-mobile? structure)
    (balanced? structure)
    structure))

(branch-balanced? b1)
(balanced? m1)
