(define (=zero? polynomial)
  (cond ((null? (term-list polynomial)) true)
        ((not (=zero? (coeff (first-term (term-list polynomial))))) false)
        (else
          (=zero? (make-poly (variable polynomial)
                  (rest-terms (term-list polynomial)))))))
