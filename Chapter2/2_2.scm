


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


;constructing mid point as the coombination of all above procedures 

 


(define (mid-point seg)
	(let ((x1 (x-point (strt-seg seg)))
		(x2 (x-point	(end-seg seg)))
		(y1 (y-point	(strt-seg seg)))
		(y2 (y-point	(end-seg	seg))))
	(cons (average x1 x2) (average y1 y2))))

(define 
	(average x y)(/ (+ x y) 2))


(define (print-point p)
	(newline)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")"))


(define point-one (make-point -4 0))
(define point-two (make-point 4 0))
(define line-segment (make-seg point-one point-two))
(print-point (mid-point line-segment))
