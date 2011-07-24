;; write a procedure to find all ordered triples of distinct
;; +ve integers i,j,k <= n and that sum to a given integer s

;; reuse previously defined procedures
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

;; new procedures
(define (unique-triples n)
  (flatmap (lambda (k)
             (map (lambda (pair) (cons k pair))
                  (unique-pairs (- k 1))))
           (enumerate-interval 1 n)))

(define (sums-to? s seq)
  (if (= s (accumulate + 0 seq)) #t #f))

(define (unique-triples-adding-to s n)
  (filter (lambda (triple)
            (sums-to? s triple))
          (unique-triples n)))

(unique-triples-adding-to 10 5)
(unique-triples-adding-to 10 10)
(unique-triples-adding-to 20 10)

