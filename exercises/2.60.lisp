; Sets as unordered-lists, but allowing duplicates

; O(1) instead of O(n)
(define (adjoin-set x set)
  (cons x set))

; O(n) instead of O(n^2)
(define (union-set set1 set2)
  (append set1 set2))

;; the other two methods don't change.

;; In a situation where adding and combining sets is required to be faster
;; then this solution will be preferred.
