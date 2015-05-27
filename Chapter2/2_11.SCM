; consider a b for this 3 conditions are  
a<b<=0
a<0<b
0<=a<b



(define (modified-mul-interval x y)
	(let ((a1 (lower-bound x))
				(a2 (lower-bound y))
				(b1 (upper-bound x))
				(b2 (upper-bound y)))
		(cond ((and (and (or (<= a1 0) (a1 >= 0)) (or (<= a2 0) (>= a2 0))) (and (= b1 0) (= b2 0)))  (make-interval (* a1 a2) 0))
					((and (and (or (>= b1 0) (b1 <= 0)) (or (>= b2 0) (<= b2 0))) (and (= a1 0) (= a2 0))) 	(make-interval 0 (* b1 b2)))
					(else (let ((p1 (* (lower-bound x) (lower-bound y)))
								 			(p2 (* (lower-bound x) (upper-bound y)))
								 			(p3 (* (upper-bound x) (lower-bound y)))
								 			(p4 (* (upper-bound x) (upper-bound y)))))
											(make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))))





