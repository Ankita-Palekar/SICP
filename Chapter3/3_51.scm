(define (show x)
	(display-line x)
	x)

;cons-stream is also an premitive procedure
; stream-cdr are also premitive procedures
; stream-car are also premitive procedures

(define (stream-enumerate-interval low high)
	(if (> low high)
		the-empty-stream
		(cons-stream low (stream-enumerate-interval (+ low 1) high))))


(define (display-line x)
	(display x)
	(newline))


2 error> (define x (stream-map show (stream-enumerate-interval 0 1000)))
0
;Value: x
2 error> (stream-ref x 5)
1
2
3
4
5
;Value: 5
2 error> (stream-ref x 7)
6
7
;Value: 7


so delay cn be seen properly 

in first case values are printed till the 5 and in second case 
it is printed with the continutation so the value 