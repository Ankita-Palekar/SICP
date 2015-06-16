(define (make-cycle x)
	(set-cdr! (last-pair x) x) x)

(define z (make-cycle (list 'a 'b 'c)))


(define (check-cycle x)
	(define ptr '())
	(set! ptr (car x))
		(define (check-cycle-1 round-loop)
			(cond ((null? round-loop) "loop does not exist")
						((eq? ptr (car round-loop)) "loop exist")
						(else (check-cycle-1 (cdr round-loop)))))
	
	(check-cycle-1 (cdr x)))
