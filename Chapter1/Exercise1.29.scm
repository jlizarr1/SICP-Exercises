#lang simply-scheme
(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (integral-simp f a b n)
  (define h
    (/ (- b a) n))
  (define (add-h x)
    (+ x h))
  (* (sum f a add-h b)
     (/ h 3)))