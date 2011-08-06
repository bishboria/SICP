;; below transformation painter. Analogous to beside
(define (below painter1 painter2)
  (let (split-point (make-vect 0.0 0.5))
    (let ((paint-top
            (transform-painter painter2
                               split-point
                               (make-vect 1.0 0.5)
                               (make-vect 0.0 1.0)))
          (paint-bottom
            (transform-painter painter1
                               (make-vect 0.0 0.0)
                               (make-vect 1.0 0.0)
                               split-point)))
      (lambda (frame)
        (paint-top frame)
        (paint-bottom frame)))))

; below painter in terms of beside and rotations
(define (below painter1 painter2)
  (let ((p1 (rotate270 painter1))
        (p2 (rotate270 painter2)))
    (rotate90 (beside p1 p2))))

; or
(define (below painter painter2)
  (rotate90 (beside (rotate270 painter1) (rotate270 painter2))))
