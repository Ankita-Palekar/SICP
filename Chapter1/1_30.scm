(define (sum term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (+ result (term a)))))
		(iter a 0))


(define (sum-iter a b)
	(sum square a inc b))

(define (square a)
		(* a a))

(define (inc a)
		(+ a 1))



