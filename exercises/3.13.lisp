(define (last-pair x)
  (if (null? (cdr x))
    x
    (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c))) ; -> '(a b c a b c)

; z : ---> [ a | -> ] -> [ b | -> ] -> [ c | -> ] -\
;      |                                            |
;       \------------------------------------------/

; trying to compute (last-pair z) results in an infinite loop, as there is no null list terminator
