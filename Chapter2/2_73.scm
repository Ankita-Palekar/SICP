(define (deriv exp var)
	(cond ((number? exp) 0)
				((variable? exp) (if (same-variable? exp var) 1 0))
				(else ((get 'deriv (operator exp)) (operands exp) var))))


(define (operator exp) (car exp))
(define (operand exp) (cdr exp))






=============================================================================================

a => Numbers and variable will not contain any of the operators and operands hence we are not pulling up in the get deriv funciton 



============================================================================================
b => Procedure for the derivative of sum and the products

(define (install-deriv-sum-package)

	(define deriv exp var)
			(make-sum (deriv (addend exp) var)
															(deriv (augend exp) var))
	(define (addend s)
		(car s))
	(define (augend s)
		(cdr s))
	
	(define (make-sum a1 a2)
		(cond ((=number? a1 0) a2)
			((=number? a2 0) a1)
			((and (number? a1) (number? a2)) (+ a1 a2))
			(else (list '+ a1 a2))
		))
		;interface to the rest system 

		(put 'deriv + deriv)
	)



(define (install-deriv-product-package)
	(define deriv exp var)
			(make-sum (make-product (multiplier exp)
										(deriv (multiplicand exp) var))
										(make-product (deriv (multiplier exp) var)
																	(multiplicand exp)))

	(define (addend s)
		(car s))
	(define (augend s)
		(cdr s))

	(define (multiplier p)
		(car p))
	(define (multiplicand p)
		(cdr p))
	
	(define (make-sum a1 a2)
		(cond ((=number? a1 0) a2)
			((=number? a2 0) a1)
			((and (number? a1) (number? a2)) (+ a1 a2))
			(else (list '+ a1 a2))
			))

	(define (make-product m1 m2)
		(cond ((or (=number? m1 0) (=number? m2 0)) 0)
					((=number? m1 1) m2)
					((=number? m2 1) m1) 
					((and (number? m1) (number? m2)) (* m1 m2))
					(else (list '* m1 m2))))

		;interface to the rest system 
		(put 'deriv * deriv))

==============================================================================
c => Additional Differenciation rule for the exponential 

(define (install-deriv-exponent-package)


(define (base exp)
	(car exp))

(define (exponent exp)
	(cdr exp))

(define (deriv exp var)
	(let ((upper-pow (exponent exp))
								(lower-base (base exp)))		 

							(cond ((= upper-pow 0)  
										(make-product (make-product 1 (make-exponentiation lower-base 0)) (deriv lower-base var)))
										((= upper-pow 1) (make-product (make-product 1 (make-exponentiation lower-base 1)) (deriv lower-base var)))
										(else (make-product (make-product upper-pow (make-exponentiation lower-base (- upper-pow 1))) (deriv lower-base var))))))
		(put 'deriv / deriv))
================================================================================================

d => It should give the same answers 
