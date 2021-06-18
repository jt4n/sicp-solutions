; if n < 3, f(n) = n
; else if n >= 3, f(n) = f(n - 1) + 2 * f(n - 2) + 3 * f(n - 3)

#lang sicp
(define (log . args)
    (for-each (lambda (x) (display x) (display #\space)) args)
    (newline))

(define (f_recur n)
    (if (< n 3) 
        n
        (+  (f_recur (- n 1)) 
            (* 2 (f_recur (- n 2))) 
            (* 3 (f_recur (- n 3)))))
)

(define (f_iter n)
    (define (mirror x) 
            x
    )

    (define (formula x y z)
        (+  x
            (* 2 y) 
            (* 3 z))
    )

    (define (iter count p1 p2 p3 sum)
        ; p1=f(n-1)
        ; p2=f(n-2)
        ; p3=f(n-3)
        (if (= count n)
            sum
            (iter   (+ count 1) 
                    sum 
                    p1 
                    p2 
                    (formula sum p1 p2)))
    )

    (if (< n 3) 
        (mirror n)
        (iter 3 2 1 0 4)
    )
)


(define (main)
    ; (log (f_recur 0))
    ; (log (f_recur 1))
    ; (log (f_recur 2))

    (log (f_recur 3))
    (log (f_recur 4))
    (log (f_recur 10))

    (log (f_iter 3))
    (log (f_iter 4))
    (log (f_recur 10))

)

(main)