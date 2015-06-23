 

(define (chek-falls-in-range? val max-point min-point)
	(cond ((and (<= val max-point) (>= val min-point)) true)
				(else false)))


(define (make-zero-crossing input-stream last-value max-point min-point)
	(let ((avpt (cond ((chek-falls-in-range? (stream-car input-stream)) (/ (+ (stream-car input-stream) last-value) 2))
										(else last-value)) ))
		
		(cons-stream (sign-change-detector avpt last-value)
								 (make-zero-crossing (stream-cdr input-stream) avpt))))

 



note : there might be a need of threshhold to check what is the maximum value at which the signal value can be and what is the minimum value if  the stream input value is out of bounds of this max and min values then it is surely noise and should be neglacted 