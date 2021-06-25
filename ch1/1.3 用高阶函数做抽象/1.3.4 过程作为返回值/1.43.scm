#lang sicp
(#%require "../../../lib/utils.scm")

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f time)
  (if (= time 1)
    f
    (compose  f 
              (repeated f (- time 1)))))


(define (main)
  (logg ((repeated square 2) 5))

  (logg ((repeated square 3) 2))

)

(main)