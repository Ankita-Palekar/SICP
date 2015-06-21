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

(define invert-unit-series (cons-stream 1 (negate (mul-series Sr invert-unit-series))))

(define exp-stream (cons-stream 1 (integrate-stream exp-stream)))



8 error> (stream-ref invert-unit-series 1)
;Value: -1
8 error> (stream-ref invert-unit-series 2)
;Value: 1
8 error> (stream-ref invert-unit-series 3)
;Value: -7/2
8 error> (stream-ref invert-unit-series 4)
;Value: 16/3
8 error> (stream-ref invert-unit-series 5)
;Value: -149/12
8 error> (stream-ref invert-unit-series 6)
;Value: 691/30
8 error> (stream-ref invert-unit-series 7)
;Value: -479/10
