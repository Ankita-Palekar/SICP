	(define (largest-three a b c)
		(cond ((and (>= a b ) (>= a c))
						(if (>= b c) (+ (square a) (square b))
								(+ (square a) (square c))))
					((and (>= b a) (>= b c))
						(if (>= a c) (+ (square b) (square c))
								(+ (square b) (square c))))
					((and (>= c a ) (>= c b))
						(if (>= a b) (+ (square c) (square a))
								(+ (square c) (square b))))))


 