#lang sicp
;; prime?
(define (square x)
    (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (next test_divisor)
    (if (= test_divisor 2)
        3
        (+ 2 test_divisor)))


; cal time of prime test
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
        (begin  (newline) 
                (display n) 
                (report-prime (- (runtime) start-time)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


;; search-for-primes
(define (search-for-primes odd_num count)
    (timed-prime-test odd_num)
    (if (prime? odd_num)
        (if (> count 1)
            (search-for-primes (+ 2 odd_num) (- count 1)))
        (search-for-primes (+ 2 odd_num) count)))


(define (main)
    ; (search-for-primes 1001 3)
    ; (search-for-primes 10001 3)
    ; (search-for-primes 100001 3)
    ; (search-for-primes 1000001 3)

    (search-for-primes 1000001 3)
    (search-for-primes 10000001 3)
    (search-for-primes 100000001 3)
    (search-for-primes 1000000001 3)
)

(main)

; 1000003 *** 118
; 1000033 *** 62
; 1000037 *** 60
; 10000019 *** 129
; 10000079 *** 1647
; 10000103 *** 142
; 100000007 *** 344
; 100000037 *** 344
; 100000039 *** 341
; 1000000007 *** 1687
; 1000000009 *** 6096
; 1000000021 *** 2291