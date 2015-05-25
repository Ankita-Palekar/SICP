
(define (expmod base exp m)
	(cond ((= exp 0) 1)
	((even? exp)
	(remainder (square (expmod base (/ exp 2) m))
m))
(else
	(remainder (* base (expmod base (- exp 1) m))
m))))

(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
		(try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
	(cond ((= times 0) true)	
((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))


solution : (fermats-test 561) 
;Value: #t
561 is div by 3

(fermats-test 1105)
;Value: #t
561 is div by 5

(fermat-test 1729)
;Value: #t
1729 is div by 7

(fermat-test 2465)
;Value: #t
2465 is div by 7

(fermat-test 2821)
;Value: #t
2821 is div by 7

(fermat-test 6601)
;Value: #t
6601 is div by 7










