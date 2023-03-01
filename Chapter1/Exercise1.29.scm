#lang simply-scheme
(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h
    (/ (- b a) n))
  (define (increment k)
    (+ k 1))
  (define (redef k)
    (cond ((or (= k 0) (= k n)) (f (+ a (* k h))))
          ((= (remainder k 2) 0) (* (f (+ a (* k h))) 2))
          (else (* (f (+ a (* k h))) 4))))
  (* (sum redef 0 increment n)
     (/ h 3.0)))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)