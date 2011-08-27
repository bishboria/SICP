; a. with scheme-number->scheme-number coercion and complex->complex number
; coercion in the coercion table, and a generic exponentiation operation defined
; to work only in the scheme-number package, if we call exp on two complex numbers:
;
; no proc will be found in the call to (get op type-tags).
; t1->t2 coercion will be found and apply-generic will call itself with the same
; parameters -> infinite loop

; b. there is something wrong with the program, but only if you try to coerce a
; type to itself and both types are equal.

; c modified apply-generic
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply proc (map contents args))
        (if (= (length args) 2)
          (let ((type1 (car type-tags))
                (type2 (cadr type-tags))
                (a1 (car args))
                (a2 (cadr args)))
            (if (eq? type1 type2)
              (error "No method for these types" (list op type-tags))
              (let ((t1->t2 (get-coercion type1 type2))
                    (t2->t1 (get-coercion type2 type1)))
                (cond (t1->t2
                        (apply-generic op (t1->t2 a1) a2))
                      (t2->t1
                        (apply-generic op a1 (t2->t1 a2)))
                      (else
                        (error "No method for these types"
                               (list op type-tags)))))))
          (error "No method for these types"
                 (list op type-tags)))))))
