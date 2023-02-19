#lang simply-scheme
(define (square guess) (* guess guess))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess prev-guess)
  (< (abs (- guess prev-guess)) 0.0000000000000000001))

(define (cbrt-iter guess x)
  (if (good-enough? (improve guess x) guess)
      guess
      (cbrt-iter (improve guess x) x)))

(define (cbrt x) (cbrt-iter 1.0 x))

(cbrt 64)