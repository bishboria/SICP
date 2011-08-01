;; define split function such that

(define right-split (split beside below))
(define up-split (split below beside))

(define (split op1 op2)
  (lambda (painter n)
    (if (= n 0)
      painter
      (let ((smaller ((split op1 op2) painter (- n 1))))
        (op1 painter (op2 smaller smaller))))))
