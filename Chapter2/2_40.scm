 (define (enumerate-interval low high)
	(if (> low high)
		nil
		(cons low (enumerate-interval (+ low 1) high))))

(accumulate append
		nil
			(map (lambda (i)
					(map (lambda (j) (list i j))
						(enumerate-interval 1 (- i 1))))
							(enumerate-interval 1 10)))

(define (flatmap proc seq)
	(accumulate append nil (map proc seq)))

(define (unique-pairs n)
	(map identity (flatmap (lambda (i) (map (lambda (j) (list i j))
																								(enumerate-interval 1 (- i 1))))
	(enumerate-interval 1 n))))
 


