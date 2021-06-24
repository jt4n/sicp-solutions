#lang racket
(#%require "../../lib/utils.scm")

; (define (same-parity first . others)
;   (define (filter result others)
;     (if (null? others)
;       result
;       (if (equal? (even? first) 
;                   (even? (car others))) 
;         (filter (cons (car others) result) (cdr others))
;         (filter result (cdr others)))))
;   (filter '() 
;           (reverse (cons first others))))

(define (same-parity2 first . others)
  (filter (if (even? first)
            even?
            odd?)
          (cons first others)))

(define (main)
  (logg
    (same-parity 1 2 3 4 5 6 7 9))
)

(main)

