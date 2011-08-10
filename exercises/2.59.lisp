;; union-set for unordered-lists
;; with progressive refinements

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (union-set (cdr set1) (cons (car set1) set2)))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        (else (union-set (cdr set1)
                         (if (element-of-set? (car set1) set2)
                           set2
                           (cons (car set1) set2))))))

(define (union-set set1 set2)
  (if (null? set1)
    set2
    (union-set (cdr set1)
               (if (element-of-set? (car set1) set2)
                 set2
                 (cons (car set1) set2)))))

(define (union-set set1 set2)
  (if (null? set1)
    set2
    (union-set (cdr set1) (adjoin-set (car set1) set2))))

(union-set '(1 2 3 4) '(5 6 7 8 9))
(union-set '(1 2 3) '(2 3 4))
