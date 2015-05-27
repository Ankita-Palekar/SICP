; constructor for the alyssas interl implementation
(define (make-interval a b)
	(cons a b))

(define (upper-bound x)
	(car x))

(define (lower-bound y)
	(cdr y))

