; The Costs of Introducing Assignment
(define (make-simplified-withdraw balance)
  (lambda (amount)
    (set! balance (- balance amount))
    balance))
(define W (make-simplified-withdraw 25))
(W 20)
(W 10)

(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)))
(define D (make-decrementer 25))
(D 20)
(D 10)

((make-decrementer 25) 20)
((lambda (amount) (- 25 amount)) 20)
(- 25 20)

((make-simplified-withdraw 25) 20)
(let ((balance 25))
  ((lambda (amount) (set! balance (- 25 amount)) 25) 20))
(let ((balance 25))
  (set! balance (- 25 20)))


; Sameness and change
(define D1 (make-decrementer 25))
(define D2 (make-decrementer 25))
(D1 20)
(D1 20)
(D2 20)

(define W1 (make-simplified-withdraw 25))
(define W2 (make-simplified-withdraw 25))
(W1 20)
(W1 20)
(W2 20)

(define peter-acc (make-account 100))
(define paul-acc (make-account 100))

(define peter-acc (make-account 100))
(define paul-acc peter-acc)


; Pitfalls of imperative programming
(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
      product
      (iter (* counter product)
	    (+ counter 1))))
  (iter 1 1))

(define (factorial n)
  (let ((product 1)
	(counter 1))
    (define (iter)
      (if (> counter n)
	product
	(begin (set! product (* counter product))
	       (set! counter (+ counter 1))
	       (iter))))
    (iter)))

; changing the set assignment order would give an incorrect result
;(set! counter (+ counter 1))
;(set! product (* counter product))
