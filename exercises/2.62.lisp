; union-set using ordered lists

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((= (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) (cdr set2))))
        ((< (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) set2)))
        (else
          (cons (car set2) (union-set set1 (cdr set2))))))

(union-set '(1 3 5) '(2 4 6))
(union-set '(1 2 3) '(2 3 4))
