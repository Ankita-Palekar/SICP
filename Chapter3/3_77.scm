(define (integral integrand initial-value dt)
	(cons-stream initial-value (if (stream-null? integrand)
																	the-empty-stream
																	(integral (stream-cdr (force integrand)) 
																						(+ (* dt (stream-car (force integrand))) initial-value) 
																						dt))))

	(define (solve f y0 dt)
		(define y (integral (delay dy) y0 dt))
		(define dy (stream-map f y))
	y)

	
(stream-ref (solve (lambda(y) y) 1 .001) 1000)