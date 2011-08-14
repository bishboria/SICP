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

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))

(define (branch-contains-symbol? symbol branch)
  (if (element-of-set? symbol (symbols branch))
    true
    false))

(define (encode-symbol symbol tree)
  (if (leaf? tree)
    '()
    (let ((left (left-branch tree))
          (right (right-branch tree)))
      (cond ((branch-contains-symbol? symbol left)
             (cons 0 (encode-symbol symbol left)))
            ((branch-contains-symbol? symbol right)
             (cons 1 (encode-symbol symbol right)))
            (else (error "symbol not found -- ENCODE-SYMBOL" symbol))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (if (= (length leaf-set) 1)
    (car leaf-set)
    (successive-merge (adjoin-set (make-code-tree (car leaf-set)
                                                  (cadr leaf-set))
                                  (cddr leaf-set)))))

(define lyrics '((na 16) (yip 9) (sha 3) (get 2) (a 2) (job 2) (boom 1) (wah 1)))
(define song-tree (generate-huffman-tree lyrics))
song-tree
(define song-lyrics '(get a job sha na na na na na na na na get a job sha na na na na na na na na wah yip yip yip yip yip yip yip yip yip sha boom))
(define song-message (encode song-lyrics song-tree))
song-message
(length song-message) ; -> 84 bits
(length song-lyrics) ; -> 36
; if encoded using fixed length. 8 word alphabet; 3 bits. 36 * 3 = 108 bits
