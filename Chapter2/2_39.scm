(define nil '())

;using fold-right
 
;using fold-left - working
(define (reverse sequence)
	(fold-left (lambda (x y) (cons y x)) nil sequence) )

;reverse using fold right- working 
(define (reverse sequence)
	(fold-right (lambda(x y) (cond ((null? y)  (list x))
																 	(else (append y (list x))))) nil sequence))

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
