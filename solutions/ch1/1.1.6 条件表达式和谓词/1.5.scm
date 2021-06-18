(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))


; 如果是应用序, "(test 0 (p))" 中的 "(p)" 会被执行, 导致无限 loop;
; 如果是正则序, "(test 0 (p))" 会被解析成 "(if (= 0 0) 0 (p))", 返回 0, "(p)" 不会执行.