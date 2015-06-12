(define (make-polynomial var term-list)
	(cons var term-list))


p1 : (define poly1 (make-polynomial 'x '((2 1) (1 -2)(0 1))))
p2 : (define poly2 (make-polynomial 'x '((2 11) (0 7))))
p3 : (define poly3 (make-polynomial 'x '((1 13) (0 5))))


Q1 : (define q1 (mul-poly poly1 poly2))  (11*x^4 - 22*x^3 + 18*x^2 - 14*x + 7)
Q2 : (define q2 (mul-poly poly1 poly3))	 (13*x^3 - 21*x + 3*x +5)


(define q1 (make-polynomial 'x '((4 11) (3 -22) (2 18) (1 -4) (0 7))))
(define q2 (make-polynomial 'x '((3 13) (2 -21) (1 3) (0 5))))

;;traced on the note book