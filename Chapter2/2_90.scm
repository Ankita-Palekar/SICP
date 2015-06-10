(define (install-package-polynomial)
;; will have all polynomial packages which are common to both sparse and dense polynomial 

	(define (install-dense-polynomial)
		;; internal packages for the dense polynomials 
			(define (first-term-dense term-list)
			(list (- (length term-list) 1) (car term-list)))

			(define (order-dense term)
			(car term))
			
			(define (coeff-dense term)
				(cdr term))


			;; interface to the outside world
			(put 'first-term 'dense first-term-dense)
			(put 'order 'dense order)
			(put 'coeff 'dense coeff-dense)
			(put 'add '(dense dense) add)
			)

		

		(define (install-sparse-polynomial)
			(define (first-term-sparse term-list)
				(car term-list))
			
			(define (order-sparse term)
				(car term))
			
			(define (coeff-sparse term)
				(cdr term)))

		;;interface to the outside world

		(put 'first-term 'sparse first-term-sparse)
		(put 'order 'sparse order-sparse)
		(put 'coeff 'sparse coeff-sparse)
			
	)

 