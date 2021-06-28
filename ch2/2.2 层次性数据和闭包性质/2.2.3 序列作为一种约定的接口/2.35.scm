#lang racket
(#%require "../../../lib/utils.scm")

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (count-leaves t)
  (accumulate +
              0
              ; sequence: 
              (map  (lambda (sub-tree)
                      (if (pair? sub-tree)
                          (count-leaves sub-tree)
                          1))
                    t)))

(define (main)
  
  (define x (cons (list 1 2) (list 3 4)))

  (logg 
    (count-leaves x))

  (logg
    (count-leaves (list x x)))

  (logg 
    (map  (lambda (sub-tree)
              (if (pair? sub-tree)
                  (count-leaves sub-tree)
                  1))
          x))
  
  (logg 
    (map  (lambda (sub-tree)
              (if (pair? sub-tree)
                  (count-leaves sub-tree)
                  1))
          (list x x)))
)

(main)


























