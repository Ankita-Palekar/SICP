(define (make-vect x y)
		(cons x y))

(define (xcor-vect z)
	(car z))


(define (ycor-vect z)
	(cdr z))


(define (add-vect vect1 vect2)
	(let ((x1 (xcor-vect vect1))
				(x2 (xcor-vect vect2))
				(y1 (ycor-vect vect1))
				(y2 (ycor-vect vect2)))
			(cons (+ x1 x2) (+ y1 y2))
	))

(define (reverse-vector vect)
	( cons (- (xcor-vect vect)) (-  (ycor-vect vect))))


(define (sub-vect vect1 vect2)
				(add-vect vect1 (reverse-vector vect2)))


(define (scale-vector vect factor)
	(cons (* factor (xcor-vect vect)) (* factor (ycor-vect vect))))

