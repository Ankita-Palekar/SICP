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

(define (display-line x)
	(newline)
	(display x))


 
(define (tripplets pair-list int-stream)
	(let ((pair-i-j (stream-car pair-list))
				(k (stream-car int-stream)))
			(cond ((= (square k) (weight1 pair-i-j)) (cons-stream (list pair-i-j k) (tripplets (stream-cdr pair-list) (stream-cdr int-stream))))
						((>  (square k) (weight1 pair-i-j)) (tripplets (stream-cdr pair-list) int-stream))
						((< (square k) (weight1 pair-i-j)) (tripplets pair-list (stream-cdr int-stream))))))
 
(define trip (tripplets wp integers))



output without using any of the interleaves 

1 ]=> (display-stream trip 10)

((3 4) 5)
((6 8) 10)
((5 12) 13)
((9 12) 15)
((8 15) 17)
((12 16) 20)
((7 24) 25)
((10 24) 26)
((20 21) 29)
((18 24) 30)
((16 30) 34)
;Unspecified return value

	