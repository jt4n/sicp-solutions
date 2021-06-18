#lang sicp
(define (log . args)
    (for-each (lambda (x) (display x) (display #\space)) args)
    (newline))

(define (multi a b)
    ; a * b = 2 * (a * (b / 2))
    
    (if (= b 0)
        0
        (if (even? b)
            (double (multi  a 
                        (halve b)))
            (+ a 
                (multi  a 
                    (- b 1)))))
)

(define double (lambda (x) (+ x x)))

(define halve (lambda (x) (/ x 2)))

(define (even? n)
  (= (remainder n 2) 0))

(define (main)
    (log (multi 3 4))
    (log (multi 5 7))
)

(main)