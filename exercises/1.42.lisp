;; Ex 1.42 produce a procedure that composes functions: eg ((compose square inc) 6) -> 49

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square x)
  (* x x))

((compose square 1+) 6)
