(define (mystery x)
  (define (loop x y)
    (if (null? x)
      y
      (let ((temp (cdr x)))
	(set-cdr! x y)
	(loop temp x))))
  (loop x '()))

(define x (list 'a 'b))
(mystery x)

; In general mystery reverses a list. Not tree recursive so it only does a shallow reverse

; v: -> [a|->]->[b|->]->[c|->]->[d|\]
;
; (mystery v):
; (mystery '(a b c d))
; (loop '(a b c d) '())
;   temp -> '(b c d)
;   x -> '(a)
;   (loop '(b c d) '(a))
;     temp -> '(c d)
;     x -> '(b a)
;     (loop '(c d) '(b a))
;       temp -> '(d)
;       x -> '(c b a)
;       (loop '(d) '(c b a))
;         temp -> '()
;         x -> '(d c b a)
;         (loop '() '(d c b a))
; '(d c b a)
;
; v --> [a|\]
;   |
;   \--------------------------\
; w -> [d|->]->[c|->]->[b|->]--/
;
w ; # '(d c b a)
v ; # '(a)
