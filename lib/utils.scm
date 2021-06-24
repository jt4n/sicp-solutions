#lang racket
(provide (all-defined-out))

(define (logg . args)
        (for-each (lambda (x) (display x) (display #\space)) 
                  args)
        (newline))

(define (square x) (* x x))

(define (cube x) (* x x x))

; for ch2
(define nil '())