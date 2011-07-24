(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))

(sum-odd-squares '(1 (2 (3 (4 5) 6 7 (8 9))) 10))

(define (fib n)
  (cond ((< n 2) n)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (even-fibs n)
  (define (next k)
    (if (> k n)
      '()
      (let ((f (fib k)))
        (if (even? f)
          (cons f (next (+ k 1)))
          (next (+ k 1))))))
  (next 0))

;; even though these procedures look different, they do the same basic things - 
;; although the same basic things may be spread out over different parts of the
;; procedure, or in different orders:
;;
;; 1. enumerate (the leaves of the tree/integers to get the fibonacci of)
;; 2. filter (choose odd numbers for squaring/fibonacci(n) which are even)
;; 3. map (square/fibonacci of number)
;; 4. accumulate (sum/cons)


(map square (list 1 2 3 4 5))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(filter odd? (list 1 2 3 4 5))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))
(accumulate + 0 (list 1 2 3 4 5))
(accumulate * 1 (list 1 2 3 4 5))
(accumulate cons '() (list 1 2 3 4 5))

;; for enumerating integers for even-fibs
(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high))))
(enumerate-interval 2 7)

;; for enumerating the leaves of a tree
(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
(enumerate-tree (list 1 (list 2 (list (list 3 4) 5))))
(enumerate-tree (list 1 2 3 4 5))

;; given we now have filter, accumulate and the ability to enumerate.
;; combined with map we can reformulate sum-odd-squares and even-fibs as
;; signal-flows. i.e.:

(define (sum-odd-squares tree)
  (accumulate +
              0
              (map square
                   (filter odd?
                           (enumerate-tree tree)))))
(sum-odd-squares (list (list (list 1) 2) 3 4 5 (list 6 7 8 9 10)))

(define (even-fibs n)
  (accumulate cons
              '()
              (filter even?
                      (map fib
                           (enumerate-interval 0 n)))))
(even-fibs 10)

;; now we have modularised components we can reuse and produce:

(define (list-fib-squares n)
  (accumulate cons
              '()
              (map square
                   (map fib
                        (enumerate-interval 0 n)))))
(list-fib-squares 10)

(define (product-of-squares-of-odd-elements sequence)
  (accumulate *
              1
              (map square
                   (filter odd? sequence))))
(product-of-squares-of-odd-elements (list 1 2 3 4 5))

;; or more conventional data processing

(define (salary-of-highest-paid-programmer records)
  (accumulate max
              0
              (map salary
                   (filter programmer? records))))

;; Nested Mappings
(accumulate append
            '()
            (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 10)))
;; creates list of pairs 1 <= j < i <= 10

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (prime? n)
  (define (iter n next)
    (cond ((= n next) #t)
          ((= 0 (remainder n next)) #f)
          (else (iter n (+ next 1)))))
  (iter n 2))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap (lambda (i)
                          (map (lambda (j) (list i j))
                               (enumerate-interval 1 (- i 1))))
                        (enumerate-interval 1 n)))))
