; for cubing using procedure template 

(define (sum cube a next b)
	(if(> a b)
		0
		(+ (cube a) (sum cube  (inc a) inc b ))
	)
)


(define (sum-cubes a b)
	(sum cube a inc b)
)

(define (inc x)
	(+ x 1)
)
; for  adding sequentially 
(define (sum-integers a b) 
	(sum identity a inc b)
	)

(define (identity a) a)


; for pi-sum 

(define (pi-sum a b)
	(define (pi-term x)
		(/ 1.0 (* x (+ x 2))))
	(define (pi-next x)
		(+ x 4)
	)
	(sum pi-term a pi-next b))

  
(define (integral f a b dx)
	(define (add-dx x)(+ x dx))
	(* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (sum term a next b)
	(if(> a b) 
		0
		(+ (term a) (sum term (next a) next b)) ))


(define (product term a next b)
	(if(> a b) 
		1
		(* (term a) (product term (next a) next b)) ))


(define (accumulate combiner null-value term a next b)
	(if(> a b) 
		null-value
		(combiner (term a)(accumulate combiner null-value term a next b))))



;testing lambda and the let functionality 
(define (f x y)
	(let((a (+ 1 (* x y)))
			 (b (- 1 y)))
	+ (* (square a) y) (* y b) (* a b)))


(define (f x y)
	(lambda (x y)
		(+	(* x (square a)
				(* y b)
				(* a b)))
		(+ 1 (* x y)
		(- 1 y))))


(+ (let ((x 3)) (+ x (* x 10))))
 

(define (search f neg-point pos-point)
	(let ((midpoint (average neg-point pos-point)))
		(if (close-enough? neg-point pos-point)
			midpoint
				(let ((test-value (f midpoint)))
					(cond ((positive? test-value)
						(search f neg-point midpoint))
					((negative? test-value)
						(search f midpoint pos-point))
					(else midpoint))))))



(define (half-interval-method f a b)
	(let ((a-value (f a))
		(b-value (f b)))
			(cond ((and (negative? a-value) (positive? b-value))
				(search f a b))
			((and (negative? b-value) (positive? a-value))
				(search f b a))
			(else
			(error "Values are not of opposite sign" a b)))))

(define (positive? val) 
	(>= val 0))

(define (negative? val)
	(< val 0))

(define (close-enough? neg-point pos-point) 
	(< (abs (- neg-point pos-point)) 0.0001))

(define (average neg-point pos-point)
	(/ neg-point pos-point))


;testing fixed point algorithm 




;testing for the derive algorithm 


(define (derive g)
	(lambda (x) 
		(/ (- g (+ x dx)) (g x) 
			dx)))


(define (cube x) (* x x x))


 


 (define (count-change amount) 
   (cc amount 5)) 
 
 (define (cc amount kinds-of-coins) 
   (cond ((= amount 0) 1) 
         ((or (< amount 0) (= kinds-of-coins 0)) 0) 
         (else (+ (cc amount 
                      (- kinds-of-coins 1)) 
                  (cc (- amount 
                         (first-denomination kinds-of-coins)) 
                      kinds-of-coins))))) 
 
 (define (first-denomination kinds-of-coins) 
 	( kinds-of-coins
 		(cond ((= kinds-of-coins 1) 50) 
         ((= kinds-of-coins 2) 25) 
         ((= kinds-of-coins 3) 10) 
         ((= kinds-of-coins 4) 5) 
         ((= kinds-of-coins 5) 1)))) 


 