(define (make-from-mag-ang r t)
	(define (dispatch op)
		(cond ((eq? op 'magnitude) r)
				((eq? op 'angle)	t)
				((eq? op 'real-part)(* r (cos t)))
				((eq? op 'imag-part)(* r (sin t)))
				(else (error "Unknown op -- MAKE FROM mag ang--" op))))
	dispatch)
 