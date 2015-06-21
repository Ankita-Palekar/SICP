It prducesthe given below series if the promise has been run

(1 4 8 16 32)




(define s (cons-stream 1 (add-stream s s)))

(define (add-stream s1 s2)
	(stream-map + s1 s2))


(define (scale-stream stream factor)
	(stream-map (lambda(x) (* x factor)) stream))


 