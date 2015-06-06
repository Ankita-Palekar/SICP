(define (union-set set1 set2)
	(cond ((and (null? set1) (null? set2))	nil)
				((and (null? set1) (not (null? set2))) set2)
				((and (null? set2) (not (null? set1))) set1)
				(else (union-set (cdr set1) (adjoin-set (car set1) set2)))))


(define (element-of-set? x set)
	(cond ((null? set) false)
				((equal? x (car set)) true)
				(else (element-of-set? x (cdr set)))))


(define (adjoin-set x set)
	(if (element-of-set? x set)
		set 
		(cons x set)))