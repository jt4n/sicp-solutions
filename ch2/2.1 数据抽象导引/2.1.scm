#lang sicp
(#%require "../../lib/utils.scm")
; (#%require "../../lib/ch2support.scm")

;;;SECTION 2.1.1
;;;from section 1.2.5, for Section 2.1.1
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(define (make-rat n d)
    (if (< d 0)
      (cons (- n) (- d))
      (cons n d)))
    

(define (main)
  (print-rat (make-rat 3 18))
  (print-rat (make-rat -3 18))
  (print-rat (make-rat 3 -18))
  (print-rat (make-rat -3 -18))
)

(main)