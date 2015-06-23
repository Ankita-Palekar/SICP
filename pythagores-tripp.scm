(define (merge-weighted s1 s2 weight)
	(cond ((stream-null? s1) s2)
				((stream-null? s2) s1)
				(else (let ((s1car (stream-car s1))
										(s2car (stream-car s2)))
									(cond ((< (weight s1car) (weight s2car)) (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))
										((= (weight s1car) (weight s2car)) (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))
										(else (cons-stream s2car (merge-weighted s1 (stream-cdr s2) weight))))))))


(define (weighted-pairs s t weight)
	(cons-stream (list (stream-car s) (stream-car t))
		(merge-weighted  (stream-map (lambda(x) (list (stream-car s) x)) (stream-cdr t))
			(weighted-pairs (stream-cdr s) (stream-cdr t) weight) weight)))


 (define weight1 (lambda(x) (+ (square (car x)) (square (cadr x)))))

 (define (integers-starting-from-n n)
 	(cons-stream n (integers-starting-from-n (+ n 1))))

 (define integers (integers-starting-from-n 1))

(define (display-stream s n)
	(define (display-iter i n)
		(cond ((= i n) (display-line (stream-ref s n)))
						(else (display-line (stream-ref s i)) (display-iter (+ i 1) n))))
	(display-iter 0 n))

(define wp (weighted-pairs integers integers weight1))

(stream-filter )

(define (display-line x)
	(newline)
	(display x))