; (define z (make-complex-from-real-imag 3 4))
; (define z ((get 'make-complex-from-real-imag 'complex) 3 4))
; z -> ('complex 'rectangular 3 . 4)

; (magnitude z)
; (apply-generic 'magnitude z)
; type-tags z -> '(complex rectangular 3 . 4)
; proc (get 'magnitude '(complex rectangular) -> magnitude for the
;  code that Alyssa told Louis to add.

; contents -> ('rectangular 3 . 4)
; (apply magnitude ('rectangular 3 . 4))
; this is another call to apply-generic via magnitude
; (apply-generic 'magnitude ('rectangular 3 . 4))
; type-tags -> 'rectangular
; proc -> (get 'magnitude 'rectangular) -> Rectangular internal def

; apply-generic is called twice
; once for the 'complex version of magnitude
; and again for the 'rectangular definition
