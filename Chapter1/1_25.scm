
define (fast-expt b n)
	(cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))

	(define (expmod base exp m)
(remainder (fast-expt base exp) m))

 

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

 solution:


She is correct? But procedure will not serve for the fast prime since it takes lot of time for computation 
expmod uses successive squaring because of number of steps grows logarithmically