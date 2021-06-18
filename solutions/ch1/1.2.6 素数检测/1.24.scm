#lang sicp
;; fast-prime?
;; 费马检查
(define (square x)
    (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


; cal time of prime test
(define (prime? n)
    (fast-prime? n 10))

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
    (search-for-primes 1000001 3)
    (search-for-primes 10000001 3)
    (search-for-primes 100000001 3)
    (search-for-primes 1000000001 3)
)

(main)


; 1000003 *** 102
; 1000033 *** 48
; 1000037 *** 46
; 10000019 *** 49
; 10000079 *** 52
; 10000103 *** 50
; 100000007 *** 51
; 100000037 *** 53
; 100000039 *** 53
; 1000000007 *** 58
; 1000000009 *** 53
; 1000000021 *** 54