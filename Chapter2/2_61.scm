;ordered list implementation of an adjoin tree

(define (element-of-set? x set)
	(cond ((null? set) false)
				((= x (car set)) true)
				((< x (car set))	false)
				(else (element-of-set? x (cdr set)))))

(define nil '())

(define (intersection-set set1 set2)
	(if (or (null? set1) (null? set2))
				nil
				(let ((x1 (car set1))
							(x2 (car set2)))
					(cond ((= x1 x2) (cons x1 (intersection-set (cdr set1) (cdr set2))))
								((< x1 x2) (intersection-set (cdr set1) set2))
								((> x1 x2) (intersection-set set1 (cdr set2)))))))

;===============================================================
Implementing adjoin set in terms of the orderd list 

(define (adjoin-set x set)
	(if (element-of-set? x set)
		set
		(cons x set)))

Explaination:adjoin procedure remains the same
element-of-set take care of all the conditions required for the ordered list element-of-set


Below is the procedure given for the union of two sets noramally it requires n steps but because we are using element-of-set procedure number of steps are decreased drastically  hence using a single procedure drops down your complexity 




(define (union-set set1 set2)
	(cond ((and (null? set1) (null? set2))	nil)
				((and (null? set1) (not (null? set2))) set2)
				((and (null? set2) (not (null? set1))) set1)
				(else (union-set (cdr set1) (adjoin-set (car set1) set2)))))


