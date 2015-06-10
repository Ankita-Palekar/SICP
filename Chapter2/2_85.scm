
complex 
	|
real
	|
rational 
	|
integer


; internal scheme packaage
(define (install-scheme-package )
	(define (project-real-ineteger x)
		(cond ((number? x) (round x))
					(else (error "cannot be pushed more down" x))))
;installing real-integer package 
	(put 'project 'real-integer project-real-ineteger))


(define (install-rational-package)
	(define (project-complex-real x)
		(let ((real (get 'real-part x))
					(imag (get 'imag-part x)))

			(cond ((= imag 0) (push (attach-tag real) ))
						((not (= imag 0)) ("cannot be pushed more down")))))

	(put 'project 'complex-real project-complex-real))


(define (install-complex-package)
	(define (push (attach-tag x))))

(define (project-operation x)
	(apply-generic 'project x))


(define (push x)
	(apply-generic 'push x))

(define (drop x)
	(let ((type (type-tag x))
				(content (contents x)))
		(cond ((= type-tag 'complex) (project-operation (cons 'complex-real content)))
					((= type-tag 'rational)(project-operation (cons 'real-integer content)))
					(else (error "halt execution")))))


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
						(cond ((< level1 level2) (apply-generic op a1 (drop a2)))
									((< level2 level1) (apply-generic op (drop a1) a2))
									(else	(error "No method for these types"
								(list op type-tags)))))
										(error "No method for these types"
								(list op type-tags)))))))
