(define (merge s1 s2)
	(cond ((stream-null? s1) s2)
				((stream-null? s2) s1)
				(else 
					(let ((s1car (stream-car s1))
								(s2car (stream-car s2)))
						(cond ((< s1car s2car)
									 (cons-stream s1car (merge (stream-cdr s1) s2)))
									((> s1car s2car) (cons-stream s2car (merge s1 (stream-cdr s2))))
									(else (cons-stream s1car (merge (stream-cdr s1) (stream-cdr s2)))))))))

(define (scale-stream stream factor)
	(stream-map (lambda(x) (* x factor)) stream))

(define s (cons-stream 1 (merge (merge (scale-stream s 2) (scale-stream s 3)) (scale-stream s 5))))

3 error> (stream-ref s 1)
;Value: 2
3 error> (stream-ref s 2)
;Value: 3
3 error> (stream-ref s 3)
;Value: 4
3 error> (stream-ref s 4)
;Value: 5
3 error> (stream-ref s 5)
;Value: 6
3 error> (stream-ref s 6)
;Value: 8
3 error> (stream-ref s 7)
;Value: 9
3 error> (stream-ref s 8)
;Value: 10
3 error> (stream-ref s 3)
;Value: 4
3 error> (stream-ref s 9)
;Value: 12
3 error> (stream-ref s 10)
;Value: 15
3 error> (stream-ref s 11)
;Value: 16