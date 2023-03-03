#lang simply-scheme
;part a
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;;factorial procedure using product
(define (factorial n)
  (define (increment x)
    (+ x 1))
  (define (ident x)
    x)
  (product ident 1 increment n))

;;(define (pi n)
  