(define (repeated f n)
	(if (= n 0)
		(lambda (x) x)
			(compose f (repeated f (- n 1)))))

(define (compose f g) 
	(lambda (x) (f (g x))))

(define (inc x) (+ x 1))


  ((repeated square 2) 5)

;Value: 625