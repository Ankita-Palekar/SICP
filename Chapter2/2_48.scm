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
			(cons (+ x1 x2) (+ y1 y2))))


(define (sub-vect vect1 vect2)
				(add-vect vect1 (reverse-vector vect2)))

(define (reverse-vector vect)
	(cons (- (xcor-vect vect)) (-  (ycor-vect vect))))

(define (make-segment start-segment end-segment)
	(cons start-segment  end-segment))

(define (start-segment segment)
	(car segment))

(define (end-segment segment)
	(cdr segment))


(define (segments->painter segment-list)
	(lambda(frame)
		(for-each 
			(lambda (segment)
				(draw-line	((frame-coord-map frame) (start-segment segment))
										((frame-coord-map frame) (end-segment segment))))
			segment-list)))


 (define (frame-coord-map frame)
	(lambda (x)
		(add-vect (origin-frame frame)
			(add-vect (scale-vector (xcor-vect x) 
																		(edge1-frame frame))
												(scale-vector (ycor-vect x)
																		(edge2-frame frame))))))


(define (make-frame origin edge1 edge2)
	(list origin edge1 edge2))

; (define (make-frame origin edge1 edge2)
; 	(cons origin (cons edge1 edge2)))

(define (origin-frame z)
	(car z))

(define (edge1-frame z)
	(cadr z))

(define (edge2-frame z)
	(caddr z))

(define (scale-vector vect factor)
	(cons (* factor (xcor-vect vect)) (* factor (ycor-vect vect))))
