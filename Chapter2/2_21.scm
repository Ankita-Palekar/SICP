; first definition of the sqauring list 

(define (square-list items)
	(if (null? items)
		'()
		(cons (* (car items) (car items)) (square-list (cdr items)))))

(define (map proc items)
	(if (null? items)
		'()
		(cons (proc (car items)) (map proc (cdr items)))))


(define (identity x) x)
;second definitoion of the sqauring list 

(define(square-list items)
	(map identity items))