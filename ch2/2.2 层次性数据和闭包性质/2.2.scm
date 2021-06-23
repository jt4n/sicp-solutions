#lang racket
(#%require "../../lib/utils.scm")
; (#%require "../../lib/ch2.scm")

; cons car cdr
(define (make_segment start end)
  (cons start end))

(define (start_segment segment)
  (car segment))

(define (end_segment segment)
  (cdr segment))

(define (make_point x y)
  (cons x y))

(define (x_point point)
  (car point))

(define (y_point point)
  (cdr point))

(define (average x y)
    (/ (+ x y)
       2.0))

(define (midpoint_segment segment)
  (let ((s segment))
    (let ((start (start_segment s))
          (end (end_segment s)))
      (make_point (average  (x_point (start_segment s))
                          (x_point (end_segment s)))
                (average  (y_point (start_segment s))
                          (y_point (end_segment s)))))))


;; EXERCISE 2.2
(define (print_point p)
  (newline)
  (display "(")
  (display (x_point p))
  (display ",")
  (display (y_point p))
  (display ")"))

(define (main)
  (print_point 
            (midpoint_segment (make_segment   (make_point 0 0) 
                                              (make_point 10 20))))
)

(main)