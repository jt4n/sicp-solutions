#lang racket
(#%require "../../lib/utils.scm")

(define (square-list items)
  (if (null? items)
    nil
    (cons (square (car items))
          (square-list (cdr items)))))

(define (square-list2 items)
  (map square items))

(define (main)
  (logg 
    (square-list (list 1 2 3 4 5)))
  
  (logg
    (square-list2 (list 1 2 3 4 5)))
)

(main)

