;; set of all subsets of (1 2 3)

;; I couldn't see how to make this one work so I looked up some help
;; lo and behold and diagram detailing what is required helps a lot.

;; subsets (1 2)
;;  rest <- subsets (2)
;;    rest <- subsets () = (())
;;    append (()) (map ___ (())) = (() (2))
;;  append (() (2)) (map ___ (() (2))) = (() (2) (1) (1 2))

;; ___ is the function that takes the car of a subset (rather than just the cdr)
;; and cons' it with each element in rest.

(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x)
                          (cons (car s) x))
                        rest)))))
(subsets '(1))
(subsets '(1 2))
(subsets '(1 2 3))
