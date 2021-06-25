#lang racket
(#%require "../../../lib/utils.scm")

;; EXERCISE 2.29
;; def
; (define (make-mobile left right)
;   (list left right))

; (define (make-branch length structure)
;   (list length structure))


;; part a
; (define (left-branch mobile)
;   (car mobile))

; (define (right-branch mobile)
;   (cadr mobile))

; (define (branch-length branch)
;   (car branch))

; (define (branch-structure branch)
;   (cadr branch))


;; part b
; 根据题目定义, 一个 mobile 有两个分支, 每个分支有 length 和 weight/structure 两个属性
; 分支的 structure 属性可以是另一个 mobile 
(define (not-fringe? branch)
    (pair? (branch-structure branch)))

(define (branch-weight branch)
  (if (not-fringe? branch)
    (branch-weight (branch-structure branch))
    (branch-structure branch)))

(define (total-weight mobile)
  (+  (branch-weight (left-branch mobile))
      (branch-weight (right-branch mobile))))


;; part c
(define (branch-torque branch)
  (*  (branch-length branch)
      (branch-weight branch)))

(define (same-torque? left right)
  (=  (branch-torque left)
      (branch-torque right)))

; 两个函数互相嵌套
(define (branch-balance? branch)
  (if (not-fringe? branch)
    (mobile-balance? (branch-structure branch))
    #t))

(define (mobile-balance? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and  (same-torque? left right)
          (branch-balance? left)
          (branch-balance? right))))


; ;; part d
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))


(define (main)
  (define mobile1 (make-mobile (make-branch 10 20) (make-branch 20 (make-branch 30  40))))

  (define mobile2 (make-mobile (make-branch 10 20) (make-branch 10 20)))
  
  (logg mobile1)

  (logg mobile2)

  (logg
    (total-weight mobile1))

  (logg
    (mobile-balance? mobile1))

  (logg
    (mobile-balance? mobile2))
)

(main)

