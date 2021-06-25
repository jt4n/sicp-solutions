#lang racket
(#%require "../../../lib/utils.scm")

; fringe 边缘
(define (fringe lst)
  (cond ((null? lst) nil)
        ((not (pair? lst)) (list lst))
        (else (append (fringe (car lst))
                      ; important to use cadr, but not cdr 
                      (fringe (car (cdr lst)))))))

(define (main)
  ;; EXERCISE 2.28

  (define x (list (list 1 2) (list 3 4)))
  (logg
    "x, " x)
  (logg 
    "(fringe x), " (fringe x))
  (logg 
    "(fringe (list x x)), " (fringe (list x x)))
)

(main)

