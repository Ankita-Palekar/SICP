(define (RC r c dt)
	(define (integral-part stream-current-i)
		(partial-sum (add-stream (scale-stream stream-current-i dt) (scale-stream stream-current-i r))))

	(define (dispatch stream-current-i v0)
			(cons-stream v0 (scale-stream  (partial-sum (integral-part stream-current-i)) (/ 1 c))))
		dispatch)

(define (partial-sum s)
		(cons-stream (stream-car s) (add-stream (partial-sum s) (stream-cdr s)) ))

(define (add-stream s1 s2)
	(stream-map + s1 s2))

(define RC1 (RC 5 1 0.5))

(define	voltage (RC1 integers 3))


(define (scale-stream stream factor)
	(stream-map (lambda(x) (* x factor)) stream))

(define (display-stream s n)
	(define (display-iter i n)
		(cond ((= i n) (display-line (stream-ref s n)))
						(else (display-line (stream-ref s i)) (display-iter (+ i 1) n))))
	(display-iter 0 n))

(define (display-line s)
 	(newline)
 		(display s))


;lets take the stream of integers as the value of current streams


(define (integers-starting-from-n n)
	(cons-stream n (integers-starting-from-n (+ n 1))))


	(define integers (integers-starting-from-n 1))

note : we will be requiring add-stream proceudres , scale-stream procedures in order to use the interval parital-sum can be used 

1 ]=> (display-stream voltage 10)

.1
5.5
22.
55.
110.
192.5
308.
462.
660.
907.5
1210.
;Unspecified return value
