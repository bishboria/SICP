(define (append x y)
  (if (null? x)
    y
    (cons (car x) (append (cdr x) y))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
    x
    (last-pair (cdr x))))

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
z
(cdr x) ; # '(b)
(define w (append! x y))
w
(cdr x) ; # '(b c d)

; x ->[ a | ->] -> [ b | \ ]
; y ->[ c | ->] -> [ d | \ ]
; 
; w : (append! x y) : x -> [ a | -> ] -> [ b | -> ] -> [ c | -> ] -> [ d | \ ]
