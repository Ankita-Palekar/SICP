(define (reverse items)
	( if (null? items)
			'()
		(append (reverse (cdr items)) (list (car items)))))
  

 ;iterative method 

(define (reverse items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				(cons (car things) answer))))
		(iter items '()))
