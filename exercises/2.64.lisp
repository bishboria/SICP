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

; a.
; this works by taking a list and splitting it roughly into three:
;   left part
;   entry (around middle)
;   right part
; it then recursively calls itself using the left and right parts.
; As each part gets smaller and smaller combined into a subtree using the
; middle entry of each part of the list; a tree is built up that
; is closely balanced.
; (list->tree '(1 3 5 7 9 11)) ->   5
;                                /    \
;                               1       9
;                                \    /   \
;                                 3  7     11

; b. The order of growth is O(n)
; Each element in the original list is only dealt with once.
; It is then returned as part of make-tree for a particular branch
; and doesn't have to be looked at again.
