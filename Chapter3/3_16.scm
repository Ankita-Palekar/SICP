(define (count-pairs x)
	(if(not (pair? x))
		0
		(+ (count-pairs (car x))
			 (count-pairs (cdr x))
			 1)))


====== value returned 3 ======
 
2 error> (define x (list '() '() '()))
2 error> (count-pairs x)
;Value: 3

2 error> (define x (list (list 1 2) '()))
;Value: x
2 error> (count-pairs x)
;Value: 4
