;Alyssas procedures

(define (add-interval x y)
	(make-interval (+ (lower-bound x) (lower-bound y))
		(+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
	(let ((p1 (* (lower-bound x) (lower-bound
		(p2 (* (lower-bound x) (upper-bound
		(p3 (* (upper-bound x) (lower-bound
		(p4 (* (upper-bound x) (upper-bound
		(make-interval (min p1 p2 p3 p4)
		(max p1 p2 p3 p4))))

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


 

;procedures defined by lem 

(define (part1 r1 r2)
	(div-interval 
		(mul-interval r1 r2) 
		(add-interval r1 r2)))


(define (part2 r1 r2)
	(let ((one (make-interval 1 1)))
		(div-interval one (add-interval (div-interval one r1)
																		(div-interval one r2)))))


 (define A (make-interval 1 5))
 (define B (make-interval 2 9))

;solutions to the problem with part1 and part2 

12 error> (part1 A B)
;Value 21: (.14285714285714285 . 15.)

12 error> (part2 A B)
;Value 22: (.6666666666666666 . 3.2142857142857144)

12 error> (div-interval A B)
;Value 23: (.1111111111111111 . 2.5)

12 error> (div-interval A A)
;Value 24: (.2 . 5.)


12 error> (div-interval B A)
;Value 25: (.4 . 9.)