;combinationof cons ans cars for the following 
1=> (1 3 (5 7) 9)

;Value 17: (1 3 (5 7) 9)
15 error> (car (car (cdr (cdr x))))

2 => ((7))
(define x (list '(7)))
(car (car x))

3 => (1 (2 (3 (4 (5 (6 7))))))
	(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr x))))))))))))


