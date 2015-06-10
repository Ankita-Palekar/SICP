; procedure term-list for dense polynomial like 


(define nil '())

(define (term-list-dense-poly poly-list)
	(define (dense-list L term-list)
		(if (null? L)
					(cdr (reverse term-list))
			(let ((first-ele (car L))
						(rest-ele (cdr L))
						(len (length L)))
				(cond ((= 0 first-ele) (dense-list rest-ele term-list))
							(else (dense-list rest-ele (append (list (list (- len 1) first-ele)) term-list)))))))
		(dense-list poly-list (list nil)))
	

(term-list-dense-poly (list 1 2 0 3 -2 -5))
;Value 25: ((5 1) (4 2) (2 3) (1 -2) (0 -5))
