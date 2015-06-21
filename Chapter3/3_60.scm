; (define (mul-series s1 s2)
; 	(cons-stream (* (stream-car s1) (stream-car s2)) (add-streams (scale-stream (stream-car s2) s1) (mul-series (stream-cdr s1) s2))))


(define (scale-stream stream factor)
	(stream-map (lambda(x) (* x factor)) stream))

(define (add-stream s1 s2)
	(stream-map + s1 s2))

(define integrate-odd-series (cons-stream 1 (stream-cdr (integrate-stream odds))))
(define integrate-even-series (cons-stream 1 (stream-cdr (integrate-stream evens))))


(define (mul-series s1 s2)
	(cons-stream (* (stream-car s1) (stream-car s2)) (add-stream (add-stream (scale-stream (stream-cdr s1) (stream-car s2)) (scale-stream (stream-cdr s2) (stream-car s1))) (cons-stream 0 (mul-series (stream-cdr s1) (stream-cdr s2))))))

(define (mul-series s1 s2)
	(cons-stream (* (stream-car s1) (stream-car s2)) (add-stream (add-stream (scale-stream (stream-cdr s1) (stream-car s2)) (scale-stream (stream-cdr s2) (stream-car s1))) (mul-series (stream-cdr s1) (stream-cdr s2)))))