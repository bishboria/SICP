(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch
              (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
          (cons (symbol-leaf next-branch)
                (decode-1 (cdr bits) tree))
          (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair)
                             (cadr pair))
                  (make-leaf-set (cdr pairs))))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((eq? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

; first working attempt
(define (successive-merge leaf-set)
    (let ((first (car leaf-set))
          (second (cadr leaf-set))
          (remaining (cddr leaf-set)))
      (cond ((null? remaining)
             (make-code-tree first second))
            ((<= (weight first) (weight second))
             (successive-merge (adjoin-set (make-code-tree first second)
                                           remaining))))))

; second working attempt
; no need for checking weights in cond. adjoin-set keeps it in order
; if there are two things in the list, there is still one more merge
(define (successive-merge leaf-set)
  (let ((first (car leaf-set))
        (second (cadr leaf-set)))
    (if (= (length leaf-set) 2)
      (make-code-tree first second)
      (successive-merge (adjoin-set (make-code-tree first second)
                                    (cddr leaf-set))))))

; third working attempt
; if the length is one; return the car
; don't really need the let declarations now
(define (successive-merge leaf-set)
  (if (= (length leaf-set) 1)
    (car leaf-set)
    (successive-merge (adjoin-set (make-code-tree (car leaf-set)
                                                  (cadr leaf-set))
                                  (cddr leaf-set)))))


(generate-huffman-tree '((a 4) (b 2) (c 1) (d 1)))

(define a-h-pairs '((a 8) (b 3) (c 1) (d 1) (e 1) (f 1) (g 1) (h 1)))
(generate-huffman-tree a-h-pairs)

(generate-huffman-tree '((a 4) (b 2)))
