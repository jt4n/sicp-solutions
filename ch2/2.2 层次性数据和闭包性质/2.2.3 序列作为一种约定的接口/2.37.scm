#lang racket
(#%require "../../../lib/utils.scm")
(#%require "2.36.scm")

; (define (accumulate-n op init seqs)
;   (if (null? (car seqs))
;       nil
;       (cons (accumulate op init (car-n seqs))
;             (accumulate-n op init (cdr-n seqs)))))


; ; important!
; (define (car-n seqs)
;   (map car seqs))


; (define (cdr-n seqs)
;   (map cdr seqs))


;; EXERCISE 2.37

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map  (lambda (row) (dot-product v row)) 
        m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map  (lambda (row) (matrix-*-vector cols row)) 
          m)))


(define (main)

  (define mat1
    (list (list 1 2 3 4)
          (list 4 5 6 6)
          (list 6 7 8 9)))

  (define mat2
    (list (list 1 0 0)
          (list 1 0 0)
          (list 0 0 1)
          (list 0 0 1)))
  
  (define vec1
    (list 1 
          1 
          0 
          1))

  (logg 
    (matrix-*-vector mat1 vec1))

  (logg 
    (transpose mat1))

  (logg 
    (matrix-*-matrix mat1 mat2))

  ; (7 15 22) 
  ; ((1 4 6) (2 5 7) (3 6 8) (4 6 9)) 
  ; ((3 0 7) (9 0 12) (13 0 17)) 

)

(main)