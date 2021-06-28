#lang racket
(#%require "../../../lib/utils.scm")

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) 
                                  y)) 
              nil 
              sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 
              0 
              sequence))


(define (main)
  (define l1 (list 1 2 3 4))
  
  (logg
    (map square l1))

  (logg
    (append l1 (list 5 6 7 8)))

  (logg
    (length l1))
  
)

(main)






















