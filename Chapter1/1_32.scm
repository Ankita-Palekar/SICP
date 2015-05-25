#|
	

#|

;recursive process 
(define (accumulate combiner null_value term a next b)
	(if(> a b) 
		null_value
		(combiner (term a)(accumulate combiner null_value term (next a) next b))))

(define (identity a) a)

(define (inc a)
	(+ a 1))

(define (square x) 
				(* x x))



(define (combiner a b)
				(combiner a (+ b 1)))

;iterative process
(define (accumulate combiner null_value term a next b)
	(define (iter a result)
		(if (> a b)
			result 
			(iter (next a) (combiner result (term a)))))
	(iter a null_value))


(define (sum term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (+ result (term a)))
		))

 
