#lang racket
(#%require "../../../lib/utils.scm")

(define (cons a b)
  (*  (expt 2 a)
      (expt 3 b)))

; 注意到 2 和 3 互质
; 递归
(define (car c)
  (if (= (remainder c 2) 0)
    (+ 1 (car (/ c 2)))
    0))

(define (cdr c)
  (if (= (remainder c 3) 0)
    (+ 1 (cdr (/ c 3)))
    0))


(define (main)
  (logg (cons 3 2))
  (logg (car (cons 3 2)))
  (logg (cdr (cons 3 2)))

)

(main)

