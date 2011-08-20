; Explicit dispatch is no good at all for systems where new types have to be
; frequently added. Not only does someone have to update the code to add the new
; type, but someone else has to add the new type to the dispatch method. If this
; happens often it will become tedious and prone to error.

; Data-directed style is a lot better as it means the person who implements the
; new type/operation only has to update their own package (As long as the 
; package interface isn't changing).

; Message-passing has similar benefit to data-directed style.

; Data-directed seems best for new types. Message passing seems best for new
; operations.
