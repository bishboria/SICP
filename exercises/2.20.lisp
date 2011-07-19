(define (same-parity first . rest)
  (same-parity-iter (remainder first 2) rest (list first)))

(define (same-parity-iter parity source destination)
  (cond ((null? source) destination)
        ((= parity (remainder (car source) 2))
          (same-parity-iter parity (cdr source) (append destination (list (car source)))))
        (else (same-parity-iter parity (cdr source) destination))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7 8)
