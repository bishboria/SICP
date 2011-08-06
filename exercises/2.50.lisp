(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))
; or
(define (rotate180 painter)
  (rotate90 (rotate90 painter)))

(define (rotate270 painter)
  (rotate90 (rotate90 (rotate90 painter))))

; or
(define (repeat proc n)
  (if (= n 1)
    proc
    (lambda (x)
      (proc ((repeat proc (- n 1)) x)))))

(define (rotate180 painter)
  ((repeat rotate90 2) painter))

(define (rotate270 painter)
  ((repeat rotate90 3) painter))
