; note its taking additional plus 1

;to obtain the sum of all primenumbers in the range 

(define (accumulate combiner null_value term a next b filter)
	(cond((> a b) null_value)
			((filter a b) (combiner (term a)(accumulate combiner null_value term (next a) next b filter)))
		 (else (accumulate combiner null_value term (next a) next b filter))))


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


(define (identity a) a)

(define (inc a)
	(+ a 1))

 


;finding the relative prime number 

(define (relative-prime? a b)
	(= (gcd a b) 1))

(define (gcd a b)
	(if (= b 0)
		a
	(gcd b (remainder a b))))

(define (identity a) 
	a)



