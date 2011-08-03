(define (make-segment v w)
  (cons v w))

(define (start-segment v)
  (car v))

(define (end-segment v)
  (cdr v))
