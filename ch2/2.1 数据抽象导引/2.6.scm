#lang racket
(#%require "../../lib/utils.scm")

;; EXERCISE 2.6
; 这个练习实现了 Church 计数系统, 里面没有传统意义的"数", 只有数的"行为"和"约束"
; 例如定义 zero 是一种行为, add-1 是一种行为, one 也是一种行为
; 而 (add-1 zero) = one, (add-1 one) = two 则是约束
; 行为和约束共同定义了数据 -- Church 数

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


; (add-1 zero) => (add-1 (lambda (f) (lambda (x) x)))
; => ((lambda n (lambda (f) (lambda (x) (f ((n f) x))))) (lambda (f) (lambda (x) x)))
; => (lambda (f) 
;               (lambda (x) 
;                           (f (((lambda (f) (lambda (x) x)) f) x))))
; => (lambda (f) 
;               (lambda (x) 
;                           (f ((lambda (x) x) x))))
; => (lambda (f) 
;               (lambda (x) 
;                           (f x)))
; => (lambda (f) 
;               (lambda (x) (f x)))     

; zero 是一个函数, 接收参数 f, x, 不管传进什么 f, 它的行为总是 (lambda (x) x), 即返回一个不变的 x
; add-1 也是一个函数, 接收参数 n, f, x, 行为是 (f ((n f) x)))

; one
; 由语义一致性, one = (add-1 zero)
(define one
  (lambda (f) 
              (lambda (x) 
                          (f x))))

; two
; 由语义一致性, two = (add-1 one)
; (add-1 one) => (add-1 (lambda (f) (lambda (x) (f x))))
; => ((lambda n 
;               (lambda (f) 
;                           (lambda (x) 
;                                       (f ((n f) x))))) (lambda (f) (lambda (x) (f x))))
; => (lambda (f) 
;               (lambda (x) 
;                           (f (((lambda (f) (lambda (x) (f x))) f) x))))
; => (lambda (f) 
;               (lambda (x) 
;                           (f (f x))))
(define two
  (lambda (f) 
              (lambda (x) 
                          (f (f x)))))

; +
; 由语义一致性, (+ one one) = two
(define +
  (lambda (p1) 
    (lambda (p2) 
      (lambda (f) 
        (lambda (x) 
          ((p1 f) 
                  ((p2 f) 
                          x)))))))


(define (main)

  (logg 
        ((one (lambda (x) (* 2 x))) 1)) 

  (logg 
        ((two (lambda (x) (* 2 x))) 1))

  (logg
        ((((+ 
              one) 
                  two) 
                      (lambda (x) (* 2 x))) 
                                            1))
)

(main)

