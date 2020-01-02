
 ;;; Definition of the sqrt procedure according to the section 1.1.7 of the book.

 (define (abs x)
         (if (< x 0)
             (- x)
             x))

 (define (square x) (* x x))

 (define (average-2 a b)
         (/ (+ a b) 2))

 (define (improve-sqrt-guess guess x)
         (average-2 guess (/ x guess)))

 (define sqrt-min-difference 0.001)

 (define (sqrt-good-enough? guess x)
         (< (abs (- (square guess) x)) sqrt-min-difference))

 (define (sqrt-iter guess x)
         (if (sqrt-good-enough? guess x)
              guess
              (sqrt-iter (improve-sqrt-guess guess x) x)))

 (define (sqrt x)
         (sqrt-iter 1.0 x))

 (sqrt 81)

 ;;; Solution to the exercise 1.6:
 
 (define (new-if predicate then-clause else-clause)
         (cond (predicate then-clause)
               (else else-clause)))

 (new-if (= 2 3) 0 5)
 (new-if (= 1 1) 0 5)

 (define (sqrt-iter guess x)
         (new-if (good-enough? guess x)
                 guess
                 (sqrt-iter (improve-sqrt-guess guess x) x)))

 (sqrt 9)

 ;;; The maximum recursion depth is exceeded. The reason for this is that the Scheme interpreter uses 
 ;;; the applicative-order evaluation method for ordinary procedures, which first evaluates the 
 ;;; arguments to them evaluate and apply the operator. That being said, the interpreter evaluates the else-clause in the 
 ;;; sqrt-iter procedure, and since it doesen't have a base case (the interpreter just keeps on calling 
 ;;; the procedure over and over again), the recursion never stops.

