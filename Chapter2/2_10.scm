
(define (add-interval x y)
	(make-interval (+ (lower-bound x) (lower-bound y))
		(+ (upper-bound x) (upper-bound y))))
 
(define (mul-interval x y)
	(let ((p1 (* (lower-bound x) (lower-bound y)))
		(p2 (* (lower-bound x) (upper-bound y)))
		(p3 (* (upper-bound x) (lower-bound y)))
		(p4 (* (upper-bound x) (upper-bound y))))
		(make-interval 	(min p1 p2 p3 p4) 
										(max p1 p2 p3 p4))))



;original div interval
(define (div-interval x y)
	(mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			(/ 1.0 (lower-bound y)))))



(define (make-interval a b) (cons a b))

(define (sub-interval x y)
	(make-interval (- (lower-bound x) (upper-bound y)) 
									(- (upper-bound x) (lower-bound y))))




 

(define (make-interval a b)
	(cons a b))

(define (upper-bound x)
	(car x))

(define (lower-bound y)
	(cdr y))

(define (print-interval interval) 
	(newline)
	(display "[")
	(display (lower-bound interval))
	(display ",")
	(display (upper-bound interval))
	(display "]"))


(define interval1 (make-interval 1 3))
(define interval2 (make-interval 2 4))
(print-interval (div-interval interval1 interval2))

;using alyssas modify method if upper-bound is zero or lower bound is zero it will give an error stating divide by zero error 
;modifying alyssas code 

(define (display-error)
	(newline)
	(display "divide by zero error"))


(define (div-interval x y)
	(let ((up-limit (upper-bound y))
				(low-limit (lower-bound y)))
		(if (or (= up-limit 0) (= low-limit 0))
			(display-error)
			(mul-interval x
			(make-interval (/ 1.0 up-limit)
				(/ 1.0 low-limit))))))




