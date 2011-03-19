;; linear recursive approach to factorial
(define (factorial n)
  (if (= n 1)
    1
    (* n (factorial (- n 1)))))

;; linear iterative version
(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
    product
    (fact-iter (* counter product)
               (+ counter 1)
               max-count)))
