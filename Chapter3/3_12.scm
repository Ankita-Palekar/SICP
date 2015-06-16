(define (append! x y)
	(set-cdr! (last-pair x) y))

(define (last-pair x) 
	(if(null? (cdr x))
		x(last-pair (cdr x))))


1 ]=> (cdr x)
;Value 15: (b)

1 ]=> (define W (append! x y))


1 ]=> (last-pair x)
;Value 16: (d)