


;constructor make-segment  and selectors start-seg and end-seg

(define (make-seg strt-seg end-seg)
	(cons strt-seg end-seg))

(define (strt-seg seg)
	(car seg))

(define (end-seg seg)
	(cdr seg))


; constructor make-point and selectors x-point and y-point 

(define (make-point x y )
	(cons x y))

(define (x-point point) 
	(car point))

(define (y-point point)
	(cdr point))


;constructing rectangle with the help of exercise 2.2 



(define 
	(average x y)(/ (+ x y) 2))


(define (print-point p)
	(newline)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")"))


;there are two methods of representing it 1st is where we can give co-ordinates to a rectangle ; second method we can give segment as the input

 
(define (rectangle a b c d)
	(newline)
	(display "-- rectangle co-ordinates --")
	(newline)
	(display (list a b c d))
	(newline)
	(let ((length (get-length a b c d))
		(breadth (get-breadth a b c d)))
		(newline)
		(display "--- perimeter")
		(rect-perimeter length breadth)
		(newline)
		(display "--- area----")
		(rect-area length breadth)))


(define (get-length a b c d)
	(abs	(- (x-point (strt-seg b)) (x-point (strt-seg c)))))

(define (get-breadth a b c d)
	(abs (- (y-point (end-seg a)) (y-point (end-seg d)))))

(define (rect-perimeter l b)
	(+ (* l 2) (* b 2)))

(define (rect-area l b)
	(* l b))

(define point-a (make-point 1 1))
(define point-b (make-point 1 4))
(define point-c (make-point 4 4))
(define point-d (make-point 4 1))

(define line-seg-a (make-seg point-a point-b))
(define line-seg-b (make-seg point-b point-c))
(define line-seg-c (make-seg point-c point-d))
(define line-seg-d (make-seg point-d point-a))

(rectangle line-seg-a line-seg-b line-seg-c line-seg-d) 

(get-length line-seg-a line-seg-b line-seg-c line-seg-d) 







