#lang sicp
(#%require "../../lib/utils.scm")

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f time)
  (if (= time 1)
    f
    (compose  f 
              (repeated f (- time 1)))))

(define (smooth f)
  (define dx 0.00001)
  (define (average x y z)
    (/ (+ x y z) 3.0))

  (lambda (x) (average  (f (- x dx))
                        (f x)
                        (f (+ x dx)))))


(define (multiple_smooth f time init_x)
  (let ((smooth_by_time (repeated smooth time)))
    ((smooth_by_time f) init_x)))


(define (main)
  (multiple_smooth square 10 5)
)

(main)