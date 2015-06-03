(define (fold-left op initial sequence)
	(define (iter result rest)
		(if (null? rest)
			result
			(iter (op result (car rest)) (cdr rest))))
	(iter initial sequence))





; fold left using recursion method 
(define (fold-right op initial sequence)
	(if (null? sequence) initial		
		(op (car sequence) (accumulate op initial (cdr sequence)))))


12 error> (fold-right / 1 (list 1 2 3))
;Value: 3/2

12 error> (fold-left / 1 (list 1 2 3 ))
;Value: 1/6

12 error> (fold-right list nil (list 1 2 3 ))
;Value 52: (1 (2 (3 ())))

12 error> (fold-left list nil (list 1 2 3 ))
;Value 53: (((() 1) 2) 3)

===========================================
;operator should be commutative that is 
; a op b = b op a
; then only we can guarantee that outputs will be correct 



