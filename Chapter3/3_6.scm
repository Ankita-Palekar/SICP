(define (rand-update x)
	(let ((a 900)
				(b 555)
				(m 47))
		(remainder (+ (* a x) b) m)))

 (define random-init 100)

(define (rand-modified)
	(let ((x random-init))
		(lambda ()
			(set! x (rand-update x))
			x)))

(define (rand m)
(cond ((equal? m 'reset) (lambda(x) (set! random-init x) (rand-modified)))
			((equal? m 'generate) (rand-modified))))


