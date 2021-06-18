#lang sicp
(define (log . args)
    (for-each (lambda (x) (display x) (display #\space)) args)
    (newline))


(define (fast-expt b n)
    (define (iter b n a)
        (if (= n 0)
            a
            (if (even? n)
                ; b^n => (b^2)^(n/2) * a
                (iter   (square b)      ; new b
                        (/ n 2)         ; new n
                        a)              ; new a
                ; b^n => b^(n-1) * (b*a)
                (iter   b               ; new b
                        (- n 1)         ; new n
                        (* b a)))))     ; new a

    (iter b n 1)
)

(define (even? n)
  (= (remainder n 2) 0))

(define square (lambda (x) (* x x)))


(define (main)
    (log (fast-expt 4 6))
    (log (fast-expt 2 11))

)

(main)