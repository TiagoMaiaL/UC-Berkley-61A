
; For the first procedure:
; (define (+ a b)
;         (if (= a 0)
;             b
;             (inc (+ (dec a) b))))
;
; The generated process would be as follows:
; (+ 4 5)
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9
; The shape of the process follows the "expand and then reduce" shape,
; this happens because the procedure defers the value until the base case
; is reached.
; Such a process is defined as linear recursive process.

; For the second procedure:
; (define (+ a b)
;         (if (= a 0)
;             b
;             (+ (dec a) (inc b))))
;
; The generated process would be as follows:
; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9
; The shape of the previous process is linear, which is
; iterative. It doesn't defer the computation of the values, it instead
; uses the state variables that hold where the iterative computation is.
; Such a process is called a linear iterative process.
