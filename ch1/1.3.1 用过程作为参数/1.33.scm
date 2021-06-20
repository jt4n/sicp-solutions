#lang sicp
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
; (define (accumulate_iter combiner null_value term a next b)
;     (define (iter a result)
;         (if (> a b)
;             result
;             (iter   (next a)
;                     (combiner   result 
;                                 (term a)))))

;     (iter a null_value))


(define (filtered-accumulate filter combiner null_value term a next b)
    (cond   ((> a b) 
                null_value)
            ((filter a) 
                (combiner   (term a) 
                            (filtered-accumulate    filter
                                                    combiner 
                                                    null_value 
                                                    term 
                                                    (next a) 
                                                    next 
                                                    b)))
            (else 
                (filtered-accumulate    filter 
                                        combiner 
                                        null_value 
                                        term 
                                        (next a) 
                                        next 
                                        b))))


;; prime?
(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (and  (= n (smallest-divisor n))
        (> n 1)))


(define (sum_co_prime n)
    ;; 小于 n 的所有与 n 互素的正整数
    (define (co_prime? i)
        (= (gcd i n) 1))
        
    (filtered-accumulate co_prime? + 0 (lambda (x) x) 0 (lambda (x) (+ 1 x)) n))




(define (main)
    (define (LOG . args)
        (for-each (lambda (x) (display x) (display #\space)) args)
        (newline))

    ; 2 3 5 7 11 13
    (LOG (filtered-accumulate   prime? 
                                + 
                                0 
                                (lambda (x) x) 
                                1 
                                (lambda (x) (+ 1 x)) 
                                15))

    ; 1 3 7 9
    (LOG (sum_co_prime 10))
)

(main)
