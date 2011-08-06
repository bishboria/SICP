; a.
(let ((zero (make-vect 0 0.25)) ;; start LHS
      ...
      (twenty-two (make-vect 0.4 0.8)) ;; start smile
      (twenty-three (make-vect 0.45 0.75))
      (twenty-four (make-vect 0.55 0.75))
      (twenty-five (make-vect 0.6 0.8))) ;; end smile
  (segments->painter (list
                       (make-segment zero one)
                       ...
                       (make-segment twenty-two twenty-three)
                       (make-segment twenty-three twenty-four)
                       (make-segment twenty-five twenty-four))))

; b.
(define (corner-split painter n)
  (if (= n 0)
    painter
    (beside (below painter (up-split painter (- n 1)))
            (below (right-split painter (- n 1)) (corner-split painter (- n 1))))))

; c. 
(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (beside (below quarter (rotate270 quarter))
            (below (rotate90 quarter) (rotate180 quarter)))))

; or
(define (square-limit painter n)
  (let (combine4 (square-of-four rotate270 rotate180
                                 identity rotate90))
    (combine4 (corner-split painter n))))
