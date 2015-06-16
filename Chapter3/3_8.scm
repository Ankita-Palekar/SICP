(define evaluate-counter '())
(define (f x)
	(cond ((eq? evaluate-counter '()) (set! evaluate-counter x) evaluate-counter)
				((= evaluate-counter 0) 0)
				((= evaluate-counter 1) 1)))



