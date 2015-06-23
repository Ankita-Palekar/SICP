(define (RLC r l c dt)
	(define (dispatch vc0 il0)
		(define vc (integral (delay dvc) vc0 dt))
		(define il (integral (delay dil) il0 dt))
		(define dvc (scale-stream il (- (/ 1 c))))
		(define dil (add-stream (scale-stream vc (/ 1 l)) (scale-stream il (- (/ r l)))))		
		(define (series-consing s1 s2)
			(cons-stream (cons (stream-car s1) (stream-car s2)) (series-consing (stream-cdr s1) (stream-cdr s2)))) (series-consing vc il))
		dispatch)

(define (partial-sum s)
		(cons-stream (stream-car s) (add-stream (partial-sum s) (stream-cdr s)) ))

(define (add-stream s1 s2)
	(stream-map + s1 s2))


 (define (integral delayed-integrand initial-value dt)
	(define int (cons-stream initial-value (let ((integrand (force delayed-integrand)))
																						(add-stream (scale-stream integrand dt)
																							int))))
	int)



 (define r-c-circuit (rlc 1 1 0.2 0.1))
 (define stream-v-l (r-c-circuit 10 0))
