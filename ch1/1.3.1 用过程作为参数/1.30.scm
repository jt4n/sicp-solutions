#lang sicp
(define (cube x) (* x x x))

(define (sum_iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))))
    
    (iter a 0))

(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (sum_iter cube a inc b))


(define (main)
    (sum-cubes 1 3)
)

(main)

