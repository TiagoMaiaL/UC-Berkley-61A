 ;;; Solution to exercise 1.7:

 ;;; For very small numbers, we'll have to try finding the square root of a number that is smaller than
 ;;; our sqrt-min-difference (which is 0.001).
 ;;; (sqrt 0.000025)

 ;;; For very large numbers (in terms of precision as well), the threshold of 0.0001 would never be reached:
 ;;; (sqrt 100000000000000)

 (define (abs x)
         (if (< x 0)
             (- x)
             x))

 (define (square x) (* x x))

 (define (average a b)
         (/ (+ a b) 2))

 (define (improve guess x)
         (average guess (/ x guess)))

 (define sqrt-min-difference 0.001)

 ;;; The proposed alternative would be:
 (define (good-enough? guess x)
         (<= (abs (- (improve guess x) guess))
             (* guess 0.0001)))

 (define (sqrt-iter guess x)
         (if (good-enough? guess x)
              guess
              (sqrt-iter (improve guess x) x)))

 (define (sqrt x)
         (sqrt-iter 1.0 x))

 ;;; Check out this page: http://community.schemewiki.org/?sicp-ex-1.7

