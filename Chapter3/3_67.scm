(define (interleave s1 s2)
	(if (stream-null? s1)
		s2
		(cons-stream (stream-car s1) (interleave s2 (stream-cdr s1)))))
 

; to generate all unique pairs of the stream 
 (define (pairs s t)
 	(cons-stream (list (stream-car s) (stream-car t)) 
 			(interleave (interleave (stream-map (lambda(x) (list (stream-car s) x)) (stream-cdr t)) (pairs (stream-cdr s) (stream-cdr t))) 
 						(stream-map (lambda(x) (list (stream-car t) x)) (stream-cdr s)))))


(define (integers-starting-from n)
	(cons-stream n (integers-starting-from (+ n 1))))