(define (cont-frac n d k)
	(if (= k 0)
		(/ n d)
	(/ n (+ d (cont-frac n d (- k 1))))))
 

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)




solution : a =>  approximations required is uptill k=12
b>


;iterative process 

(define (cont-frac n d k)
	(define (iter result counter)
		(if (= counter k)
			result
			(iter (/ d (+ n result)) (+ counter 1))))
	(iter 1 0))



