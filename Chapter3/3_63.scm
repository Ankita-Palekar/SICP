

(define (partial-sum s)
		(cons-stream (stream-car s) (add-stream (partial-sum s) (stream-cdr s)) ))

(define (add-stream s1 s2)
	(stream-map + s1 s2))


(define (pi-summonds n)
	(cons-stream (/ 1.0 n)
		(stream-map - (pi-summonds (+ n 2)))))

(define (scale-stream stream factor)
	(stream-map (lambda(x) (* x factor)) stream))

(define pi-stream (scale-stream (partial-sum (pi-summonds 1)) 4))

(display-stream pi-stream)

(define (display-line x)
	(newline)
	x)

(define (display-stream s) 
	(stream-for-each display-line s))

(define (euler-transform s)
	(let ((s0 (stream-ref s 0))
				(s1 (stream-ref s 1))
				(s2 (stream-ref s 2)))
		(cons-stream (- s2 (/ (square (- s2 s1)) (+ s0 (* -2 s1) s2)))
			(euler-transform (stream-cdr s)))))


(define (make-tableau transform s)
	(cons-stream s (make-tableau transform (transform s))))

(define (accelerated-sequence transform s)
	(stream-map stream-car (make-tableau transform s)))
 
 (define (sqrt-stream x)
 (cons-stream 1.0 
 	(stream-map (lambda(guess) 
 														(sqrt-improve guess x))
 															(sqrt-stream x))))

(define (average x y)
	(/ (+ x y) 2))

(define (sqrt-improve guess x)
	(average guess (/ x guess)))



(define (sqrt-stream x)
	(define guesses (cons-stream 1.0 
											(stream-map (lambda(guess) 
												(sqrt-improve guess x)) guesses)))	
	guesses)

It performs redundaunt computations and is also very slow for high numbers for smaller numbers it might give output correctly but not for large numbers

 
(define (sqrt-stream x)
	(define guesses (cons-stream 1.0 
											(stream-map (lambda(guess) 
												(sqrt-improve guess x)) guesses)))	
	guesses)

 In luis program sqrt has been called recursively which is redundant computaion 