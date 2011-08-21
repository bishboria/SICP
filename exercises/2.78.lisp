; redefine attach-tag type-tag and contents so that they
; take advantage of scheme's internal type system

(define (attach-tag type-tag contents)
  (if (and (eq? type-tag 'scheme-number) (number? contents))
    contents
    (cons type-tag contents)))

(define (type-tag datum)
  (cond ((pair? datum) (car datum))
        ((number? datum) 'scheme-number)
        (else (error "Bad tagged datum -- TYPE-TAG" datum))))

(define (contents datum)
  (cond ((pair? datum) (cdr datum))
        ((number? datum) datum)
        (else (error "Bad tagged datum -- CONTENTS" datum))))
