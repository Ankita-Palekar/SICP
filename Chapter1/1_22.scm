#|
	
|#


(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (runtime))
)


(define (start-prime-test n start-time)
	(if (prime? n)
		(report-prime (- (runtime) start-time))
		 
	)
)

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time)
)


(define (search-for-primes  n)
	(if (odd? n)
		(
			(start-prime-test n start-prime-test)
			(search-for-primes  (- n 1))
		)
		(search-for-primes (- n 1))
	) 
)

(define (odd? a)
	(= (remainder a 2) 1)
)


(define (smallest-divisor n)
	(find-divisor n 2))
		(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
		(define (divides? a b)
	(= (remainder b a) 0))

(define (prime? n)
(= n (smallest-divisor n)))


 
 (define (search-for-primes first last) 
   (define (search-iter cur last) 
     (if (<= cur last) (timed-prime-test cur)) 
     (if (<= cur last) (search-iter (+ cur 2) last))) 
   (search-iter (if (even? first) (+ first 1) first) 
                (if (even? last) (- last 1) last))) 
  





 

 

