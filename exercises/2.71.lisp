; huffman tree for n = 5. (power of 2 relative frequencies)

;         (e d c a b) 31
;        /  \ 
;     (e 16) (d c a b) 15
;         /   \
;      (d 8)  (c a b) 7
;            /   \
;        (c 4)   (a b) 3
;              /   \
;            (a 1) (b 2)
;
; 1 bit to encode most frequent
; n-1 bits to encode least frequent
;
; similar tree but larger for n = 10
