
; negate will inverse the polynomial terms and hence we can use add procedure 

(define (negate L)
	(cond ((empty-list? L) L)
				(else (map (lambda(x) (- (coef x))) L))))
 

(define (sub-poly p1 p1)
(if(same-variable? (variable? p1) (variable? p2))
		(make-poly (variable p1) (add-terms (term-list p1) (negate (term-list p2))))
		(error "Polys not in same var")))
 
 (define (install-poly-package)
 	(put 'sub '(polynomial polynomial) (lambda (p1 p2) (tag (sub-poly p1 p2))))
 	)