#lang sicp
(define (LOG . args)
        (for-each   (lambda (x) (display x) (display #\space)) 
                    args)
        (newline))

;; Fixed points

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (begin
        (LOG "next" next)
        (if (close-enough? guess next)
          next
          (try next)))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))


(define (main)
    (fixed-point    (lambda (x) (log 1000 x))
                    1.1)
    (newline)
    (fixed-point    (lambda (x) (average x (log 1000 x)))
                    1.1)
)

(main)


; next 72.47657378429035 
; next 1.6127318474109593 
; next 14.45350138636525 
; next 2.5862669415385087 
; next 7.269672273367045 
; next 3.4822383620848467 
; next 5.536500810236703 
; next 4.036406406288111 
; next 4.95053682041456 
; next 4.318707390180805 
; next 4.721778787145103 
; next 4.450341068884912 
; next 4.626821434106115 
; next 4.509360945293209 
; next 4.586349500915509 
; next 4.535372639594589 
; next 4.568901484845316 
; next 4.546751100777536 
; next 4.561341971741742 
; next 4.551712230641226 
; next 4.558059671677587 
; next 4.55387226495538 
; next 4.556633177654167 
; next 4.554812144696459 
; next 4.556012967736543 
; next 4.555220997683307 
; next 4.555743265552239 
; next 4.555398830243649 
; next 4.555625974816275 
; next 4.555476175432173 
; next 4.555574964557791 
; next 4.555509814636753 
; next 4.555552779647764 
; next 4.555524444961165 
; next 4.555543131130589 
; next 4.555530807938518 
; next 4.555538934848503 

; next 36.78828689214517 
; next 19.352175531882512 
; next 10.84183367957568 
; next 6.870048352141772 
; next 5.227224961967156 
; next 4.701960195159289 
; next 4.582196773201124 
; next 4.560134229703681 
; next 4.5563204194309606 
; next 4.555669361784037 
; next 4.555558462975639 
; next 4.55553957996306 
; next 4.555536364911781 