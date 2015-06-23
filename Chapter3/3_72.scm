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


(define square-weight (lambda(x) (+ (square (car x)) (square (cadr x)))))
(define square-pair (weighted-pairs integers integers square-weight))


(define (square-ramanujan-no stream-square-pair)
 	(let ((num1 (square-weight (stream-car stream-square-pair)))
 					(num2 (square-weight (stream-car (stream-cdr stream-square-pair))))
 					(num3 (square-weight (stream-car (stream-cdr (stream-cdr stream-square-pair))))))
 			(if(and  (= num1 num2) (= num1 num3))
 				(cons-stream (list num1 (stream-car stream-square-pair) (stream-car (stream-cdr stream-square-pair)) (stream-car (stream-cdr (stream-cdr stream-square-pair)))) (square-ramanujan-no (stream-cdr stream-square-pair)))
 				(square-ramanujan-no (stream-cdr stream-square-pair)))))


(define square-r-no (square-ramanujan-no square-pair))


(define (integers-starting-from-n n)
	(cons-stream n (integers-starting-from-n (+ n 1))))
(define integers (integers-starting-from-n 1))

(define (display-stream s n)
	(define (display-iter i n)
		(cond ((= i n) (display-line (stream-ref s n)))
						(else (display-line (stream-ref s i)) (display-iter (+ i 1) n))))
	(display-iter 0 n))

(define (display-line s)
 	(newline)
 		(display s))

1 ]=>  (display-stream square-r-no 10)

(325 (1 18) (6 17) (10 15))
(425 (5 20) (8 19) (13 16))
(650 (5 25) (11 23) (17 19))
(725 (7 26) (10 25) (14 23))
(845 (2 29) (13 26) (19 22))
(850 (3 29) (11 27) (15 25))
(925 (5 30) (14 27) (21 22))
(1025 (1 32) (8 31) (20 25))
(1105 (4 33) (9 32) (12 31))
(1105 (9 32) (12 31) (23 24))
(1250 (5 35) (17 31) (25 25))
;Unspecified return value

