#lang sicp
(define (product_recur term a next b)
    (accumulate * 1 term a next b))


(define (sum_iter term a next b)
    (accumulate_iter + 0 term a next b))


; recursive
(define (accumulate combiner null_value term a next b)
    (if (> a b)
        null_value
        (combiner   (term a) 
                    (accumulate combiner 
                                null_value 
                                term 
                                (next a) 
                                next 
                                b))))

; iterable
(define (accumulate_iter combiner null_value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter   (next a)
                    (combiner   result 
                                (term a)))))

    (iter a null_value))


(define (main)
    (define (LOG . args)
        (for-each (lambda (x) (display x) (display #\space)) args)
        (newline))

    ; 1 3 5 7 9
    (LOG (product_recur (lambda (x) x)
                        1
                        (lambda (x) (+ 2 x))
                        9))

    (LOG (sum_iter (lambda (x) x)
                        1
                        (lambda (x) (+ 2 x))
                        9))
    
)

(main)
