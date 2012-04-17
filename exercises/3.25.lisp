(define (assoc key records)
  (cond ((null? records) false)
	((equal? key (caar records)) (car records))
	(else (assoc key (cdr records)))))

(define (lookup table . keys)
  (cond ((null? table) false)
	((null? keys) table)
	(else
	  (let ((subtable (assoc (car keys) (cdr table))))
	    (if subtable
	      (lookup (cdr table) (cdr keys))
	      false)))))

(define (make-table)
  (list '*table*))

(define table (make-table))
(insert! table 1 'a 'b 'c 'd)
