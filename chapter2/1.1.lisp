(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

;; Pairs
(define x (cons 1 2))
(car x)
(cdr x)

(define x (cons 1 2))
(define y (cons 3 4))
(define z (cons x y))
(car (car z))
(car (cdr z))

;; Representing rational numbers
(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define x (make-rat 1 3))
(define y (make-rat 2 3))
(add-rat x y)

;; printing rationals out to the screen
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 1 3))
(print-rat one-third)

(print-rat (mul-rat one-half one-third))
(print-rat (add-rat one-third one-third))

;; Get rid of the common factor
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(print-rat (add-rat one-third one-third))
