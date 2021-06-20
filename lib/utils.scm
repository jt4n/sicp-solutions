#lang racket
(define (logg . args)
        (for-each (lambda (x) (display x) (display #\space)) 
                  args)
        (newline))

(define (square x) (* x x))

(define (cube x) (* x x x))

(provide (all-defined-out))