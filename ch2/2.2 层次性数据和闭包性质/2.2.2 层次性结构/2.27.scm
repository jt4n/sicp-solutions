#lang racket
(#%require "../../../lib/utils.scm")

; (define (reverse lst)
;   (define (iter remain_items result)
;     (if (null? remain_items)
;       result
;       (iter (cdr remain_items)
;             (cons (car remain_items)
;                   result))))
;   (iter lst '()))

; 在循环里用递归
(define (deep-reverse lst)
  (define (recursive_reverse items)
    (if (pair? items)
      (deep-reverse items)
      items))

  (define (iter remain_items result)
    (if (null? remain_items)
      result
      (iter (cdr remain_items)
            ; 在这里递归地逆序处理, 
            ; 注意 result 已经在上一层循环中 reverse 过了, 
            ; 所以递归 reverse 只需要对 (car remain_items) 做行
            (cons (recursive_reverse (car remain_items))
                  result))))

  (iter lst '()))


(define (main)
  ;; EXERCISE 2.27
  (define x (list (list 1 2) (list 3 4)))
  (logg x)
  (logg (reverse x))
  (logg (deep-reverse x))
)

(main)

