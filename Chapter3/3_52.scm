(define sum 0)

(define (display-stream s) 
	(stream-for-each display-line s))


(define (accum x)
	(set! sum (+ x sum))
	sum)

(define (display-line x)
	(display x)
	(newline))

(define (stream-enumerate-interval low high)
	(if (> low high)
		the-empty-stream
		(cons-stream low (stream-enumerate-interval (+ low 1) high))))

(define seq (stream-map accum (stream-enumerate-interval 1 20)))

(define y (stream-filter even? seq))
(define z (stream-filter (lambda(x) (= (remainder x 5) 0)) seq))
(stream-ref y 7)

(display-stream z)


1 ]=> (stream-ref y 7)

;Value: 136

1 ]=> (display-stream z)
10
15
45
55
105
120
190
210

value of the sum is 10

2 error> sum
;Value: 210


if we would have used (lambda() <exp>) simply istead of using the delay function without using the mam-proc funtion then the value would have been the same but the execution would have not been the same because we are using the stream we are getting the result on demand or on  need whrease in other case it would have evaluated completely

Even the (display-stream) function does the same thing using stream-for-each it evalutaes the value