(define (make-cycle x)
	(set-cdr! (last-pair x) x) x)

(define z (make-cycle (list 'a 'b 'c)))



(define (check-cycle x)
	 (define hare-ptr (cons 'hare '()))
	 (define totroise-ptr (cons 'tor '()))
	 (set! hare-ptr x) 
	 (set! totroise-ptr x)
		(define (check-cycle-1 cycle-list)
			(cond ((null? cycle-list) "loop does not exist")
						(else (set-cdr! hare-ptr (cdr cycle-list))
								(cond ((null? (cdr cycle-list)) "loop does not exist")
											(else (set! hare-ptr (cdr (cdr cycle-list)))
														(set! totroise-ptr (cdr cycle-list))
														(if (equal? hare-ptr totroise-ptr)
															"loop exist"
																(check-cycle-1 (cdddr cycle-list))))))))
		(check-cycle-1 x))


 

note : problem is solved using the hare and totroise algorithm 
in this hare pointer move by 2 places whrere as tortoise moves by one place untill either the end of the list is reached or loop has been found 


2 error> (define x (list 1 2 1 2 1 2 3 4 1))
;Value: x
2 error> (check-cycle x)
;Value 19: "loop does not exist"
3 error> (check-cycle z)
;Value 21: "loop exist"

