#lang sicp
(define (logg . args)
        (for-each (lambda (x) (display x) (display #\space)) 
                  args)
        (newline))


(define (accumulate combiner null_value term a next b)
    (if (> a b)
      null_value
      (combiner (term a) 
                (accumulate combiner 
                            null_value 
                            term 
                            (next a) 
                            next 
                            b))))

(define (square x)
  (* x x))

(define (tan-cf x k)
    (define (d i)
      (-  (*  2
              i)
          1))
    
    (define (n i)
      (if (= i 1)
          x
          (square x)))

    (define (cf_combiner i value)
      (/  (n i)
          (-  (d i)
              value)))
    
    (accumulate cf_combiner
                0
                (lambda (x) x)
                1
                (lambda (x) (+ 1 x))
                k))
  




(define (main)
    (define pi 3.14159)

    (logg (tan-cf 0.0 1000))
    (logg (tan-cf (/ pi 4) 1000))
    (logg (tan-cf (/ pi 2) 1000))
    (logg (tan-cf (* pi 2) 1000))
    (logg (tan-cf pi 1000))
)

(main)

; 0.0 
; 0.9999986732059835 
; 753695.9951179451 
; -1.0000039803926122 
; -2.6535897933138355e-6 