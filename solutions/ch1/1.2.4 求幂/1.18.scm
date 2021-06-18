#lang sicp
(define (log . args)
    (for-each (lambda (x) (display x) (display #\space)) args)
    (newline))


; 将 1.17 改成迭代计算过程
(define (multi_iter a b)
    (define (iter a b product)
        (if (= b 0)
            product
            (if (even? b)
                (iter   (double a) 
                        (halve b) 
                        product)
                (iter   a 
                        (- b 1) 
                        (+ product a)))))

    (iter a b 0)                
)


(define double (lambda (x) (+ x x)))

(define halve (lambda (x) (/ x 2)))

(define (even? n)
  (= (remainder n 2) 0))

(define (main)
    (log (multi_iter 3 4))
    (log (multi_iter 5 7))
    (log (multi_iter 11 20))
)

(main)