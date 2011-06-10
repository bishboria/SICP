(define (cons x y)
  (lambda (m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 - CONS" m)))))

(define (car z) (z 0))
(define (cdr z) (z 1))
