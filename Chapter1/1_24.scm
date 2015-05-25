#|
	
|#


(define (expmod base exp m)
	(cond ((= exp 0) 1)
		((even? exp)
			(remainder (square (expmod base (/ exp 2) m))
			m)
		)
		(else
		(remainder (* base (expmod base (- exp 1) m))
		m))
	))

(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
		(try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
	(cond ((= times 0) true)
		((fermat-test n) (fast-prime? n (- times 1)))
		(else false)))
  
(define (prime? n)
	(define times 10)
	(fast-prime? n times)
)

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

 
 

 (define (search-for-primes lower-limit upper-limit ) 
   (define (search-iter cur upper-limit ) 
     (if (<= cur upper-limit) (timed-prime-test cur))  
     (if (<= cur upper-limit) (search-iter (+ cur 2) upper-limit ))
   )
   (search-iter (if (even? lower-limit) (+ lower-limit 1) lower-limit) 
                (if (even? upper-limit) (- upper-limit 1) upper-limit)
             )
   ) 
 
computation is faster for 1.24 since it grows  with theta(log n ) where as in cas of 1.22 root(n)
  