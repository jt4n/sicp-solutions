#lang racket
(define (logg . args)
        (for-each (lambda (x) (display x) (display #\space)) 
                  args)
        (newline))

(provide (all-defined-out))