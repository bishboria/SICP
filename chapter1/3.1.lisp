(define (sum-integers a b)
  (if (> a b)
    0
    (+ a (sum-integers (1+ a) b))))

(sum-integers 4 23)

(define (cube a)
  (* a a a))

(define (sum-cubes a b)
  (if (> a b)
    0
    (+ (cube a) (sum-cubes (1+ a) b))))

(sum-cubes 2 3)

(define (pi-sum a b)
  (if (> a b)
    0
    (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

;; these are of the general form, which is the mathematical Sigma notation pattern.
;; Sum of i from a to b applied to f(i)
(define (<name> a b)
  (if (> a b)
    0
    (+ (<term> a)
       (<name> (<next> a) b))))


(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (sum-cubes a b)
  (sum cube a 1+ b))

(define (identity a) a)

(define (sum-int a b)
  (sum identity a 1+ b))

(sum-int 1 10)

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 10000))
(* 8 (pi-sum 1 100000))


(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f
          (+ a (/ dx 2.0))
          add-dx
          b)
     dx))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
