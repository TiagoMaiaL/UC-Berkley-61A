
  ;;; Linearly recursive process:
  (define (factorial n)
          (if (= n 1) 
              1
              (* n (factorial (- n 1)))))

  ;;; Linearly iterative process:
  (define (factorial n)
          (define (factorial-iter n product count)
                  (if (> count n)
                      product
                      (factorial-iter n (* product count) (+ count 1))))
          (factorial-iter n 1 1))
