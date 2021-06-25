;;EXERCISE 1.19

;; O(n) 的迭代斐波那契
; (define (fib n)
;   (fib-iter 1 0 n))

; (define (fib-iter a b count)
;   (if (= count 0)
;       b
;       (fib-iter (+ a b) a (- count 1))))


;; O(lgn) 的斐波那契
; apply Tpq to (a,b) => a = bq + a(p + q), 
;                    => b = bp + aq

; apply (Tpq)^2 to (a, b) => a = (bp + aq)q + (bq + a(p + q))(p + q) = b(q^2 + 2pq) + a(p^2 + 2q^2 + 2pq)
;                         => b = (bp + aq)p + (bq + a(p + q))q = b(p^2 + q^2) + a(q^2 + 2pq)

; mark (Tpq)^2 as (Tp'q'), then p' = p^2 + q^2,
;                               q' = q^2 + 2pq

; when n is even, we can replace (Tpq^2) as Tp'q' to reduce a half computing step 

#lang sicp
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (square q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(define (square x)
    (* x x))