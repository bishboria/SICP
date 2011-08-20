; a. data needed to be supplied would be: company division, employee's name.
; the company division implies the division's particular personnel record.
; the employee's name to find the employee within that personnel record.

; Inside each division code package
; ...
(put 'division-name 'get-record division-specific-get-record)
; ...

(define (get-record division-name employee-name)
  ((get division-name 'get-record) employee-name))

; b. implement salary procedure to work with any division
(define (get-salary division-name employee-name)
  ((get division-name 'salary) (get-record division-name employee-name)))

; c. find employee record
(define (find-employee-record employee-name division-files)
  (let ((employee (get-record (car division-files) employee-name)))
    (if (null? employee)
      (find-employee-record employee-name (cdr division-files))
      employee)))

; or.
(define (find-employee-record employee-name division-list)
  (filter (lambda (division)
            (get-record division employee-name))
          division-list))

; d. to incorporate a newly taken-over company, there is no need to do anything
; on Insatiable Enterprises' side. The work is on the side of the new purchase
; to make sure that there data conforms to the interface all ready in place.
