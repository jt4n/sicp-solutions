;;EXERCISE 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;: (new-if (= 2 3) 0 5)

;: (new-if (= 1 1) 0 5)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))


; 1) 在 scheme 中 if 是一种特殊形式, 当它的 predicate 为真时， then-clause 分支会被求值，否则 else-clause 分支被求值，两个 clause 只有一个会被求值.
; 2) 而自定义的 new-if 是一个普通函数, 根据 scheme 解释器的应用序求值顺序, 所有参数都先被求值, 然后再对整条表达式求值.
; 3) 所以用 new-if 无论 predicate 是否为真, then-clause 和 else-clause 都会被执行, 造成递归深度超出解释器的限制.