

(define (variable? x)
	(symbol? x))

(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))


(define (sum? x)
	(and (pair? x) (eq? '+ (cadr x))))

(define (addend s)
	(car s))

(define (augend s)
	(caddr s))

(define (product? x)
	(and (pair? x) (eq? (cadr x) '*)))


(define (multiplier p)
	(car p))

(define (multiplicand p)
	(caddr p))


(define (make-sum a1 a2)
	(cond ((=number? a1 0) a2)
		((=number? a2 0) a1)
		((and (number? a1) (number? a2)) (+ a1 a2))
		(else (list '+ a1 a2))
		))


(define (=number? exp num)
	(and (number? exp) (= exp num)))

(define (make-product m1 m2)
	(cond ((or (=number? m1 0) (=number? m2 0)) 0)
				((=number? m1 1) m2)
				((=number? m2 1) m1) 
				((and (number? m1) (number? m2)) (* m1 m2))
				(else (list '* m1 m2))))


;modifying the deriv procedure 


(define (deriv exp var)
	(cond ((number? exp) 0)
				((variable? exp)
					(if (same-variable? exp var) 1 0))
				((sum? exp) (make-sum (deriv (addend exp) var)
															(deriv (augend exp) var)))
				((product? exp)
					(make-sum (make-product (multiplier exp)
										(deriv (multiplicand exp) var))
										(make-product (deriv (multiplier exp) var)
																	(multiplicand exp))))
				((exponentiation? exp)
					(let ((upper-pow (exponent exp))
								(lower-base (base exp)))		 

							(cond ((= upper-pow 0)  
										(make-product (make-product 1 (make-exponentiation lower-base 0)) (deriv lower-base var)))
										((= upper-pow 1) (make-product (make-product 1 (make-exponentiation lower-base 1)) (deriv lower-base var)))
										(else (make-product (make-product upper-pow (make-exponentiation lower-base (- upper-pow 1))) (deriv lower-base var))))
					))
				(else (error "unknown expression type -- DERIV" exp))))


(define (exponentiation? exp)
	(and (pair? exp) (equal? '** (car exp))))

(define (make-exponentiation base pow)
	(list '** base pow))


;modified make-exponentiation 
	 

(define (make-exponentiation  lower-base pow)
	(cond 	 	((=number? lower-base pow) (if (= lower-base 1)
																				1
																				lower-base) )
						((= pow 0) 1)
					 	((= pow 1) lower-base)
					 	(else (list '** lower-base pow))))





(define (base exp)
	(cadr exp))

(define (exponent exp)
	(caddr exp))


;========================================================================================

a==> changes done only to the product? sum? addend and multiplier functions

b==> using approach in the problem 2.57 we can solve the second part




(define (addend s)
	(car s))

(define (sum? x)
	(and (pair? x) (eq? '+ (cadr x))))

(define (product? x)
	(and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p)
	(car p))
 
(define (multiplicand s)
	(cond ((and (pair? (cddr s)) (not (null? (cdddr s)))) (append (list '*) (cddr s)) )
				(else (caddr s))))

(define (augend s)
	(cond ((and (pair? (cddr s)) (not (null? (cdddr s)))) (append (list '+) (cddr s)) )
				(else (caddr s))))
 