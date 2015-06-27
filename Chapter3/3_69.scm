
(define (interleave s1 s2)
	(if (stream-null? s1)
		s2
		(cons-stream (stream-car s1) (interleave s2 (stream-cdr s1)))))


(define (pairs s t)
	(cons-stream (list (stream-car s) (stream-car t))
		(interleave  (stream-map (lambda(x) (list (stream-car s) x)) (stream-cdr t))
			(pairs (stream-cdr s) (stream-cdr t)))))


	(define (tripples s j k)
		(cons-stream (list (stream-car s) (stream-car j) (stream-car k))
			(interleave (stream-map (lambda(x) (list (stream-car s) (car x) (cadr x)) ) (pairs j k)) (tripples (stream-cdr j) (stream-cdr j) (stream-cdr k)))))


(define (pythagores-tripplets? trips)
	(let ((a (car trips))
				(b (cadr trips))
				(c (caddr trips)))
	(cond ((= (square c) (+ (square a) (square b))) true)
					(else false)))))


(define (integers-starting-from-n n)
	(cons-stream n (integers-starting-from-n (+ n 1))))

(define integers (integers-starting-from-n 1))

(define trips (tripples integers integers integers))

(define tripplet (stream-filter (lambda(trips) (pythagores-tripplets? trips)) trips))


 note : needs to use some the pairs prcoedure part since the series is same as that of the pairs with only dufference in the appending of the new integers series in the term 


