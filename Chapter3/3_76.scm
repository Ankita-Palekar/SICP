
 

 (define (smooth stream)
	(stream-map (lambda(x y) (/ (+ x y) 2)) (stream-cdr stream) (stream-cdr (stream-cdr stream))))

(define (make-zero-crossing filtered-stream last-value)
	(cons-stream (sign-change-detector (stream-car filtered-stream) last-value) (make-zero-crossing (stream-cdr filtered-stream) last-value)))


