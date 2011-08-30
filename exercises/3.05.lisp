; Monte Carlo integration
(define (estimate-integral p x1 x2 y1 y2 trials)
  (let ((rectangle-area (* (- x2 x1) (- y2 y1))))
  (* rectangle-area
     (monte-carlo trials (p x1 x2 y1 y2)))))

(define (in-circle-test x1 x2 y1 y2)
  (let ((centre-x (/ (+ x1 x2) 2.0))
        (centre-y (/ (+ y1 y2) 2.0)))
    (let ((radius (- centre-x x1)))
      (lambda ()
        (<= (square radius)
            (+ (square (- (random-in-range x1 x2) radius))
               (square (- (random-in-range y1 y2) radius))))))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
            (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(estimate-integral in-circle-test 2.0 8.0 4.0 10.0 10000)
(estimate-integral in-circle-test -1.0 1.0 -1.0 1.0 100000)
