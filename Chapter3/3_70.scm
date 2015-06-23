(define (merge-weighted s1 s2 weight)
	(cond ((stream-null? s1) s2)
				((stream-null? s2) s1)
				(else (let ((s1car (stream-car s1))
										(s2car (stream-car s2)))
									(cond ((< (weight s1car) (weight s2car)) (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))
										((= (weight s1car) (weight s2car)) (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))
										(else (cons-stream s2car (merge-weighted s1 (stream-cdr s2) weight))))))))

(define weight1 (lambda(x) (+ (car x) (cadr x))))

(define (weighted-pairs s t weight)
	(cons-stream (list (stream-car s) (stream-car t))
		(merge-weighted  (stream-map (lambda(x) (list (stream-car s) x)) (stream-cdr t))
			(weighted-pairs (stream-cdr s) (stream-cdr t) weight) weight)))


(define (integers-starting-from-n n)
	(cons-stream n (integers-starting-from-n (+ n 1))))

(define integers (integers-starting-from-n 1))

(define w-p (weighted-pairs integers integers weight1))

(define weight2 (lambda (x) (+ (* 2 (car x)) (* 3 (cadr x)) (* 5 (car x) (cadr x)))))
 
(define pairs-not-2-3-5 (weighted-pairs integers integers weight2))

(define (divide? x y) (or (= (remainder (car y) x) 0) (= (remainder  (cadr y) x) 0)))
(define not-2-3-5 (stream-filter (lambda(x) (not (or (divide? 2 x) (divide? 3 x) (divide? 5 x)))) pairs-not-2-3-5))


(define (display-stream s n)
	(define (display-iter i n)
		(cond ((= i n) (display-line (stream-ref s n)))
						(else (display-line (stream-ref s i)) (display-iter (+ i 1) n))))
	(display-iter 0 n))

 (define (display-line s)
 	(newline)
 		(display s))


 1 ]=> (display-stream w-p 15)
(1 1)
(1 2)
(1 3)
(2 2)
(1 4)
(2 3)
(1 5)
(2 4)
(3 3)
(1 6)
(2 5)
(3 4)
(1 7)
(2 6)
(3 5)
(4 4)


1 ]=> (display-stream not-2-3-5 7)
(1 1)
(1 7)
(1 11)
(1 13)
(1 17)
(1 19)
(1 23)
(1 29)
;Unspecified return value
