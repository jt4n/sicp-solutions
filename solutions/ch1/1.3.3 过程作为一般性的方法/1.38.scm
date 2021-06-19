#lang sicp
(define (logg . args)
        (for-each   (lambda (x) (display x) (display #\space)) 
                    args)
        (newline))


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


(define (cont_frac n d k)
    (define (cf_combiner i value)
        (/  (n i)
            (+  (d i)
                value)))

    (accumulate cf_combiner
                0
                (lambda (x) x)
                1
                (lambda (x) (+ 1 x))
                k))


(define (d i)
    (cond   ((= (remainder  (-  i 
                                2) 
                            3) 
                0)
                (*  2
                    (+  1
                        (/  (-  i 
                                2) 
                            3))))
            (else 1)))  



(define (main)
    ; target: e

    (+  2
        (cont_frac  (lambda (i) 1.0)
                    d
                    11))
                    
    ; 2.7182818352059925

)

(main)

