
(define (double proc) 
	(lambda (x) (proc (proc x))))


(define (inc x) (+ x 1))


value of 

(((double (double double)) inc) 5)

;Value: 21