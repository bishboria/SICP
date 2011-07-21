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

;; Extracting method to raise structure-is-a-mobile? one
;; level up in the function heirarchy in terms of knowledge of impl
(define (has-branches? structure)
  (pair? structure))

(define (structure-is-a-mobile? structure)
  (has-branches? structure))

;; b. use the selectors to produce total-weight function
(define b1 (make-branch 1 8))
(define b2 (make-branch 2 4))
(define m1 (make-mobile b1 b2))
(define b3 (make-branch 4 2))
(define m2 (make-mobile (make-branch 4 m1) b3))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;; After several attempts at getting part c. done, total-weight needs to have duplication removed and a new method pulled out.
(define (branch-weight branch)
  (define structure (branch-structure branch))
  (if (structure-is-a-mobile? structure)
    (total-weight structure)
    structure))

(total-weight m2) ;; -> 14


;; c. design a predicate that tests whether a binary mobile is balanced.
(define (torque-applied-to branch)
  (* (branch-length branch)
     (branch-weight branch)))

(torque-applied-to b1) ;; -> 8
(torque-applied-to b2) ;; -> 8
(torque-applied-to b3) ;; -> 8

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
    #t))

(branch-balanced? b1) ;; a simple weight is balanced -> #t
(branch-balanced? b2) ;; a simple weight is balanced -> #t
(balanced? m1) ;; (= 8 8) -> #t

(define b1 (make-branch 1 2))
(define b2 (make-branch 2 1))
(define m1 (make-mobile b1 b2))
(define b3 (make-branch 4 m1))
(define b4 (make-branch 8 1.5))
(define m2 (make-mobile b3 b4))
(define b5 (make-branch 16 m2))
(define b6 (make-branch 32 2.25))
(define m3 (make-mobile b5 b6))
(balanced? m3) ;; -> #t

(define b1 (make-branch 1 2))
(define b2 (make-branch 2 0.99)) ;; -> this value change causes the imbalance
(define m1 (make-mobile b1 b2))
(define b3 (make-branch 4 m1)) 
(define b4 (make-branch 8 1.495)) ;; -> even though the others cause the rest of the tree to *visually look* balanced as the branch weights/torque are correlated
(define m2 (make-mobile b3 b4))
(define b5 (make-branch 16 m2))
(define b6 (make-branch 32 2.2425))
(define m3 (make-mobile b5 b6))
(balanced? m3) ;; -> #f
