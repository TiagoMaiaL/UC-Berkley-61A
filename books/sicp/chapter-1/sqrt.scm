
 ;;; sqrt procedure using block-structure:

 (define (abs x)
         (if (< x 0)
             (- x)
             x))

 (define (square x)
         (* x x))

 (define (sqrt x)
         (define (average a b)
                 (/ (+ a b) 2))

         (define (improve guess)
                 (average guess (/ x guess)))

         (define threshold 0.0001)

         (define (good-enough? guess)
                 (<= (abs (- (square guess) x))
                     threshold))

         (define (sqrt-iter guess)
                 (if (good-enough? guess)
                     guess
                     (sqrt-iter (improve guess))))

         (sqrt-iter 1.0))

