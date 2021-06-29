#lang racket
(#%require "../../../lib/utils.scm")
(#%require "2.36.scm")

;;Nested mappings

;: (accumulate append
;:             nil
;:             (map (lambda (i)
;:                    (map (lambda (j) (list i j))
;:                         (enumerate-interval 1 (- i 1))))
;:                  (enumerate-interval 1 n)))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
            (enumerate-interval 1 (- i 1))))
      (enumerate-interval 1 n)))

(define (main)
  ; (logg
  ;   (unique-pairs 5))

  (logg
    (prime-sum-pairs 6))
)

(main)