(define (generate-sense-data n)
	(cons-stream (* 2 n) (stream-map - (generate-sense-data (+ n 3)))))

(define sense-data (generate-sense-data 1))

(define zero-crossing (stream-map sign-chgange-detector sense-data (stream-cdr sense-data)))

(define one (cons-stream 1 one))

(define (sign-chgange-detector x y)
(cond ((and (< x 0) (> y 0)) 1)
									((and (< y 0) (> x 0)) -1)
									(else 0))) 

 

