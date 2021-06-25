#lang sicp
(define (logg . args)
        (for-each (lambda (x) (display x) (display #\space)) 
                  args)
        (newline))

;; wrong!
; (define (double f)
;   (define (g x) (f (f x)))
;   (g x))

(define (double f)
  (lambda (x) (f (f x))))


(define (main)
  (logg ((double inc) 5))
  ; 7
  ; f = inc
  ; f2 = (double f) = (inc (inc))
  ; inc^2

  (logg (((double double) inc) 5))
  ; 9
  ; f3 = (double f2) = (f2 (f2))
  ; (inc^(2^2)) = (inc^4)

  (logg (((double (double double)) inc) 5))
  ; 21
  ; f4 = (double f3) = (f3 (f3))
  ; (inc^(4^2)) = (inc^16)

)

(main)