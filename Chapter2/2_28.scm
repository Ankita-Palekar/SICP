

(define (fringe x)
	(cond 
				((and (not (pair? x)) (not (null? x)))  (display x))
				((pair? x)  (fringe (car x)) (fringe (cdr x)))))

 

 
				