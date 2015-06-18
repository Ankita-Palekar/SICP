	(define nil '())

	(define	(make-queue)
		(let ((front-ptr nil)
					(rear-ptr nil)
					(q nil))

	 (define (empty-queue?)
	 	(null? front-ptr))
 
	(define (insert-queue! item)
		(let ((new-pair (cons item '())))
			(cond ((empty-queue?) (set! front-ptr new-pair) (set! rear-ptr new-pair))
						(else (set-cdr! rear-ptr new-pair)			
									(set! rear-ptr new-pair)))))

	(define (delete-queue!)
		(set-car! front-ptr (cdr front-ptr))
		(set! front-ptr (cdr front-ptr)))

	(define (print)
		(display front-ptr)) 

			(define (dispatch m)
				(cond ((eq? m 'insert-queue!) insert-queue!)
							((eq? m 'empty-queue?) empty-queue?)
							((eq? m 'delete-queue!) delete-queue!)
							((eq? m 'print) print)
							(else (error "invalid function " m))))
		dispatch))	
 


6 error> (define q (make-queue))
;Value: q

1 ]=> ((q 'insert-queue!) 'a)

;Value: ()

1 ]=> ((q 'print))
(a)
1 ]=> ((q 'insert-queue!) 'c)
;Value 31: (b c)
1 ]=> ((q 'insert-queue!) 'd)
;Value 32: (c d)
1 ]=> ((q 'insert-queue!) 'e)
;Value 33: (d e)
1 ]=> ((q 'print))
(a b c d e)
;Unspecified return value

1 ]=> ((q 'delete-queue!))
;Value 30: ((b c d e) b c d e)

1 ]=> ((q 'print))
(b c d e)
;Unspecified return value

1 ]=> ((q 'delete-queue!))
;Value 31: ((c d e) c d e)
1 ]=> ((q 'print))
(c d e)
;Unspecified return value

