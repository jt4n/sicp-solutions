#lang racket
(#%require "../../../lib/utils.scm")

(define (for-each proc lst)
  (if (not (null? lst))
    (begin  (proc (car lst))
            (for-each proc (cdr lst)))
    nil))

(define (main)
  (for-each (lambda (x) (newline) (display x))
            (list 57 321 88))
)

(main)

