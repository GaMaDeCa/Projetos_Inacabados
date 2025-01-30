;; Multiply 12×4(bf tip: aggregate each + or - in separated
;;                                groups of four for a better reading)
>++++ ++++ ++++[<++++>-]<.

;; Remember, loops only starts with cell value>0.

;; The 12×4 result will be stored in the cell as
;; decimal 48 ascii, if you print it you will get
;; the ascii value of 48, that is the character "0", not "48"

;; ASCII Quick Table Tip:
;;  To print a number between 0-9 you will need
;;  to fill the cell with the respective values 48-58(+10, where the char 0=48)
;;  the same is with the alphabet.
;;   Numbers: 48-58              (+10 numbers)
;;   Uppercase Alphabet: 65-91   (+26 letters)
;;   Lowercase Alphabet: 97-123  (+26 letters)

;; For other symbols(.!) you will need to search the decimals
;; in the ASCII table by your own, if I'm not mistaken the decimal
;; value of the symbol ! is 33.




;; BrainF*ck "if"

;; You may need to simulate an if in BF
;; but I'm gonna warn you, there's no "if" in BF
;; at least, not the way an true "if" would work

;; Basically you will use 2 cells to check and start
;; a loop or two, and a cell that you will use to compare
;; if the values may be equal, it's kinda a math trick also, see below:

Cell1=5 ;; A random value
Cell2=5 ;; The value to compare
Cell3=1 ;; Our "boolean cell", 1 = True, 0 = False

;; The "math trick", 5-5=0, if its 6-5=1 or if its 5-6=-1
;; if its -5-5=-10, but there's no -char decimal cell in BF
;; meaning it will never happend because all cells>-1
Cell2-=Cell1
;; Also, if the Cell1 was 6, the Cell2(5) will not be -1
;; it will be 255, but if its an old BF interpreter idk what may happen

if(Cell2!=0) [;;Start a loop to clear the cell 3(Our True(1) "boolean cell" will be False(0)) only IF THE CELL 2 IS NOT ZERO AS THE OPERATION RESULT(NOT EQUAL)
 >Next cell(boolean cell)
 ;; Another trick, clear cell:
 [-]
 <
 ;; Returns and clear again(to not mess with BF pointers, it may be confusing)
 [-]
]

;; our "boolean cell" now at this point can be either 1 or 0
;; if the Cell1 is equals to Cell2 the
;; boolean cell will be 1, if not, it will
;; be 0
if (Cell3) start loop....

;; I'm working in an if example named "Secret Message.bf", if the first char of the input is equals to the stored password char then some message will be printed, if not then it will print "Wrong Password!"