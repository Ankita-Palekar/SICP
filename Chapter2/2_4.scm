


;cdr has an input as a function which takes input as 2 arguments thats y lambda (p q) and returns q since car returns p 


(define (cdr z)
	(z (lambda (p q) q)))

