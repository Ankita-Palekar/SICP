 ; generic arithmetic packages 

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

; modifying the rational package 

(define (install-rational-package)
	;internal procedures 

	(define (numer x) (car x))
	(define (denom x) (cdr x))



	(define (make-rat n d)
		(cons n d))

	(define (add-rat x y)
		(make-rat (add (mul (numer x) (denom y))
								 (mul (numer y) (denom x)))))
	
	(define (sub-rat x y)
		(make-rat (sub 	(mul (numer x) (denom y))
									(mul (numer y) (denom x)))))

	(define (mul-rat x y)
		(make-rat (mul (numer x) (numer y)) (mul (denom x) (denom y))))
	
	(define (div-rat x y)
		(make-rat (mul (numer x) (denom y))
							(mul (denom x) (numer y))))

	(define (gcd-term a b)
		(if (= b 0)
					a
					(gcd-term b (remainder-term a b))))

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
			(define (add-poly p1 p2)....)
			(define (sub-poly p1 p2)....)
			(define (mul-poly p1 p2)....)
			(define (div-poly p1 p2)....)

				;;interface to the external world
				(define (tag z) (attach-tag 'polynomial z))
			(put 'add 'polynomial polynomial (lambda(x y)(tag  (add-poly x y))))
			(put 'sub 'polynomial polynomial (lambda(x y)(tag  (sub-poly x y))))
			(put 'mul 'polynomial polynomial (lambda(x y)(tag  (mul-poly x y))))
			(put 'div 'polynomial polynomial (lambda(x y)(tag  (div-poly x y))))

		)

	'done)

;;modifying make-rat
 
	(define (make-polynomial var term-list)
		(cons var term-list))
	
	(define (make-rat n d)
		(let ((g (gcd n d)))
			(cons (/ n g) (/ d g))
			)
		)

	1 ]=> (define p1 (make-polynomial 'x '((2 1) (0 1))))
	1 ]=> p1
;Value 12: (x (2 1) (0 1))


1 ]=> (define p2 (make-polynomial 'x '((3 1) (0 1))))
;Value: p2
1 ]=> p2
;Value 13: (x (3 1) (0 1))
