#lang sicp
(define (LOG . args)
    (for-each (lambda (x) (display x) (display #\space)) args)
    (newline))


(define (product_recur term a next b)
  (if (> a b)
      1
      (* (term a)
         (product_recur term (next a) next b))))

(define (product_iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter   (next a)  
                    (* result (term a)))))
    (iter a 1))

(define (factorial n)
    (product_iter   (lambda (x) x)
                    1  
                    (lambda (x) (+ 1 x))
                    n))

(define (cal_pi end)
    (define (term x)
        (/  (*  (- x 1)
                (+ x 1))
            (* x x)))
    
    (define (next x) 
        (+ x 2))
    
    (* (product_iter term 3.0 next end)
        4))
    

(define (main)
    (LOG (factorial 5))

    (LOG (cal_pi 99999))
    ; 3.1416083615923225
)

(main)
