#lang racket
(#%require "../../lib/utils.scm")

;; EXERCISE 2.4
; cons 的过程性表示

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define (main)
  (logg (car (cons "front" "end")))
  (logg (cdr (cons "front" "end")))
)

(main)

; 用代换模型 验证 (car (cons x y)) 总是正确的
; (car (cons x y)) => (car (lambda (m) (m x y)))
; => ((lambda z (z (lambda (p q) p)))  (lambda (m) (m x y)))
; => ((lambda (m) (m x y)) (lambda (p q) p))
; => ((lambda (p q) p) x y)
; => x