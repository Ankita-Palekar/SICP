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


 ;procedure to add rational numbers try 


(define (add-rat x y)
	(make-rat 
		(+ 
			(* (numer x) (denom y)) (* (numer y) (denom x))) 
			(* (denom y) (denom x))))


(define (numer x) 
	(car x))

(define (denom x)
	(cdr x))

(define (make-rat x y)
	(cons x y))

(define (print-rat x)
	(newline)
	(display (numer x))
	(display "/")
	(display (denom x)))

(define one-half  (make-rat 1 2))_

(define one-third 
	(make-rat 1 3))


(print-rat (add-rat one-half one-third))

(define two-third (make-rat 2 3))

(define third-half (make-rat 3 2))

(define minus-half (make-rat -1 2))

(define plus-half (make-rat 1 2))



(define minus-frac (make-rat -2 3))			

(define plus-frac (make-rat 1 2))




(define (gcd a b)
	(if (= b 0)
		a
	(gcd b (remainder a b))))


 (define (make-rat n d)
		(let ((g (if (< d 0) - + )))
			(cons (/ n g) (/ d g))))


(print-rat (add-rat two-third third-half))

; using constructor and selectors only without any data structure
(define (cons x y)
	(define (dispatch m)
		(cond ((= m 0) x)
			((= m 1) y)
			(else (error "argument non zero " m)))) dispatch)
(define (car z) (z 0))
(define (cdr z) (z 1))




(pair? (cons 1 2))


;alysaa hackers interval problem

(define (add-interval x y)
	(make-interval (+ (lower-bound x) (lower-bound y))
		(+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
	(let ((p1 (* (lower-bound x) (lower-bound
		(p2 (* (lower-bound x) (upper-bound
		(p3 (* (upper-bound x) (lower-bound
		(p4 (* (upper-bound x) (upper-bound
		(make-interval (min p1 p2 p3 p4)
		(max p1 p2 p3 p4))))

(define (div-interval x y)
	(mul-interval x
	(make-interval (/ 1.0 (upper-bound y))
	(/ 1.0 (lower-bound y)))))


(define (make-interval a b) (cons a b))

(define (sub-interval x y)
	(make-interval (- (lower-bound x) (upper-bound y)) 
									(- (upper-bound x) (lower-bound y))))



;my favourite 
;definning lists as the sequnce of data 

;recursive method

(define (list-ref items n)
	( if(= n 0 )
		(car items)
		(list-ref (cdr items) (- n 1))))

;to find the length of the item 


(define (length items)
	(if (null? items)
		0
		(+ 1 (length (cdr items)))))


(define odd-list (list 1 3 5 7 9 11))

(define square (list 1 4 9 16 25))

;testing for the non arbitary number of argumenst

(define (f x y . z)
	(display z))

(define (g . w)
	(display w))



; mapping is also a property of the closure 

(define (scaling-list items factor)
	(if(null? items)
		'();nil
		(cons (* (car items) factor) (scaling-list (cdr items) factor))))


;using higher order procedures to map 

(define (map proc items)
	(if (null? items)
		'()
		(cons (proc (car items)) (map proc (cdr items)))))


(define (scaling-list items factor)
	(map (lambda (x) (* x factor)) items))


;procedure to count leaves of a sequential lis given
(define (count-leaves x)
	(cond  ((null? x) 0)
					((not (pair? x)) 1 )
					(else (+ (count-leaves (car x))
									 (count-leaves (cdr x))))))


;amount change problem 

 (define (count-change amount)
		(cc amount 5))


(define (cc amount kinds-of-coins)
	(cond ((= amount 0) 1)
		((or (< amount 0) (= kinds-of-coins 0)) 0)
		(else  (newline)
			 ( if(and (= kinds-of-coins 1) (= amount 1))
			 		(display  "--- way---"))
			(+ (cc amount(- kinds-of-coins 1))
		(cc (- amount
		(first-denomination kinds-of-coins))
			kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
	(cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 5) 50)))


;tree scaling

(define (scale-tree tree factor)
	(cond ((null? tree) '())
				((not (pair? tree)) (* tree factor))
				(else (cons (scale-tree (car tree) factor) (scale-tree (cdr tree) factor)))))

(define (scale-tree tree factor)
	(map (lambda (sub-tree) (if (pair? sub-tree) (scale-tree sub-tree factor) (* sub-tree factor))) tree))


(define (scale-tree tree factor)
	(map (lambda (sub-tree) (if (pair? sub-tree) (scale-tree sub-tree factor) (square sub-tree ))) tree))


(define (map proc items)
	(if (null? items)
		'()
		(cons (proc ( car items)) (map proc (cdr items)))))



 
 



(define (enumerate-interval low high)
	(if (> low high)
		nil
		(cons low (enumerate-interval (+ low 1) high))))



(define (enumerate-tree tree)
	(cond ((null? tree) nil)
				((not (pair? tree)) (list tree))
				(else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree)) ))))


(define nil '())

(define (filter predicate sequence)
	(cond ((null? sequence) nil)
				((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
				(else (filter predicate (cdr sequence)))
		))

(define (accumulate op initial sequence)
	(if (null? sequence) initial	
		(op (car sequence) (accumulate op initial (cdr sequence)))))

;definning the sum-odd-squares-tree 

(define (sum-odd-squares-tree tree)
	(accumulate 
			+ 
			0 
				(map square (filter odd? (enumerate-tree tree)))))


 (define (fib n)
	(cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		(fib (- n 2))))))

;definning collectin of the even fibonaci series

(define (even-fibs n)
	(accumulate 
						cons
						nil 
						(filter even? (map fib 
																(enumerate-interval 0 n))) ))



;constructing list of the (n+1) fibonacci numbers

(define (list-fib-squares n)
	(accumulate cons nil (map square (map fib (enumerate-interval 0 n)))))

; arranging them we can find the product of squares of odd elements in the seqence 
(define (product-of-squares-of-odd-elements sequence)
	(accumulate *
							1 
							(map square 
									(filter odd? sequence))))

