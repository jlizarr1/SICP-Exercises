#lang simply-scheme
(define (sum-largest-squares a b c)
  (cond ((and (> a b) (> b c)) (* a b))
        ((and (> a b) (> c b)) (* a c))
        (else (* b c))))