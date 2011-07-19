;; Iterative version using append
(define (same-parity first . rest)
  (same-parity-iter (remainder first 2) rest (list first)))

(define (same-parity-iter parity source destination)
  (cond ((null? source) destination)
        ((= parity (remainder (car source) 2))
          (same-parity-iter parity (cdr source) (append destination (list (car source)))))
        (else (same-parity-iter parity (cdr source) destination))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7 8)


;; Recursive version using cons
(define (same-parity-b first . rest)
  (define (same-parity-recursive parity remaining)
      (cond ((null? remaining) '())
            ((= parity (remainder (car remaining) 2))
              (cons (car remaining) (same-parity-recursive parity (cdr remaining))))
            (else (same-parity-recursive parity (cdr remaining)))))
  (cons first (same-parity-recursive (remainder first 2) rest)))


(same-parity-b 1 2 3 4 5 6 7)
(same-parity-b 2 3 4 5 6 7 8)

(same-parity 1 1 1 1 1 2 2 2 2 3 3)
(same-parity-b 2 1 1 1 1 2 2 2 2 3 3)
