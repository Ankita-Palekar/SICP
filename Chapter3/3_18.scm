(define (make-cycle x)
	(set-cdr! (last-pair x) x) x)

(define z (make-cycle (list 'a 'b 'c)))


(define (check-cycle x)
	 (define duplicate x)
	 (define ptr-var 'str-pointer)
	 (set-car! duplicate ptr-var)
	 
		(define (check-cycle-1 round-loop)
			(cond ((null? round-loop) "loop does not exist")
						((eq? ptr-var (car round-loop)) "loop exist")
						(else  (check-cycle-1 (cdr round-loop)))))	
	(check-cycle-1 (cdr duplicate)))



;Value: make-cycle
2 error> 
;Value: z
1 ]=> (check-cycle z)
;Value 11: "loop exist"
1 ]=> (define x (list 6 7 8))
;Value: x
1 ]=> (check-cycle x)
;Value 12: "loop does not exist"
1 ]=> (define x (list 1 2 3 1 2 3))
;Value: x
1 ]=> (check-cycle x)
;Value 12: "loop does not exist"
