(define a (make-connector))
(define b (make-connector))
(define c (make-connector))

(define (averager a b c)
	(let ((m (make-connector))
				(n (make-connector)))
			(adder a b m)
			(multiplier m n c)
			(costant 2 n)))