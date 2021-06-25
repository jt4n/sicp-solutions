#lang racket
(#%require "../../../lib/utils.scm")
(#%require "2.2.scm")

; 表示法 1
; (define (make_rect top_seg down_seg left_seg right_seg)
;   (let ((lengths (cons top_seg down_seg))
;         (widths (cons left_seg right_seg)))
;     (cons lengths widths)))

; (define (length_of_rect rect)
;   (car (car rect)))

; (define (width_of_rect rect)
;   (car (cdr rect)))

; 表示法 2
(define (make_rect2 top_seg left_seg)
  (cons top_seg left_seg))

(define (length_of_rect rect)
  (car rect))

(define (width_of_rect rect)
  (cdr rect))


(define (length_of_segment seg)
  (let ((start 
              (start_segment seg))
        (end 
              (end_segment seg)))
    (sqrt (+  (square (-  (x_point end)
                          (x_point start)))
              (square (-  (y_point end)
                          (y_point start)))))))

(define (get_len seg)
  (length_of_segment seg))

(define (get_perimeter rect)
  (*  2 
      (+  (get_len (length_of_rect rect)) 
          (get_len (width_of_rect rect)))))

(define (get_area rect)
  (*  (get_len (length_of_rect rect)) 
      (get_len (width_of_rect rect))))


(define (main)
  ; (logg (length_of_segment (make_segment (make_point 0 0) (make_point 2 2))))
  (define l1
    (make_segment (make_point 0 1) (make_point 2 1)))
  
  (define l2
    (make_segment (make_point 0 0) (make_point 2 0)))

  (define w1
    (make_segment (make_point 0 1) (make_point 0 0)))

  (define w2
    (make_segment (make_point 2 1) (make_point 2 0)))

  ; (define rect (make_rect l1 l2 w1 w2))

  (define rect (make_rect2 l1 w1))

  (logg (get_perimeter rect))

  (logg (get_area rect))
)

(main)