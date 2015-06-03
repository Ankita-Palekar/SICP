(define (make-frame origin edge1 edge2)
	(list origin edge1 edge2))

(define (make-frame origin edge1 edge2)
	(cons origin (cons edge1 edge2)))

(define (origin-frame z)
	(car z))

(define (edge1-frame z)
	(cadr z))

(define (edge2-frame z)
	(caddr z))