procedure equ? to find whether the numbers are equal or not 



;;
(define (install-scheme-number-package)
	;internal procedure 
	(define (scheme-number-equ? x y)
		(= x y))
	;;interface to the rest of system 
	(put 'equ? '(scheme-number scheme-number) scheme-number-equ?))


(define (install-complex-package)
	(define (complex-equ? x y)
		(and (eq? (real-part x) (real-part y)) (eq? (imag-part x) (imag-part y))))
	(put 'equ? '(complex complex) complex-equ?))

(define (install-rational-package)
	(define (make-rat n d)
		(cons n d))
	(define (numer x)
	(let ((g (gcd (car x) (cdr x))))
		(/ (car x) g)))
	(define (denom x)
		(let ((g (gcd (car x) (cdr x))))
			(/ (cdr x) g)))
	(define (rational-equ? x y)
		(and (eq? (numer x) (numer y)) (eq? (denom x) (denom y))))
	;; Interface to the rest of the world
	(put 'equ? '(rational rational) rational-equ?))



(define (equ? x y)
(apply-generic 'eq x))