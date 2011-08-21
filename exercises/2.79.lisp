(define (equ? x y) (apply-generic 'equ? x y))

;; scheme number package
(put 'equ? '(scheme-number scheme-number) =)

;; rational number pakage
(define (equ? r1 r2)
  (and (= (numer r1) (numer r2))
       (= (denom r1) (denom r2))))
(put 'equ? '(rational rational) equ?)

;; complex number package
(define (equ? z1 z2)
  (and (= (real-part z1) (real-part z2))
       (= (imag-part z2) (imag-part z2))))
(put 'equ? '(complex complex) equ?)
