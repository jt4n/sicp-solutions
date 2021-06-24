#lang racket
(#%require "../../lib/utils.scm")

; iter
(define (reverse lst)
  (define (iter remain_items result)
    (if (null? remain_items)
      result
      (iter (cdr remain_items)
            (cons (car remain_items)
                  result))))
  (iter lst '()))
    

(define (main)
  (reverse (list 1 2 3 4 5))
)

(main)

(provide reverse)