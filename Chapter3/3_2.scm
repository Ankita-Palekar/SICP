(define (inc a)
	(+ a 1))

(define (make-monitored x)
	(define call-count 0)
	(define (dispatch m)
		(cond ((equal? 'how-many-calls? m) call-count)
					((equal? 'reset-count? m) (set! call-count 0))
							(else (set! call-count (inc call-count)) (x m))))
	dispatch)


;same function using the local variable 
; Below function works similarly as the first one but it is used sinc ein real practical problem there is a possibility that someone might use the define variable outside making it global, this will go against the concept of lcoal variable


(define (make-monitored x)
	(let ((call-count 0))
		(define (dispatch m)
		(cond ((equal? 'how-many-calls? m) call-count)
					((equal? 'reset-count? m) (set! call-count 0))
							(else (set! call-count (inc call-count)) (x m))))
		dispatch
		))




1 ]=> (define s (make-monitored sqrt))
;Value: s

1 ]=> (s 100)
;Value: 10

1 ]=> (s 'how-many-calls?)
;Value: 1

1 ]=> (s 40)
;Value: 6.324555320336759


1 ]=> (s 'how-many-calls?)
;Value: 2

1 ]=> (s 'reset-count?)
;Value: 2

1 ]=> (s 'how-many-calls?)
;Value: 0


;trying with different procedures 

(define (new-proc x)
	(+ x 4)
	)
