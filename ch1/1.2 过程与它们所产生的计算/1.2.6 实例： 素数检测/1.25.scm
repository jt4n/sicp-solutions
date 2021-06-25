;; 解答
; 在 expmod 中, 每一层递归调用都执行一次 (remainder ...), 
; 它返回值是一个对 m 取模的余数, 大小不会超过 m, 这样做的好处是限制了每一层 expmod 中间结果的规模, 避免陷入长时间等待递归返回

; 而在 expmod2 中, 是先求出幂后, 再一次性执行 (remainder ...), 
; 当数字规模很大时, 计算幂的过程会很漫长, 程序会陷入等待

#lang sicp
(define (log . args)
    (for-each (lambda (x) (display x) (display #\space)) args)
    (newline))

(define (square x)
    (* x x))

;; expmod
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

;; expmod2
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))

(define (main)
    (log (expmod 1000000000 100000000 3))
    (log (expmod2 1000000000 100000000 3))
)

(main)