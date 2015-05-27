
(define (same-parity x . w)
	(define bit (odd-or-even x))

	(define (find-elements item-list)
 		(cond ((null? (cdr item-list))  
				(cond ((= (odd-or-even (car item-list)) bit)(newline) (display (car item-list)))))

 		(else (cond ((= (odd-or-even (car item-list)) bit)(newline) (display (car item-list)) (find-elements (cdr item-list)))
 								(else (find-elements (cdr item-list))))))) 
 
 	(display x)
 	(find-elements w))

(define (odd-or-even x)
		(define e 0)
		(define o 1)
	(if(even? x)
			e o))
  
(define (even? x)
	(= (remainder x 2) 0))



 

 
 