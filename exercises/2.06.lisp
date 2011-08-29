;; Exercise 2.6.
;; Brutal

(define zero
  (lambda (f)
    (lambda (x) x)))

(define (add-1 n)
  (lambda (f)
    (lambda (x) (f ((n f) x)))))

(add-1 zero) ;;->
(lambda (f)
  (lambda (x) (f ((zero f) x)))) ;;->
(lambda (f)
  (lambda (x) (f x)))

(define one
  (lambda (f)
    (lambda (x) (f x))))

(add-1 one) ;;->
(lambda (f)
  (lambda (x) (f ((one f) x)))) ;;->
(lambda (f)
  (lambda (x) (f ((lambda (x) (f x)) x)))) ;;->
(lambda (f)
  (lambda (x) (f (f x)))) ;;->

(define two
  (lambda (f)
    (lambda (x) (f (f x)))))


;; general add function for composing functions multiple times
(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))


;; Example building up and working through how it's used
(add one two) ;;->
(lambda (f)
  (lambda (x)
    ((one f) ((two f) x))))

((add one two) square) ;;->
(lambda (x)
  ((one square) ((two square) x)))

(((add one two) square) 2) ;;->
((one square) ((two square) 2)) ;;->
((lambda (x) (square x)) ((lambda (x) (square (square x))) 2)) ;;->
((lambda (x) (square x)) (square (square 2))) ;;->
((lambda (x) (square x)) 16) ;;->
(square 16) ;;->
256
