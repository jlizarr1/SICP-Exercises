#lang simply-scheme
;part a

;recursive product
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;factorial procedure using product
(define (factorial n)
  (define (increment x)
    (+ x 1))
  (define (ident x)
    x)
  (product ident 1 increment n))

(define (square x)
  (* x x))

;pi approximation using John Wallis formula
(define (pi-prod a b)
  (define (pi-term x)
    (/(* 4 (square x)) (- (* 4 (square x)) 1)))
  (define (increment x)
    (+ x 1))
  (* 2.0 (product pi-term a increment b)))

;part b

;iterative product
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))