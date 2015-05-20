#|
	
	The process that a procedure generates is of course dependent on the rules used by the
interpreter. As an example, consider the iterative gcd procedure given above. Suppose we were to
interpret this procedure using normal-order evaluation, as discussed in section 1.1.5. (The normal-order-
evaluation rule for if is described in exercise 1.5.) Using the substitution method (for normal order),
illustrate the process generated in evaluating (gcd 206 40) and indicate the remainder operations
that are actually performed. How many remainder operations are actually performed in the normal-
order evaluation of (gcd 206 40)? In the applicative-order evaluation?


|#


(define (gcd a b)
	(if (= b 0)
		a
	(gcd b (remainder a b)))
)

Normal order evalutation
(gcd 206 40)_
(gcd 40 (remainder 206 40))
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))


processing of the remainder function 

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(gcd (remainder 6 (remainder 40 6)) (remainder (remainder 40 6) (remainder 6 (remainder 40 6))))
(gcd (remainder 6 4) (remainder 4 (remainder 6 4)))
(gcd 2 (remainder 4 2))
(gcd 2 0)
2

remainder function is evaluated 4 times 
1=> (remainder 206 40)
2=> (remainder 40 6)
1=> (remainder 6 4)
1=> (remainder 4 2)

applicative order evaluation 

(gcd 206 40)
(gcd 40 (remainder 206 40)) ; remainder function evaluated first time
	(gcd 40 6)
(gcd 6 (remainder 40 6))   	; remainder function evaluated second time
	(gcd 6 4)
(gcd 4 (remainder 6 4))     ; remainder function evaluted third time 
	(gcd 4 2)
(gcd 2 (remainder 4 2))     ; remainder function evaluated fourth time
	(gcd 2 0)
	2













 
 
 

 
