(define (equal? x y)
	(cond ((or (null? x) (null? y)) false)
				((and (pair? x) (pair? y)) 
					(cond ((and (eq? (car x) (car y)) (eq? (cdr x) (cdr y))) true)))
				(else (equal? (cdr x) (cdr y)))))



(define (equal? x y)
	(cond ((eq? x y) true
		)))