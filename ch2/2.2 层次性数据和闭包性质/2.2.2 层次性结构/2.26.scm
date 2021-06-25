#lang racket
(#%require "../../../lib/utils.scm")

(define (main)
  ;; EXERCISE 2.26
  (define x (list 1 2 3))
  (define y (list 4 5 6))
 
  (logg (append x y))
  ; (1 2 3 4 5 6)

  (logg (cons x y))
  ; ((1 2 3) 4 5 6) 

  (logg (list x y))
  ; ((1 2 3) (4 5 6)) 

  (cons x (cons y '()))
  ; '((1 2 3) (4 5 6))
)

(main)

