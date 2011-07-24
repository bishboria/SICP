;; define reverse (ex 2.18) in terms of fold-right and fold-left

(define (fold-right op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest))))
  (iter initial sequence))


(define (reverse sequence)
  (fold-right (lambda (x y)
                (append y (list x)))
              '()
              sequence))
;; (op 1 (op 2 (op 3 (op 4 '()))))
;; (op 1 (op 2 (op 3 '(4))))
;; (op 1 (op 2 '(4 3)))
;; ...
;; '(4 3 2 1)
;; (op x y) -> (append y (list x))
(reverse '(1 2 3 4))

(define (reverse sequence)
  (fold-left (lambda (x y)
               (cons y x))
             '()
             sequence))
;; (iter (op nil 1) '(2 3 4))
;; (iter (op '(1) 2) '(3 4))
;; (iter (op '(2 1) 3) '(4))
;; (iter (op '(3 2 1) 4) '())
;; '(4 3 2 1)
;; (op x y) -> (cons y x)
(reverse '(1 2 3 4))
