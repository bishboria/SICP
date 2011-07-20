(define (deep-reverse x)
  (cond ((null? x) '())
        ((pair? (car x))
          (append (deep-reverse (cdr x))
                  (list (deep-reverse (car x)))))
        (else
          (append (deep-reverse (cdr x))
                  (list (car x))))))

(define x (list (list 1 2) (list 3 4)))
(deep-reverse x)
