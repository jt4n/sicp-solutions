#lang racket
(#%require "../../../lib/utils.scm")
(#%require "2.36.scm")

;; EXERCISE 2.38

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define fold-right accumulate)

; (define (accumulate op initial sequence)
;   (if (null? sequence)
;       initial
;       (op (car sequence)
;           (accumulate op initial (cdr sequence)))))


;; EXERCISE 2.39
(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

; (define (reverse sequence)
;   (fold-left (lambda (x y) (cons y x)) nil sequence))


(define (main)
  (logg
    (reverse (list 1 2 3)))
)

(main)