(define (tower x)
	(let ((type (type-tag x)))
		(cond ((eq? type 'complex)3)
					((eq? type 'rational) 2) 
					((eq? type 'exact-integer) 1))))


(define (raise level x)
	(if (= level (tower x))
		x
		(raise level (raise-level-x x))))


(define (raise-level-x x)
	(apply-generic 'raise '(type-tag x)))


(define (apply-generic op . args)
	(let ((type-tags (map type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc
				(apply proc (map contents args))
					(if (= (length args) 2)
						(let ((a1 (car args))
									(a2 (cdr args)))
						(level1 (tower a1))
						(level2 (tower a2))
						(cond ((< level1 level2) (apply-generic op (raise level1 a1) a2))
									((< level2 level1) (apply-generic op a1 (raise level2 a2)))
									(else	(error "No method for these types"
								(list op type-tags)))))
										(error "No method for these types"
								(list op type-tags)))))))


;;using procedures from the earlier procedurs

(define (raise x) (apply-generic 'raise x))

(define (install-scheme-package )
	(define (raise-integer x)
		(if (integer-number? x)
			(make-rational x 1)
			(make-complex-from-real x 0)))
	(put 'raise '(scheme-number) raise-function))

(define (install-rational-package)
	(define (raise-rational x)
		(if (real? x)
			(make-complex-from-real x 0)))
	(put 'raise' '(rational-number) raise-function))



