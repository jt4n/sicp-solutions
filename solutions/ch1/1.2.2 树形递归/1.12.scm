; 递归计算过程计算帕斯卡三角形
; 边界上都是 1, 内部每个数是它上面两个数之和
; pascal(i)(1) = 1, pascal(i)(i) = 1, pascal(i)(j) = pascal(i-1)(j-1) + pascal(i-1)(j)

#lang sicp
(define (log . args)
    (for-each (lambda (x) (display x) (display #\space)) args)
    (newline))

(define (pascal i j)
    (cond   ((or (< i 1) (< j 1))   
                (error "wrong input"))
            
            ((or (= j 1) (= j i))   
                1)
            
            (else   (+  (pascal (- i 1) 
                                (- j 1))
                        (pascal (- i 1) 
                                j))))
)

(define (main)
    ; (log (pascal 0 0))
    (log (pascal 2 1))
    (log (pascal 2 2))
    (log (pascal 5 2))    
    (log (pascal 5 3))  
)

(main)