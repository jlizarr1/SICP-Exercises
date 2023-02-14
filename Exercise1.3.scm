#lang simply-scheme
(define (sum-largest-squares a b c)
  (cond ((and (> a b) (> b c)) (+ (* a a) (* b b)))
        ((and (> a b) (> c b)) (+ (* a a) (* c c)))
        (else (+ (* b b) (* c c)))))