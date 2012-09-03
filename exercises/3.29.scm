(define (or-gate a1 a2 output)
  (let ((c1 (make-wire))
	(c2 (make-wire))
	(o1 (make-wire)))
    (inverter a1 c1)
    (inverter a2 c2)
    (and-gate c1 c2 o1)
    (inverter o1 output)
    'ok))

;; The delay for this gate will be 1 and-gate delay plus 3 (or 2, if
;; inverters are delayed in parallel) inverter delays.
