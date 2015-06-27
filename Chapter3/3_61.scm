(define (reverse-integer-stream n)
	(cons-stream (/ 1 n) (reverse-integer-stream (+  n 1))))

(define (negate stream)
	(cons-stream (- (stream-car stream)) (negate (stream-cdr stream))))

(define reverse (cons-stream 1 (reverse-integer-stream 1)))

(define (integers-starting-from n)
	(cons-stream n (integers-starting-from (+ n 1))))

(define (integrate-stream stream)
	(define (iter-stream-inter stream rev-stream)
		(cons-stream (* (stream-car stream) (stream-car rev-stream)) (iter-stream-inter (stream-cdr stream) (stream-cdr rev-stream))))
	(iter-stream-inter stream reverse))

(define odds (cons-stream 1 (stream-filter odd? (integers-starting-from 1))))
(define evens (cons-stream 2 (stream-filter even? (integers-starting-from 1))))
 

(define integrate-odd-series (cons-stream 1 (stream-cdr (integrate-stream odds))))
(define integrate-even-series (cons-stream 1 (stream-cdr (integrate-stream evens))))


(define (scale-stream stream factor)
	(stream-map (lambda(x) (* x factor)) stream))

(define (add-stream s1 s2)
	(stream-map + s1 s2))

(define (mul-series s1 s2)
	(cons-stream (* (stream-car s1) (stream-car s2)) (add-stream (add-stream (scale-stream (stream-cdr s1) (stream-car s2)) (scale-stream (stream-cdr s2) (stream-car s1))) (cons-stream 0 (mul-series (stream-cdr s1) (stream-cdr s2))))))
 
(define (get-Sr-stream stream)
	(cons-stream (stream-car (stream-cdr stream)) (stream-cdr stream)))

(define sr (get-Sr-stream integrate-odd-series))

(define invert-unit-series (cons-stream 1 (scale-stream (mul-series Sr invert-unit-series) -1)))

(define exp-stream (cons-stream 1 (integrate-stream exp-stream)))

 1 ]=> (display-stream invert-unit-series 10)

1
-1
0
-1/2
1/3
1/12
17/60
-1/15
-29/630
-16/105
-17/1008
;Unspecified return value
