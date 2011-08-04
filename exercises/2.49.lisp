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

;; the wave painter. Starting at the leg on the bottom LHS.
(let ((zero (make-vect 0 0.25)) ;; start LHS
      (one (make-vect 0.37 0.5))
      (two (make-vect 0.4 0.6))
      (three (make-vect 0.25 0.4))
      (four (make-vect 0 0.8))
      (five (make-vect 0 0.9))
      (six (make-vect 0.25 0.6))
      (seven (make-vect 0.3 0.7))
      (eight (make-vect 0.4 0.7))
      (nine (make-vect 0.37 0.9))
      (ten (make-vect 0.4 1)) ;; end LHS
      (eleven (make-vect 0.6 1)) ;; start RHS
      (twelve (make-vect 0.63 0.9))
      (thirteen (make-vect 0.6 0.7))
      (fourteen (make-vect 0.67 0.7))
      (fifteen (make-vect 1 0.4))
      (sixteen (make-vect 1 0.25))
      (seventeen (make-vect 0.6 0.5))
      (eighteen (make-vect 0.75 0)) ;; end RHS
      (nineteen (make-vect 0.62 0)) ;; start under legs
      (twenty (make-vect 0.5 0.35))
      (twenty-one (make-vect 0.38 0))) ;; end under legs
  (segments->painter (list
                       (make-segment zero one)
                       (make-segment one two)
                       (make-segment two three)
                       (make-segment three four)
                       (make-segment five six)
                       (make-segment six seven)
                       (make-segment seven eight)
                       (make-segment eight nine)
                       (make-segment nine ten)
                       (make-segment eleven twelve)
                       (make-segment twelve thirteen)
                       (make-segment thirteen fourteen)
                       (make-segment fourteen fifteen)
                       (make-segment sixteen seventeen)
                       (make-segment seventeen eighteen)
                       (make-segment nineteen twenty)
                       (make-segment twenty twenty-one))))
