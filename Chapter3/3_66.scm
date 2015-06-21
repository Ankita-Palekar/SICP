(define (pairs s t)
	(cons-stream (list (stream-car s) (stream-car t))
		(stream-append  (stream-map (lambda(x) (list (stream-car s) x)) (stream-cdr t))
			(pairs (stream-cdr s) (stream-cdr t)))))




(define (stream-append s1 s2)
	(if (stream-null? s1)
		s2
		(cons-stream (stream-car s1) (stream-append (stream-cdr s1) s2))))


(define (interleave s1 s2)
	(if (stream-null? s1)
		s2
		(cons-stream (stream-car s1) (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
	(cons-stream (list (stream-car s) (stream-car t))
		(interleave  (stream-map (lambda(x) (list (stream-car s) x)) (stream-cdr t))
			(pairs (stream-cdr s) (stream-cdr t)))))



3 error> (stream-ref	 pairs-stream 197)
;Value 40: (1 100)


will give you the pair of (1, 100)
genralising teh term fo rabove condition will 


