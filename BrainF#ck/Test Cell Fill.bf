;; Test Cell Fill(May crash in old interpreters)

+[>+]

;; It will go until the last cell(3000?)
;; adding 1 in each cell and go back
;; to the first cell(interpreter support)
;; probably the first cell is filled
;; with >255 and returns to 0 and the
;; loop stops

;; but if the interpreter supports a lot of cells
;; it may crash