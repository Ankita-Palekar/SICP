(define (div-stream divident diviser)
	(cond ((= (stream-car diviser) 0) (error "cannot contain zero as a const"))
				(else (let ((partial-diviser-stream (get-Sr-stream diviser)))
							(let ((inverted-series (invert-stream partial-diviser-stream)))
										(mul-series divident inverted-series)
								)))))
 

(define sec-stream (get-Sr-stream cosine-stream))
(define sec (cons-stream 1 (scale-stream (mul-series sec-stream sec) -1))) ; used inverse from the exercise 3_61

(define tan-series (div-stream sine-stream cosine-stream))

(define (scale-stream stream factor)
	(stream-map (lambda(x) (* x factor)) stream))

(define (add-stream s1 s2)
	(stream-map + s1 s2))

(define (mul-series s1 s2)
	(cons-stream (* (stream-car s1) (stream-car s2)) (add-stream (add-stream (scale-stream (stream-cdr s1) (stream-car s2)) (scale-stream (stream-cdr s2) (stream-car s1))) (cons-stream 0 (mul-series (stream-cdr s1) (stream-cdr s2))))))
 
(define (get-Sr-stream stream)
	(cons-stream (stream-car (stream-cdr stream)) (stream-cdr stream)))

(define Sr (get-Sr-stream integrate-odd-series))
;definition1
(define invert-unit-series (cons-stream 1 (scale-stream (mul-series Sr invert-unit-series) -1)))


	;definition2
(define (invert-stream stream)
	(cons-stream (stream-car stream) (scale-stream (mul-series Sr (invert-stream (stream-cdr stream))) -1)))



(define (invert-stream Sr)
	(define invert-unit-series (cons-stream 1 (scale-stream (mul-series Sr invert-unit-series) -1)))
	invert-unit-series
	)



