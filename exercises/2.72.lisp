; The special case where there are power of two frequencies:
;
; encoding the most frequent will be O(1) for finding the branch it's in
; it's the first in the list. consing up requires constant time also
;
; encoding the least frequent requires scanning the symbols at each level
; which decreases by one each time; roughly O(n^2)
; also consing up the path to it requires O(n)
; O(n^2) outweighs the O(n)
; so O(n^2)
