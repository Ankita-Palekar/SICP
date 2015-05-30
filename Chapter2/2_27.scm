(define (reverse items)
	( if (null? items)
			'()
		(append (reverse (cdr items)) (list (car items)))))
  

;modifying recursive reverse method

(define (deep-reverse items)
	( cond ((null? items) '())  
				( (pair? (car items)) (append (deep-reverse (cdr items)) 
               (list (deep-reverse (car items)))))
				(else (append (deep-reverse (cdr items)) 
                 (list (car items)))))))