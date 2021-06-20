#lang sicp
(define (log . args)
    (for-each (lambda (x) (display x) (display #\space)) args)
    (newline))

(define (max x y)
    (if (> x y)
        x
        y))

(define (add-big-two x y z)
    (+ (max x y) 
        (max y z)))

(define (main)
    (log (add-big-two 2 3 5)) 
    (log (add-big-two -11 -18 0)))

(main)
