










;Solution for the extended exercise 
; generic arithmetic packages 

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))


we will need to define the polynomial package inside the rational package so that operations can be performed like an rational numer operations but with the polynomiala as the numerator and the denominator 

(define (install-rational-package)
	;internal procedures 

	(define (numer x) (car x))
	(define (denom x) (cdr x))

	(define (make-rat n d)
		(cons n d))

	(define (add-rat x y)
		(make-rat (add-poly (mul-poly (numer x) (denom y))
								 (mul-poly (numer y) (denom x)))))
	
	(define (sub-rat x y)
		(make-rat (sub-poly 	(mul-poly (numer x) (denom y))
									(mul-poly (numer y) (denom x)))))

	(define (mul-rat x y)
		(make-rat (mul-poly (numer x) (numer y)) (mul-poly (denom x) (denom y))))
	
	(define (div-rat x y)
		(make-rat (mul-poly (numer x) (denom y))
							(mul-poly (denom x) (numer y))))



	;;interfaces to the rest of the world
	(define (tag x) (attach-tag 'rational x))
	(put 'add '(rational rational)
	(lambda (x y) (tag (add-rat x y))))

	(put 'sub '(rational rational)
	(lambda (x y) (tag (sub-rat x y))))

	(put 'mul '(rational rational)
	(lambda (x y) (tag (mul-rat x y))))

	(put 'div '(rational rational)
	(lambda (x y) (tag (div-rat x y))))

	(put 'make 'rational
	(lambda (n d) (tag (make-rat n d))))

	;installing polynomial package 


	(define (install-polynomial-package)
		;;internal prcodures 
		;;representation of poly 

		(define (make-poly variable term-list)
			(cons variable term-list))
		(define (variable p) (car p))
		(define (term-list p) (cdr p))
		(define (add-poly p1 p2) ..)

		)

	'done)

 