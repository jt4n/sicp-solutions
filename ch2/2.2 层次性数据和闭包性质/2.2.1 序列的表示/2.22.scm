#lang racket
(#%require "../../../lib/utils.scm")

;; EXERCISE 2.22
(define (square-list-iter items)
  (define (iter things answer)
    (if (null? things)
      (reverse answer)
      (iter (cdr things)
            (cons (square (car things))
                  answer))))
  (iter items nil))

(define (main)
  (logg 
    (square-list-iter (list 1 2 3 4 5)))
)

(main)

