(define (raise x) (apply-generic 'raise x))

(define (install-scheme-package )
	(define (raise-integer x)
		(if (integer-number? x)
			(make-rational x 1)
			(make-complex-from-real x 0)))
	(put 'raise '(scheme-number) raise-function))

(define (install-rational-package)
	(define (raise-rational x)
		(if (real? x)
			(make-complex-from-real x 0)))
	(put 'raise' '(rational-number) raise-function))




