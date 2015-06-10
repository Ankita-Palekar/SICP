

not: check-if-coercian-true true is used ti check if it evaluates to be true i,e if coercian table has the result otherwise 

(define (apply-generic op . args)
	(define (apply-generic-1 op .args)
		(let ((type-tags (map type-tag (cdr args)))
					(types-list (car args)))
			(if proc
				(apply proc (map contents (cdr args)))
				(cond ((check-if-coercian-true types-list (append (cdr types-list) (apply-generic-1 op (map (lambda (x) (get-coercian (car types-list) x) (cdr type-tags)) ))))))
							(else (error "no method found")))))
			(let ((types (map type-tag args)))
			(apply-generic-1 op .(append types args))
			))


(define (check-if-coercian-true list)
	(if (pair? list)
		(and (get-coercian (car list) (cadr list)) (check-if-coercian-true (append (car list) (cddr list))))
		true))


 


