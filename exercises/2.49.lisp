(define bottom-left (make-vect 0 0))
(define top-left (make-vect 0 1))
(define top-right (make-vect 1 1))
(define bottom-right (make-vect 1 0))
(define left-edge (make-segment bottom-left top-left))
(define top-edge (make-segment top-left top-right))
(define right-edge (make-segment top-right bottom-right))
(define bottom-edge (make-segment bottom-right bottom-left))

;; outline the frame
(define (outline->painter)
  (segments->painter (list left-edge
                           top-edge
                           right-edge
                           bottom-edge)))

;; an X shape
(define (x->painter)
  (segments->painter (list (make-segment top-left bottom-right)
                           (make-segment top-right bottom-left))))

;; a diamond pattern
(define ml (make-vect 0 0.5))
(define mt (make-vect 0.5 1))
(define mr (make-vect 1 0.5))
(define mb (make-vect 0.5 0))

(define (diamond->painter)
  (segments->painter (list (make-segment mb ml)
                           (make-segment ml mt)
                           (make-segment mt mr)
                           (make-segment mr mb))))

;; the wave painter
