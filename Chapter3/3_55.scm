(define (partial-sum s)
		(cons-stream (stream-car s) (add-stream (partial-sum s) (stream-cdr s)) ))

(define (add-stream s1 s2)
	(stream-map + s1 s2))


(define (integers-starting-from n)
	(cons-stream n (integers-starting-from (+ n 1))))