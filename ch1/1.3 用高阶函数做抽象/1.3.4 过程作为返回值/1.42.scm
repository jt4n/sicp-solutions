#lang sicp
(#%require "../../../lib/utils.scm")

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (main)
  (logg ((compose square inc) 6))
)

(main)