(define nil '())

(define (subset s)
	(if(null? s)
			(list nil)
			(let ((rest (subset (cdr s))))
				(append rest (map (lambda (x) (if (pair? s) (subset (car s)))) rest))
				)))



(define (subset s)
	(if(null? s)
			(list nil)
			(let ((rest (subset (cdr s))))
				(append rest (map reverse rest))
				)))
	
(define (identity x) x)
 