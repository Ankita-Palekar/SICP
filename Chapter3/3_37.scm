(define (celcius-fahrehnite-coverter x)
	(c+ (c* (c/ (cv 9) (cv 5)) x) (cv 32)))

(define c (make-connector))
(define f (celcius-fahrehnite-coverter c))

(define (c+ x y)
	(let ((z (make-connector)))
		(adder x y z)
		z))

(define (c- x y)
	(let ((z (make-connector))
				(i (make-connector)))
		(invert y i)
		(adder x i z)
		z))


(define (c* x y)
	(let (z (make-connector))
			(multiplier x y z)
			z))

(define (c/ x y)
	(let ((m (make-connector))
				(z (make-connector)))
		(invert y z)
		(multiplier x m)
		z))

(define (constant value connector)
	)

(define  (cv value)
	(let (z (make-connector))
		(constant value z)
		z))