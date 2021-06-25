#lang sicp
(define (cube x) (* x x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson_integral f a b n)
    (define h 
        (/ (- b a) n))

    (define (y k)
        (f (+ a (* k h))))

    (define (factor k)
        (cond   ((or (= k 0) (= k n)) 
                    1)
                ((even? k) 
                    2)
                (else 
                    4)))
    
    ; important!
    (define (term k)
        (*  (factor k) 
            (y k)))

    (define (next_k k) 
        (+ 1 k))

    (*  (/ h 3)
        (sum term 0 next_k n))
)


(define (main)
    (display (simpson_integral cube 0 1 100.0))
    (newline)
    (display (simpson_integral cube 0 1 1000.0))
)

(main)