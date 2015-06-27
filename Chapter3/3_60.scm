(define (scale-stream stream factor)
	(stream-map (lambda(x) (* x factor)) stream))

(define (add-stream s1 s2)
	(stream-map + s1 s2))

(define integrate-odd-series (cons-stream 1 (stream-cdr (integrate-stream odds))))
(define integrate-even-series (cons-stream 1 (stream-cdr (integrate-stream evens))))



 
(define (mul-series s1 s2)
	(cons-stream (* (stream-car s1) (stream-car s2)) (add-stream (add-stream (scale-stream (stream-cdr s1) (stream-car s2)) (scale-stream (stream-cdr s2) (stream-car s1))) (mul-series (stream-cdr s1) (stream-cdr s2)))))

 

1 ]=> (define sin-square (mul-series  sine-stream sine-stream))
;Value: sin-square
1 ]=> (define cos-square (mul-series  cosine-stream cosine-stream))
;Value: cos-square
1 ]=> (define id (add-stream sin-square cos-square))
;Value: id