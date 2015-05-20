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


 
 (define (search-for-primes lower-limit upper-limit) 
   (define (search-iter cur upper-limit) 
     (if (<= cur upper-limit) (timed-prime-test cur)) 
     (if (<= cur upper-limit) (search-iter (+ cur 2) upper-limit))
   ) 
   (search-iter (if (even? lower-limit) (+ lower-limit 1) lower-limit) 
                (if (even? upper-limit) (- upper-limit 1) upper-limit))) 
  





 

 

