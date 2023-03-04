#lang simply-scheme

;part a

(define (filtered-accumulate combiner null-value term a next b filter?)
  (if (> a b)
      null-value
      (if (filter? a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) next b filter?))
          (filtered-accumulate combiner null-value term (next a) next b filter?))))

(define (prime? n)
  (let loop ((d 2))
    (cond ((< n (* d d)) #t)
          ((zero? (modulo n d)) #f)
          (else (loop (+ d 1))))))

(define (square x)
  (* x x))

(define (increment x)
  (+ x 1))

(define (sum-squares-primes a b)
  (filtered-accumulate + 0 square a increment b prime?))

;test
(sum-squares-primes 1 10)

;part b

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (rel-prime? n)
  (define (rel-prime-inner? i)
    (= (gcd n i) 1))
  rel-prime-inner?)

(define (identity x)
  x)

(define (sum-rel-primes n)
  (filtered-accumulate * 1 identity 1 increment n (rel-prime? n)))

;test
(sum-rel-primes 10)
  