(define (sqrt x tolerance)
 	(stream-limit (sqrt-stream x) tolerance))

(define (stream-limit stream tolerance)
	(let ((sq-stream (stream-car (stream-cdr stream))))
			(if (< (abs (- (stream-car stream) sq-stream)) tolerance)
					sq-stream
					(stream-limit (stream-cdr stream) tolerance))))


(define (display-stream s) 
	(stream-for-each display-line s))

(define (display-line x)
	(newline)
	x)

