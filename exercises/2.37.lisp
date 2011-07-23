;; representing vectors and matrices as sequences

;; vector e.g. (1 2 3 4)
;; matrix e.g. ((1 2 3 4)
;;              (4 5 6 6)
;;              (7 8 9 9))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

;; dot product given as (using built in scheme map function):
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product '(1 2 3 4) '(2 3 4 5))

;; matrix * vector
;; realise here that m*v uses dot-product for each row
(define (matrix-*-vector m v)
  (map (lambda (row) 
         (dot-product row v))
       m))

(define m2 '((1 2 3) (4 5 6)))
(define v2 '(2 2 2))
(matrix-*-vector m2 v2)

;; transpose of a matrix
(define (transpose matrix)
  (accumulate-n cons '() matrix))

(transpose m2)

;; matrix multiplication
;; realise here that map applies to each row of the matrix
;; i.e. a vector. so do a matrix-*-vector on the transposed matrix
;; and each row of the other matrix
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (matrix-*-vector cols row))
         m)))

(define I3 '((1 0 0) (0 1 0) (0 0 1)))
(define m '((1 2 3) (4 5 6) (7 8 9)))
(define n '((1 2) (3 4)))
(matrix-*-matrix m I3)
(matrix-*-matrix I3 m)
(matrix-*-matrix n n)
