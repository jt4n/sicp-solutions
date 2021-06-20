#lang sicp

(define (f g)
  (g 2))

;: (f square)
;; 4

;: (f (lambda (z) (* z (+ z 1))))
;; 6

;; (f f)
;; (define (f g) (g 2)) <=> (define f (lambda (g) (g 2)))
;; (f f) => (f (lambda (g) (g 2))) => ((lambda (g) (g 2)) (lambda (g) (g 2)))
;; => 为避免混淆, 改写一下形式参数 => ((lambda ([]) ([] 2)) (lambda (g) (g 2))) 
;; => ((lambda (g) (g 2))) 2) => (2 2)

;; 因为 2 不是一个 procedure, 所以解释器报错
;; application: not a procedure;
;; expected a procedure that can be applied to arguments
;; given: 2

;; 这道题重点在于理解, 在定义时: 
;; (define (func_name []) []) 是 (define func_name (lambda ([]) [])) 的语法糖
;; 在调用时:
;; (func_name x) 是 ((lambda ([]) []) x) 的语法糖