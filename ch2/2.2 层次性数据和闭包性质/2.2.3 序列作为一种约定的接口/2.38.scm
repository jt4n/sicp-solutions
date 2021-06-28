#lang racket
(#%require "../../../lib/utils.scm")
(#%require "2.36.scm")

;; EXERCISE 2.38

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define fold-right accumulate)


(define (main)

  (logg (fold-right / 1 (list 1 2 3)))
  ; (1 / (2 / 3))
  
  (logg (fold-left / 1 (list 1 2 3)))
  ; ((1 / 2) / 3)
  
  (logg (fold-right list nil (list 1 2 3)))
  ; (list 1 (list 2 (list 3 nil)))
  
  (logg (fold-left list nil (list 1 2 3)))
  ; (list (list (list nil 1) 2) 3)

  ; 要使 fold-right 和 fold-left 对任何序列产生同样的结果, op 需要满足 (op x y) == (op y x)

)

(main)