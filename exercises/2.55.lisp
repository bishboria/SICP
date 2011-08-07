(car ''abracadabra)
; this returns quote because ' is syntactic sugar for the special form
; procedure (quote ...). So we are calling (quote (quote abracadabra))
; hence, (car (quote (quote abracadabra))) -> quote

; remember the second quote is actually quoted :)
