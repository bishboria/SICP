(define (=zero? x) (apply-generic '=zero? x))

;; scheme number package
(put '=zero? '(scheme-number)
     (lambda (x) (= x 0)))

;; rational number pakage
(put '=zero? '(rational)
     (lambda (x) (= (numer x) 0)))

;; complex number package
(put '=zero? '(complex)
     (lambda (x) (and (= (real-part x) 0)
                      (= (imag-part x) 0))))
