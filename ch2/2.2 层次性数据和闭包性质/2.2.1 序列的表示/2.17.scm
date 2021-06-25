#lang racket
(#%require "../../../lib/utils.scm")

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (last-pair list)
  (if (= 1 (length list))
    (car list)
    (last-pair (cdr list))))



(define (main)
  (last-pair (list 23 72 149 34))
)

(main)