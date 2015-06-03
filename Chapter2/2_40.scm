
(accumulate append
		nil
			(map (lambda (i)
					(map (lambda (j) (list i j))
						(enumerate-interval 1 (- i 1))))
							(enumerate-interval 1 n)))

(define (flatmap proc seq)
	(accumulate append nil (map proc seq)))

(define (unique-pairs n)
	(map identity (flatmap (lambda (i) (map (lambda (j) (list i j))
																								(enumerate-interval 1 (- i 1))))
	(enumerate-interval 1 n))))
 

 