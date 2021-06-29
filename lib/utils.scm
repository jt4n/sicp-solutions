#lang racket
(provide (all-defined-out))

(define (logg . args)
        (for-each (lambda (x) (display x) (display #\space)) 
                  args)
        (newline))

; ch1
(define (square x) (* x x))

(define (cube x) (* x x x))

(define (prime? n)
        (define (smallest-divisor n)
                (find-divisor n 2))

        (define (find-divisor n test-divisor)
                (cond ((> (square test-divisor) n) n)
                        ((divides? test-divisor n) test-divisor)
                        (else (find-divisor n (+ test-divisor 1)))))

        (define (divides? a b)
                (= (remainder b a) 0))
        
        (= n (smallest-divisor n)))

; ch2
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define nil '())