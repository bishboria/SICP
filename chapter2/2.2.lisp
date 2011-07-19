(cons (list 1 2) (list 3 4)) ;; produces ((1 2) 3 4)

(define x (cons (list 1 2) (list 3 4)))
(length x)

(list x x)
(length (list x x))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(count-leaves x)
(count-leaves (list x x))
