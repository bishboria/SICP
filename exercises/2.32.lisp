;; set of all subsets of (1 2 3)

;; I couldn't see how to make this one work so I looked up some help
;; lo and behold and diagram detailing what is required helps a lot.

;; subsets (1 2)
;;  rest <- subsets (2)
;;    rest <- subsets () = (())
;;    append (()) (map ___ (())) = (() (2))
;;  append (() (2)) (map ___ (() (2))) = (() (2) (1) (1 2))

;; ___ is the function that takes the first element of the subset s passed 
;; to the function (rather than just the cdr, like when rest
;; is defined in the let block) and cons' it with each element in rest.

;; Because it is recursive, it drills all the way down to the null set first
;; and appends the results as it comes back up the call chain.

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
