#lang racket
(#%require "../../../lib/utils.scm")


(define (main)
  (define l1
    '(1 3 (5 7) 9))

  (define l2
    '((7)))

  (define l3
    '(1 (2 (3 (4 (5 (6 7)))))))

  (logg
    (cadr (caddr l1)))

  (logg
    (car (car l2)))

  (logg
    (cadr (cadr (cadr (cadr (cadr (cadr l3)))))))

)

(main)
