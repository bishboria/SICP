(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              '()
              sequence))

;; accumulate op is a function that requires two parameters.
;; but we also have to do two things with op because of what map does;
;; a. cons up the results
;; b. of recursively applying p to the first element in the sequence.
(map square (list 1 2 3 4 5))
(map even? (list 1 2 3 4 5))


(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
;; accumulate flips the order of the two sequences because we recurse through
;; the 'sequence' in accumulate then return the initial value when then sequence
;; is cdr'd to null. I.e. we cdr down seq1, consing up the values, when seq1 is
;; null we return seq2
(append (list 1 2 3 4 5) (list 6 7 8 9 10))


(define (length sequence)
  (accumulate (lambda (x y)
                  (+ 1 y))
              0
              sequence))
;; all we need is to add 1 everytime op is called in accumulate. x can be ignored
;; while passing y to the next stage unchanged by the lambda.
(length (list 2 3 4 5 6))
