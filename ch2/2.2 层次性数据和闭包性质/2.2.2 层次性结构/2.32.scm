#lang racket
(#%require "../../../lib/utils.scm")

;; EXERCISE 2.32
(define (subsets s)
  (define (make-set x)
    (cons (car s) x))

  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map make-set 
                          rest)))))


(define (main)
  (subsets (list 1 2 3))
  ; '(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

  ; 过程解释: 
  ; (list 1 2 3) = (cons 1 (cons 2 (cons 3 nil))) 

  ; (let ((rest (subsets (cdr s)))):
  ; 1> rest = (subsets (2 3))
  ; 2> rest = (subsets (3)) 
  ; 3> rest = (subsets ())
  
  ; (list nil)
  ; 4> rest = (())
  
  ; (append rest (map make-set rest))
  ; 5> (cons 3 x) => map => (())
  ;    (() (3))
  ; 6> (cons 2 x) => map => (() (3))
  ;    (() (3) (2) (2 3))
  ; 7> (cons 1 x) => map => (() (3) (2) (2 3))
  ;    (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
)

(main)






















