;; Ex 1.19 logarithmic fibonacci

;; Transformation Tpq => a = bq + aq + ap
;;                    => b = bp + aq
;;
;;
;;              Tpq^2 => a = (bp + aq)q + (bq + aq + ap)q + (bq +aq +ap)p
;;                         = lots of hand written notes
;;                         = b(2pq + qq) + a(2qq + 2pq + pp)
;;                         = bq' + a(p' + q')
;;
;;                    => b = (bp + aq)p + (bq + aq + ap)q
;;                         = more hand written notes
;;                         = b(pp + qq) + a(2pq + qq)
;;                         = bp' + aq'
;;
;; p' = pp + qq
;; q' = 2pq + qq

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a
                                 b
                                 (+ (* p p) (* q q)) ;; p'
                                 (+ (* 2 p q) (* q q)) ;; q'
                                 (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(equal? (fib 0) 0)
(equal? (fib 1) 1)
(equal? (fib 2) 1)
(equal? (fib 3) 2)
(equal? (fib 4) 3)
(equal? (fib 5) 5)
(equal? (fib 6) 8)
(equal? (fib 7) 13)
