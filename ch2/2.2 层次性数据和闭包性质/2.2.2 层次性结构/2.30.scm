#lang racket
(#%require "../../../lib/utils.scm")

(define (parent tree)
  (car tree))

(define (child tree)
  (cdr tree))

; simple
; (define (square-tree tree)
;   (cond ((null? tree) 
;             nil)
;         ((not (pair? tree)) 
;             (square tree))
;         (else (cons (square-tree (parent tree))
;                     (square-tree (child tree))))))

; use map
(define (square-tree tree)
  (map  (lambda (sub-tree) 
          (if (pair? sub-tree) 
            (square-tree sub-tree)
            (square sub-tree)))
            
        tree))


(define (main)
  ;; EXERCISE 2.30
  (logg 
      (square-tree
          (list 1
              (list 2 (list 3 4) 5)
                  (list 6 7))))
)

(main)

