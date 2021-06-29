#lang racket
(#%require "../../../lib/utils.scm")
(#%require "2.36.scm")

(provide flatmap)

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
            (enumerate-interval 1 (- i 1))))
      (enumerate-interval 1 n)))


(define (unique-triples n)
    (flatmap
        (lambda (i)
            (map (lambda (j) (cons i j))
                ; each j is a unique-pairs
                (unique-pairs (- i 1))))
        (enumerate-interval 1 n)))

(define (sum-equal? sum triple)
  (equal? sum
          (accumulate + 0 triple)))

(define (filtering sum triples)
  ; filter 只能接收一个参数, 为了让它接受两个参数, 在外面包一层传递参数 
  (filter (lambda (triple) (sum-equal? sum triple))
          triples))

(define (unique-triples-with-sum n s)
  (filtering s (unique-triples n)))


(define (main)
  ; (logg
  ;   (unique-pairs 5))

  ; (logg 
  ;   (unique-triples 6))

  ; (logg
  ;   (sum-equal? 6 (list 1 2 3)))

  ; (logg
  ;   (sum-equal? 7 (list 1 2 3)))

  (logg 
    (unique-triples-with-sum 6 12))
)

; (main)