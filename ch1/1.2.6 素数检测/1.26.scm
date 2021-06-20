#lang sicp
;;EXERCISE 1.26

;; O(n) 版本
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


;; O(lgn) 版本
(define (square x)
    (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))   

;; 解答
;; 用 square 只传入一个参数, 则每一层递归 (expmod base (/ exp 2)) 只求值 1 次, 总共需要 lg exp 步,
;; 用 * 传入两个参数, 则每一层递归 (expmod base (/ exp 2)) 求值 2 次, 画成递归树, 每层分支数都要 * 2, 总共需要 2^(lg exp) 步

;; 回忆一下, 空间复杂度正比于递归树的最大深度, 时间复杂度正比于递归树的节点总数                  