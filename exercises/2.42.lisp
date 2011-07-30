;; Eight Queens Puzzle

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

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter (lambda (positions) (safe? k positions))
              (flatmap (lambda (rest-of-queens)
                         (map (lambda (new-row)
                                (adjoin-position new-row k rest-of-queens))
                              (enumerate-interval 1 board-size)))
                       (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())

(define (adjoin-position new-row row-number rest-of-queens)
  (cons new-row rest-of-queens))

(define (safe? column-number positions)
  (define (safe-iter current-position remaining-positions distance-from-current)
    (cond ((null? remaining-positions) #t)
          ((attackable? current-position (car remaining-positions) distance-from-current) #f)
          (else (safe-iter current-position (cdr remaining-positions) (+ distance-from-current 1)))))
  (safe-iter (car positions) (cdr positions) 1))

(define (attackable? current-position next-position distance-from-current)
  (or (= current-position next-position)
      (= current-position (+ next-position distance-from-current))
      (= current-position (- next-position distance-from-current))))
