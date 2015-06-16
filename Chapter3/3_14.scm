](define (mystery x)
	(define (loop x y)
		(if(null? x)
			y
			(let ((temp (cdr x)))
				(set-cdr! x y)
					(loop temp x))))
		(loop x '()))

;Value: mystery
1 ]=> (define	v (list 'a 'b 'c 'd))
1 ]=> v
;Value 11: (a b c d)
1 ]=> (define w (mystery v))
1 ]=> w
;Value 12: (d c b a)

1 ]=> v
;Value 11: (a)

It produces the reverse of list aas output 

box diagram drawn on the note book