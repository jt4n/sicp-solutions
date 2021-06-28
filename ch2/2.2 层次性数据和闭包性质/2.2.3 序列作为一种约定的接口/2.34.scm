#lang racket
(#%require "../../../lib/utils.scm")

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


;; EXERCISE 2.34

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+  this-coeff 
                                                    (* x higher-terms)))
              0
              coefficient-sequence))


(define (main)

  (horner-eval 2 (list 1 3 0 5 0 1))
  
)

(main)


























