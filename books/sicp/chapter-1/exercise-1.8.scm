  
  ;;; Solution to the exercise 1.8:
  
  (define (cube x) (* (square x) x))

  (define cube-min-difference 0.1)

  (define (average x y z) (/ (+ x y z) 3))

  (define (improve-guess guess x)
          (average (/ x (square guess)) guess guess))
 
  (define (good-enough? guess x)
          (< (abs (- (cube guess) x)) cube-min-difference))

  (define (cubic-iter guess x)
          (if (good-enough? guess x)
              guess
              (cubic-iter (improve-guess guess x) x)))

  (define (cubic-root x)
          (cubic-iter 1.0 x))
