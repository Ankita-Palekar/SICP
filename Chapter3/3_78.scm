(define (integral delayed-integrand initial-value dt)
	(define int (cons-stream initial-value (let ((integrand (force delayed-integrand)))
																						(add-stream (scale-stream integrand dt)
																							int))))
	int)




(define (add-stream s1 s2)
	(stream-map + s1 s2))


(define (solve-2nd  a b dt y0 dy0)
	(define y 	(integral (delay dy) y0 dt))
	(define dy 	(integral (delay ddy) dy0 dt))
	(define ddy (add-stream (scale-stream dy a) (scale-stream y b)))
		y)


(define (scale-stream stream factor)
	(stream-map (lambda(x) (* x factor)) stream))

(define second-stream (solve-2nd 1 2 1 0.001 0.00001))

a->1 
b->2
dt->1 
y0->0.001
dy0->0.00001

1 ]=> (define second-stream (solve-2nd 1 2 1 0.001 0.00001))
;Value: second-stream
1 ]=> (stream-ref second-stream 1)
;Value: .00101
1 ]=> (stream-ref second-stream 2)
;Value: .00303
1 ]=> (stream-ref second-stream 3)
;Value: .00909
1 ]=> (stream-ref second-stream 4)
;Value: 2.7270000000000003e-2
1 ]=> (stream-ref second-stream 5)
;Value: .08181000000000001
1 ]=> (stream-ref second-stream 5)

