(define dx 0.00001)


(define (smoothing f) 
	(lambda (x) (/ (+ (f (+ x dx)) (f x) (f (- x dx))) 3)))


(define (repeated smoothing n)
	(if (= n 0)
		(lambda (x) x)
			(compose smoothing (repeated smoothing (- n 1)))))

(define (compose f g) 
	(lambda (x) (f (g x))))



;outpuput using the smoothing function 