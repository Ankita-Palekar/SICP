; definition for product function like sum
(define (product-cube a b)
	(product cube a inc b))

(define (product-square a b)
	(product square a inc b))

(define (inc a)
	(+ a 1))

(define (cube x)
	(* x x x))

(define (product term a next b)
	(if(> a b) 
		1
	(* (term a) (product term (next a) next b))))

(define (square x)
	(* x x))

; finding factorial of a numbe rwith the help of product function


(define (product-fact n)
	(product identity 1 inc n))

(define (identity x) x)


; iterative process

(define (product-iter term a next b)''
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (* result (term a)))))
		(iter a 1))

(define (product-fact-iter n)
	(product-iter identity 1 inc n))


;calculating approximation of pi using the recursive method for product 


(define (product term a next b)
	(if(> a b) 
		1
	(* (term a) (product term (next a) next b))))

(define (inc-two  a)
	(+ a 2))

(define (pi-approximate n)
	(define a 2)
	(define c 1)
	(define b n)
	(/ (product square (inc-two a) inc-two n) (product square (inc-two c) inc-two n)))

(define (square a)
	(* a a))

