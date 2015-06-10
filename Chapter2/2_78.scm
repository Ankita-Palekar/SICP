(define (attach-tag type-tag x)
	(cond ((number? x) x)
				(else (cons type-tag x))))

(define (type-tag datum)
	(cond ((number? datum ) 'scheme-number')
				((pair? datum) (car datum))
				(else (error "Bad tagged datum --- TYPE TAG ---" datum))))

(define (contents datum)
	(cond ((pair? datum) (cdr datum))
				((number? datum) datum)
				(else (error "Bad Tagged Datum Contents " datum))))


