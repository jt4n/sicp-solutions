#lang sicp
(define (LOG . args)
        (for-each   (lambda (x) (display x) (display #\space)) 
                    args)
        (newline))

(define (cont-frac n d k)
    (define (cf i)
        (if (= i k)
            (/  (n i)
                (d i))
            (/  (n i) 
                (+  (d i)
                    (cf (+ i 1))))))

    (cf 1))


(define (cont-frac-iter n d k)
    (define (iter k result)
        (if (< k 1)
            result
            (let ((result   (/  (n k)
                                (+  (d k)
                                    result))))
                (iter (- k 1) result))))
                
    (iter k 0))


(define (main)
    ; target: 0.6180
    
    ; k = 11
    (LOG 
        (cont-frac  (lambda (i) 1.0)
                    (lambda (i) 1.0)
                    11))
    ; 0.6180555555555556

    ; k = 11
    (LOG 
        (cont-frac-iter     (lambda (i) 1.0)
                            (lambda (i) 1.0)
                            11))
    ; 0.6180555555555556
)

(main)

