; use 2.63 and 2.64 to construct O(n) implementations of
; union-set and intersection set on (balanced) binary
; trees

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
    (cons '() elts)
    (let ((left-size (quotient (- n 1) 2)))
      (let ((left-result (partial-tree elts left-size)))
        (let ((left-tree (car left-result))
              (non-left-elts (cdr left-result))
              (right-size (- n (+ left-size 1))))
          (let ((this-entry (car non-left-elts))
                (right-result (partial-tree (cdr non-left-elts) right-size)))
            (let ((right-tree (car right-result))
                  (remaining-elts (cdr right-result)))
              (cons (make-tree this-entry left-tree right-tree) remaining-elts))))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree)
                          (copy-to-list (right-branch tree)
                                        result-list)))))
  (copy-to-list tree '()))

; from 2.62 O(n) union of sets (implemented as lists)
(define (union-set-as-list set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((= (car set1) (car set2))
         (cons (car set1) (union-set-as-list (cdr set1) (cdr set2))))
        ((< (car set1) (car set2))
         (cons (car set1) (union-set-as-list (cdr set1) set2)))
        (else
          (cons (car set2) (union-set-as-list set1 (cdr set2))))))

(define (union-set set1 set2)
  (list->tree (union-set-as-list (tree->list-2 set1) (tree->list-2 set2))))

; from chapter examples 2.3.3 O(n) intersection
(define (intersection-set-as-list set1 set2)
  (if (or (null? set1) (null? set2))
    '()
    (let ((x1 (car set1)) (x2 (car set2)))
      (cond ((= x1 x2)
             (cons x1
                   (intersection-set-as-list (cdr set1)
                                     (cdr set2))))
            ((< x1 x2)
             (intersection-set-as-list (cdr set1) set2))
            ((< x2 x1)
             (intersection-set-as-list set1 (cdr set2)))))))

(define (intersection-set set1 set2)
  (list->tree (intersection-set-as-list (tree->list-2 set1) (tree->list-2 set2))))

(define t1 (list->tree '(1 2 3 4 5 6 7)))
(define t2 (list->tree '(2 3 4 5 6 7 8)))

(union-set t1 t2)
(intersection-set t1 t2)
