Formula : Dividend = Divisor x quotient + Remainder 
Remainder = (Dividend - (Divisor * quotient))

(define (gcd-terms a b)
	(if (empty-termlist? b)
		a 
		(gcd-terms b (remainder-terms a b))))

; Method1  using the formula method 

(define (remainder-terms a b)
	( let ((divident (term-list a))
					(divisor (term-list b))
					(quotient (div-term divident divisor))) )
		(sub-poly (divident) (mul-poly divisor quotient)))


;Method 2 using the div terms 


(define (remainder-terms a b)
	(if (same-variable? (variable p1) (variable p2))
		(div-terms-remainder (term-list p1) 
																				(term-list p2))
		(else (error "Two Polys are not equal"))))


;modified div-terms foe the remainder
(define (div-terms-remainder L1 L2)
	(if (empty-termlist ? L1)
		(list (the-empty-termlist) (the-empty-termlist))
		(let ((t1 (first-term L1))
			(t2 (first-term L2)))
				(if (> (order t2) (order t1))
					(list (the-empty-termlist) L1)
					(let ((new-c (div (coeff t1) (coeff t2)))
				(new-o (- (order t1) (order t2))))
					(let ((rest-of-result (sub-poly (mul-poly (form-result-term new-c new-o) L1) L2))
								(remainder rest-of-result))				
							(div-terms L1 rest-of-result)
								remainder))))))




(define (form-result-term x y)
	(list (x y)))



(define (div-poly p1 p2)
	(if (same-variable? (variable p1) (variable p2))
		(make-poly (variable p1) (div-terms (term-list p1) 
																				(term-list p2)))))