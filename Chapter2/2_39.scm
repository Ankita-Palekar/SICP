(define nil '())


;using fold-right

(define (reverse sequence)
	(fold-right (lambda (x y)(list y x)) nil sequence))



;using fold-left
(define (reverse sequence)
	(fold-left (lambda (x y) (cons y x)) nil sequence) )



;using fold-right


(define (reverse sequence)
	(fold-right (lambda (x y)(cond ((null? y)(list x) 
																	)
																	(else (list y x)))) nil sequence))


 

(define (reverse sequence)
	(fold-right (lambda(x y) (  cons ( cond ((null? x) y)) ))) )




(define (fold-left op initial sequence)
	(define (iter result rest)
		(if (null? rest)
			result
			(iter (op result (car rest)) (cdr rest))))
	(iter initial sequence))




; fold left using recursion method 
(define (fold-right op initial sequence)
	(if (null? sequence) initial		
		(op (car sequence) (fold-right op initial (cdr sequence)))))
