
(define (horner-eval x coefficient-sequence)
	(accumuate (lambda (this-coeff higher-terms) (+ this-coeff (* higher-terms x) )) 0 coefficient-sequence))


; function accumuate
(define (accumulate op initial sequence)
	(if (null? sequence) initial	
		(op (car sequence) (accumulate op initial (cdr sequence)))))
