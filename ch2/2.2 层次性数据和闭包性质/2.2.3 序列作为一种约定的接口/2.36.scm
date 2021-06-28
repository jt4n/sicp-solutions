#lang racket
(#%require "../../../lib/utils.scm")

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; EXERCISE 2.36
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (car-n seqs))
            (accumulate-n op init (cdr-n seqs)))))


; important!
(define (car-n seqs)
  (map car seqs))


(define (cdr-n seqs)
  (map cdr seqs))


; (accumulate-n + 0 (list (list 1 2 3)
;                         (list 4 5 6)
;                         (list 7 8 9)
;                         (list 10 11 12)))

; (cons (accumulate + 0 (list 1 4 7 10))
;       (accumulate-n + 0 (list (list 2 3)
;                               (list 5 6)
;                               (list 8 9)
;                               (list 11 12))))

; (cons (accumulate + 0 (list 1 4 7 10))
;     (cons (accumulate + 0 (list 2 5 8 11))
;           (accumulate-n + 0 (list (list 3)
;                                   (list 6)
;                                   (list 9)
;                                   (list 12)))))

; (cons (accumulate + 0 (list 1 4 7 10))
;     (cons (accumulate + 0 (list 2 5 8 11))
;         (cons (accumulate + 0 (list 3 6 9 12))
;               (accumulate-n + 0 (list '()
;                                       '()
;                                       '()
;                                       '())))))

; (cons (accumulate + 0 (list 1 4 7 10))
;     (cons (accumulate + 0 (list 2 5 8 11))
;         (cons (accumulate + 0 (list 3 6 9 12))
;               '())))

; (cons 22 (cons 26 (cons 30 '())))

; (list 22 26 30)


(define (main)

  (define l1
    (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

  (logg
    (cdr-n l1))

  (logg 
    (accumulate-n + 0 l1))

)

(main)


























