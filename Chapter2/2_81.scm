a=> It will not show any output and fall in loop because installed luis procedure returns the same type object again and since exp has been displayed in the scheme package it will not be available in the complex package

================================================================================================
b=> We need to do some improvements we cannot use luis code as it will take you in infinite loop 


================================================================================================

c => Modify apply generic procedure when it has two arguments of the same type 

			
(define (apply-generic op . args)
	(let ((type-tags (map type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc
				(apply proc (map contents args))
					(if (= (length args) 2)
						(let ((type1 (car type-tags))
							(type2 (cadr type-tags))
								(a1 (car args))
								(a2 (cadr args)))
						(let ((t1->t2 (get-coercion type1 type2))
							(t2->t1 (get-coercion type2 type1)))
							(cond ((equal? type1 type2) (error "call internal procedure"))
										(t1->t2 (apply-generic op (t1->t2 a1) a2))
										(t2->t1	(apply-generic op a1 (t2->t1 a2)))
										(else	(error "No method for these types"
								(list op type-tags))))))
										(error "No method for these types"
								(list op type-tags)))))))


since (put exp' '(scheme-number scheme-number)) 

package is defined internallyit will not be accessible for exp-complex-complex procedure hence we will have to either call internal procedure or halt the execution








