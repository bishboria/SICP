(define (assoc same-key? key records)
  (cond ((null? records) false)
	((same-key? key (caar records)) (car records))
	(else (assoc same-key? key (cdr records)))))

(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc same-key? key-1 (cdr local-table))))
	(if subtable
	  (let ((record (assoc same-key? key-2 (cdr subtable))))
	    (if record
	      (cdr record)
	      false))
	  false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc same-key? key-1 (cdr local-table))))
	(if subtable
	  (let ((record (assoc same-key? key-2 (cdr subtable))))
	    (if record
	      (set-cdr! record value)
	      (set-cdr! subtable
			(cons (cons key-2 value)
			      (cdr subtable)))))
	  (set-cdr! local-table
		    (cons (list key-1
				(cons key-2 value))
			  (cdr local-table)))))
      'ok)
    (define (dispath m)
      (cond ((eq? m 'lookup) lookup)
	    ((eq? m 'insert!) insert!)
	    (else (error "Unknown operation - TABLE" m))))
    dispath))

(define (same-key? x y)
  (if (< (abs (- x y))
	 0.5)
    true
    false))

(define table (make-table same-key?))

((table 'insert!) 2.5 3 1)
((table 'insert!) 2.9 3 2)
((table 'lookup) 2.4 3) ; returns 2 :) use of same-key? means that 2.9 is not used as a key.
			; and the existing entry for the subtable is overwritten with 2
