(define (deriv exp var)
	(cond ((number? exp) 0)
				((variable? exp) (if (same-variable? exp var) 1 0))
				(else ((get 'deriv (operator exp)) (operands exp) var))))


(define (operator exp) (car exp))
(define (operand exp) (cdr exp))






===========================================
a => Numbers and variable will not contain any of the operators and operands hence we are not pulling up in the get deriv funciton 


