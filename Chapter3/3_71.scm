(define (merge-weighted s1 s2 weight)
	(cond ((stream-null? s1) s2)
				((stream-null? s2) s1)
				(else (let ((s1car (stream-car s1))
										(s2car (stream-car s2)))
									(cond ((< (weight s1car) (weight s2car)) (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))
										((= (weight s1car) (weight s2car)) (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))
										(else (cons-stream s2car (merge-weighted s1 (stream-cdr s2) weight))))))))

(define cube-weight (lambda(x) (+ (cube (car x)) (cube (cadr x)))))

(define (cube x) (* x x x))

(define (weighted-pairs s t weight)
	(cons-stream (list (stream-car s) (stream-car t))
		(merge-weighted  (stream-map (lambda(x) (list (stream-car s) x)) (stream-cdr t))
			(weighted-pairs (stream-cdr s) (stream-cdr t) weight) weight)))

(define (ramanujan-no stream-cube-pair)
 	(let ((num1 (cube-weight (stream-car stream-cube-pair)))
 					(num2 (cube-weight (stream-car (stream-cdr stream-cube-pair)))))
 			(if (= num1 num2)
 				(cons-stream (list num1 (stream-car stream-cube-pair) (stream-car (stream-cdr stream-cube-pair))) (ramanujan-no (stream-cdr stream-cube-pair)))
 				(ramanujan-no (stream-cdr stream-cube-pair)))))


(define (display-stream s n)
	(define (display-iter i n)
		(cond ((= i n) (display-line (stream-ref s n)))
						(else (display-line (stream-ref s i)) (display-iter (+ i 1) n))))
	(display-iter 0 n))

(define (display-line s)
 	(newline)
 		(display s))



(define cube-pair (weighted-pairs integers integers cube-weight))

 1 ]=> (define r-no (ramanujan-no cube-pair))
;Value: r-no
1 ]=> (display-stream r-no 10)

(1729 (1 12) (9 10))
(4104 (2 16) (9 15))
(13832 (2 24) (18 20))
(20683 (10 27) (19 24))
(32832 (4 32) (18 30))
(39312 (2 34) (15 33))
(40033 (9 34) (16 33))
(46683 (3 36) (27 30))
(64232 (17 39) (26 36))
(65728 (12 40) (31 33))
(110656 (4 48) (36 40))
;Unspecified return value
 