(a b c d)
(23 45 17)
((Norah 12) (Molly 9) (Anna 7) (Lauren 6) (Charlotte 4))

(* (+ 23 45) (+ x 9))
(define (fact n) (if (= n 1) 1 (* n (fact (- n 1)))))

(define a 1)
(define b 2)
(list a b)
(list 'a 'b)
(list 'a b)

(car '(a b c))
(cdr '(a b c))
(car (quote (a b c)))
(cdr (quote (a b c)))

; ' is syntactic sugar for the (quote ...) form

(eq? 1 '1)
(eq? 1 1)
(eq? a 1)
(eq? 'a 1)
(eq? '(a b c) (quote (a b c)))
(eq? (quote (a b c)) (quote (a b c)))

(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(memq 'apple '(pear banana prune))
(memq 'apple '(x (apple sauce) y apple pear))
