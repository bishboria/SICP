(define (midpoint-segment segment)
  (define mid-x (average (x-point (start-segment segment))
                         (x-point (end-segment segment))))
  (define mid-y (average (y-point (start-segment segment))
                         (y-point (end-segment segment))))
  (make-point mid-x mid-y))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (average x y)
  (/ (+ x y) 2))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define point-1 (make-point 0 0))
(define point-2 (make-point 2 3))
(define segment (make-segment point-1 point-2))
(define mid (midpoint-segment segment))
(print-point mid)
