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
	(/ neg-point pos-point)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           )


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


;Nested mapping 

(define n 6)


(accumulate append
		nil
			(map (lambda (i)
					(map (lambda (j) (list i j))
						(enumerate-interval 1 (- i 1))))
							(enumerate-interval 1 n)))
; using accumulate using the abstraction of the methods.

(define (flatmap proc seq)
	(accumulate append nil (map proc seq)))

(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))

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


(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
	(map make-pair-sum
		(filter prime-sum?
			(flatmap
				(lambda (i)
					(map (lambda (j) (list i j))
						(enumerate-interval 1 (- i 1))))
							(enumerate-interval 1 n)))))

(define (permutations s)
	(if (null? s)
			(list nil)
			(flatmap (lambda (x) (map (lambda (p) (cons x p))
														(permutations (remove x s)))) s)))

(define (filter predicate sequence)
	(cond ((null? sequence) nil)
				((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
				(else (filter predicate (cdr sequence)))
		))

(define (remove item sequence)
	(filter (lambda(x) (not (= x item)))
		sequence))


;frame coordinates 


(define (make-vect x y)
		(cons x y))

(define (xcor-vect z)
	(car z))


(define (ycor-vect z)
	(cdr z))

(define (frame-coord-map frame)
	(lambda (x)
		(add-vect (origin-frame frame))
							(add-vect (scale-vect (xcor-vect v) 
																		(edge1-frame frame))
												(scale-vect (ycor-vect v)
																		(edge2-frame frame)))))


(define (memq item x)
	(cond ((null? x) false)
				((eq? item (car x)) x)
				(else (memq item (cdr x)))
				))

;procedure to show symbolic differenciation 

; a + b  ====> addend a === augend b
; a*b   =====> multiplier a === multiplicand b


(define (deriv exp var)
	(cond ((number? exp) 0)
				((variable? exp)
					(if (same-variable? exp var) 1 0))
				((sum? exp) (make-sum (deriv (addend exp) var)
															(deriv (augend exp) var)))
				((product? exp)
					(make-sum (make-product (multiplier exp)
										(deriv (multiplicand exp) var))
										(make-product (deriv (multiplier exp) var)
																	(multiplicand exp))))
				(else (error "unknown expression type -- DERIV" exp))
				))


(define (variable? x)
	(symbol? x))

(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))


(define (make-sum a1 a2)
	(list '+ a1 a2))

(define (make-product a1 a2)
	(list '* a1 a2))


(define (sum? x)
	(and (pair? x) (eq? '+ (car x))))

(define (addend s)
	(cadr s))


(define (augend s)
	(caddr s))

(define (product? x)
	(and (pair? x) (eq? (car x) '*)))


(define (multiplier p)
	(cadr p))

(define (multiplicand p)
	(caddr p))

;modified make-sum for the purpose of simplifying the equation 


(define (make-sum a1 a2)
	(cond ((=number? a1 0) a2)
		((=number? a2 0) a1)
		((and (number? a1) (number? a2)) (+ a1 a2))
		(else (list '+ a1 a2))
		))


(define (=number? exp num)
	(and (number? exp) (= exp num)))

;modiffued make-product for the purpose of simplification

(define (make-product m1 m2)
	(cond ((or (=number? m1 0) (=number? m2 0)) 0)
				((=number? m1 1) m2)
				((=number? m2 1) m1) 
				((and (number? m1) (number? m2)) (* m1 m2))
				(else (list '* m1 m2))))


;trying segements and 


(define (segments->painter segment-list)
	(lambda(frame)
		(for-each 
			(lambda (segment)
				(draw-line	((frame-coord-map frame) (start-segment segment))
										((frame-coord-map frame) (end-segment segment))))
			segment-list)))


 (define (frame-coord-map frame)
	(lambda (x)
		(add-vect (origin-frame frame))
							(add-vect (scale-vect (xcor-vect v) 
																		(edge1-frame frame))
												(scale-vect (ycor-vect v)
																		(edge2-frame frame)))))

 (define (make-vect x y)
 		(cons x y))

 (define (xcor-vect z)
 	(car z))


 (define (ycor-vect z)
 	(cdr z))


 (define (add-vect vect1 vect2)
 	(let ((x1 (xcor-vect vect1))
 				(x2 (xcor-vect vect2))
 				(y1 (ycor-vect vect1))
 				(y2 (ycor-vect vect2)))
 			(cons (+ x1 x2) (+ y1 y2))
 	))

 (define (reverse-vector vect)
 	( cons (- (xcor-vect vect)) (-  (ycor-vect vect))))


 (define (sub-vect vect1 vect2)
 				(add-vect vect1 (reverse-vector vect2)))


 (define (scale-vector vect factor)
 	(cons (* factor (xcor-vect vect)) (* factor (ycor-vect vect))))



(define (transform-painter painter origin corner1 corner2)
	(lambda(frame)
		(let ((m (frame-coord-map frame)))
			(let ((new-origin (m origin)))
				(painter 
				(make-frame new-origin (sub-vect (m corner1) new-origin))	(sub-vect (m corner2) new-origin))))))


(define (flip-vertical painter)
	(transform-painter painter (make-vect 0.0 1.0) (make-vect 1.0 1.0) (make-vect 0.0 0.0)))

=====================================================================================================

representing set in the form of tree and further in the form of list that is the abstraction of the data abstraction
since we are using the tree structure number of steps are broken to (log n)



(define (entry tree)
	(car tree))

(define (left-branch tree)
	(cadr tree))

(define (right-branch tree)
	(caddr tree))

(define (make-tree entry left right)
	(list entry left right))


(define (element-of-set? x set)
	(cond ((null? set) false)
				((= x (entry set)) true)
				((< x (entry set)) (element-of-set? x (left-branch set)))
				((> x (entry set)) (element-of-set? x (right-branch set))) ))

(define nil '())
(define tree (list 6 (list 5 (list 2 nil nil) (list 6 nil nil)) (list 9 nil nil)))

(define (adjoin-set x set)
	(cond ((null? set) (make-tree x nil nil))
				((= x (entry set)) set)
				((< x (entry set)) (make-tree (entry set) (adjoin-set x (left-branch set)) (right-branch set)))
				((> x (entry set)) (make-tree (entry set) (left-branch set) (adjoin-set x (right-branch set))))))

procedure converting the tree (formed by above procedure to the list) 

(define (tree->list-1 tree)
	(if(null? tree)
		nil
		(append (tree->list-1 (left-branch tree)) (cons (entry tree) (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
	(define (copy-to-list tree result-list)
	(if (null? tree)
		result-list
		(copy-to-list (left-branch tree) 
			(cons (entry tree) (copy-to-list (right-branch tree) result-list)))))
		(copy-to-list tree nil))



====================================================================================================

Huffman Encoding 

(define (make-leaf symbol weight)
	(list 'leaf symbol weight))

(define (leaf? object)
	(eq? (car object) 'leaf))

(define (symbol-leaf x)
	(cadr x))

(define (weight-leaf x)
	(caddr x))


To make a tree 

(define (make-code-tree left right)
	(list left right (append (symbols left)(symbols right)) (+ (weight left) (weight right))))

; Selectors for the tree coded above 

(define (left-branch tree)
	(car tree))

(define (right-branch tree)
	(cadr tree))

(define (symbols tree)
	(if (leaf? tree) 
		(list (symbol-leaf tree))
		(caddr tree)))

(define (weight tree)
	(if (leaf? tree)
		(weight-leaf tree)
		(cadddr tree)))


; (define (+ left right)
; 	(if (and (pair? left) (pair? right))
; 			(+ (car left) (car right))
; 			(+ left right)
; 			))

(define nil '())

(define (decode bits tree)
	(define (decode-1 bits current-branch)
		(if (null? bits)
			nil
			(let ((next-branch (choose-branch (car bits) current-branch)))
				(if (leaf? next-branch)
					(cons (symbol-leaf next-branch)
							(decode-1 (cdr bits) tree))	
						(decode-1 (cdr bits) next-branch)))))
						(decode-1 bits tree))


(define (choose-branch bit branch)
	(cond ((= bit 0)	(left-branch branch))
				((= bit 1)	(right-branch branch))
				(else (error "bad bit--- CHOOSE-BRANCH" bit))))

(define leaf-a (make-leaf 'A 8))
(define leaf-b (make-leaf 'B 3))
(define leaf-c (make-leaf 'C 1))
(define leaf-d (make-leaf 'D 1))
(define leaf-e (make-leaf 'E 1))
(define leaf-f (make-leaf 'F 1))
(define leaf-g (make-leaf 'G 1))
(define leaf-h (make-leaf 'H 1))


(define tree-1 (make-code-tree leaf-g leaf-h))
; adojoin of set for the repeated set

(define (adjoin-set x set)
	(cond ((null? set) (list x))
				((< (weight x) (weight (car set))) (cons x set))
				(else (cons (car set) (adjoin-set x (cdr set))))))


(define (make-leaf-set pairs)
	(if (null? pairs)
			nil
			(let ((pair (car pairs)))
				(adjoin-set (make-leaf (car pair) (cadr pair))
					(make-leaf-set (cdr pairs))))))


(define sample-tree 
	(make-code-tree (make-leaf 'A 4)
		(make-code-tree (make-leaf 'B 2)
										(make-code-tree (make-leaf 'D 1)
																		(make-leaf 'C 1)))))


(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))



========================================================================================================
															Multiple Representation of Abstract data
========================================================================================================
Z = x + iy => In the form of imaginary and real real-part

Z = r(cos(theta) + sin(theta))

mag = |Z| = root(x*x + y*y)
ang = tan(theta) = arctan(y x)
a = r * cos (theta)
b = r * sin (theta)




note :atan returns the result of tan (y/x) sign of the argumenst determine the quodrant


(define (make-from-real-img z1 z2)
	(cons z1 z2))

(define (make-from-mag-ang z1 z2)
	(cons z1 z2))

(make-from-real-img (real-part z) (imag-part z))

(make-from-mag-ang (magnitude z) (angle z))																

(define (add-complex z1 z2)
	(make-from-real-img (+ (real-part z1) (real-part z2))
											(+ (imag-part z1) (imag-part z2))))

(define (sub-complex z1 z2)
	(make-from-real-img (- (real-part z1) (real-part z2))
											(- (imag-part z1) (imag-part z2))))

(define (mul-complex z1 z2)
	(make-from-mag-ang (* (magnitude z1) (magnitude z2))
										 (+ (angle z1) (angle z2))))

(define (div-complex z1 z2)
	(make-from-mag-ang (/ (magnitude z1) (magnitude z2)) 
											(- (angle z1) (angle z2))))

(define (real-part z)
	(car z))

(define (imag-part z)
	(cdr z))

(define (magnitude z)
	(sqrt (+ (square (real-part z)) (square (imag-part z)))))

(define (angle z)
	(atan (real-part z) (imag-part z)))

(define (make-from-mag-ang r a)
	(cons (* r (cos a)) (* r (sin a))))

; Selectors for the problem implementes in the form of magnitude and radius

(define (real-part z)
	(* (magnitude z) (cos (angle z))))

(define (imag-part z)
	(* (magnitude z) (sin (angle z))))

(define (magnitude z)
	(car z))

(define (angle z)
	(cdr z))

(define (make-from-real-img x y)
	(cons (sqrt (+ (square x) (square y))) (atan y x)))

(define (make-from-mag-ang r a)
	(cons r a))


==================================================================================


Trying out additivity and the data-directed programming using the generic procedures

Fora rectangular packages

(define (install-rectangular-package)
	;; internal procedures
	(define (real-part z) (car z))
	(define (imag-part z) (cdr z))
	(define (make-from-real-img x y) (cons x y))
	(define (magnitude z) 
						(sqrt (+ (square (real-part z))
										 (square (imag-part z)))))
	(define (angle z)
		(atan (imag-part z) (real-part z)))
	(define (make-from-mag-ang r a)
		(cons (* r (cos a)) (* r (sin a))))

	;; interfaces to the rest of the system 
	(define (tag x) (attach-tag 'rectangular x))
	(put 'real-part '(rectangular) real-part)
	(put 'imag-part '(rectangular) imag-part)
	(put 'magnitude '(rectangular) magnitude)
	(put 'angle 		'rectangular angle)
	(put 'make-from-real-img  'rectangular (lambda (x y) (tag (make-from-real-img x y))))
	(put 'make-from-mag-ang 'rectangular (lambda (x y) (tag (make-from-mag-ang r a))))
	'done
	)

================================================================================================

; test rajdeep sum

add(a)(b) should return the value a + b
 

(define (add a b)
	(define (dispatch x y)
		(+ x y))
	dispatch
	)

(define (add-two x y)((add x y) x y))
 

(define (add-two x)
	(define (dispatch y)
		(+ x y))
	dispatch
	)

 (define (add x) (add-two x))
================================================================================================ 
						using the poly method discussed
================================================================================================

(define (same-variable? v1 v21) 
	(and (variable? v1) (variable? v2) (eq? v1 v2)))

===================================== chapter 3===========================================================


(define balance 100)

(define (withdraw amount)
	(if (>= balance amount)
		(begin (set! balance (- balance amount)) balance)
			"insufficient funds"))

(define new-withdraw
	(let ((balance 100))
		(lambda(amount)
			(if (>= balance amount)
					(begin (set! balance (- balance amount)) balance) "In sufficient funds"))))


(define (make-withdraw balance)
	(lambda (amount) (
		if(>= balance amount)
		(begin (set! balance (- balance amount)) balance)
		"Insufficien amount")))



procdeure to make an bank account

(define (make-account balance)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount)))

			"insufficient funds"))
	(define (deposit amount)
	(set! balance (+ balance amount))
	balance)
	(define (dispatch m)
		(cond ((eq? m 'withdraw) withdraw)
					((eq? m 'deposit) deposit)
					(else (error "unknown request -- MAKE - ACCOUNT" m))
		))
	dispatch
	)


Monte carlo methdo
; definning the random update function 
 note: random update for x (ax + b) mod m where a b mare the chosen integers 

;(define (rand-update x)
;	(remainder (+ (* (random 10) x) (random 10)) (random 10)))

(define (rand-update x)
	(let ((a 900)
				(b 555)
				(m 47))
		(remainder (+ (* a x) b) m)))

(define (monte-carlo trials experiment)
	(define (iter trials-remainning trials-passed)
		(cond ((= trials-remainning 0)(/ trials-passed trials))
					((experiment) (iter (- trials-remainning 1) (+ trials-passed 1)))
					(else (iter (- trials-remainning 1) trials-passed))))
	(iter trials 0))

(define (estimate-pi trials)
	(sqrt (/ 6 (monte-carlo trials cesaro-test))))

(define (cesaro-test)
	(= (gcd (r) (r))))
	
(define random-init 47)

(define (rand random-init)
	(let ((x random-init))
		(lambda ()
			(set! x (rand-update x))
			x)))

(define (estimate-pi trials)
	(sqrt (/ 6 (random-gcd-test trials random-init))))

(define (random-gcd-test trials initial-x)
	(define (iter trials-remainning trials-passed x)
		(let ((x1 (rand-update x)))
			(let ((x2 (rand-update x1)))
				(cond ((= trials-remainning 0)
								(/ trials-passed trials))
				((= (gcd x1 x2) 1)
					(iter (- trials-remainning 1)
						(+ trials-passed 1)
						x2))
				(else (iter (- trials-remainning 1) trials-passed x2))))))
	(iter trials 0 initial-x))


(define (make-simplified-withdrawal balance)
	(lambda (amount)
		(set! balance (- balance amount))
		balance))

(define (make-increment balance)
	(lambda (amount)
		(- balance amount)))



; factorial computatoin using the assignement operator 

(define (factorial n)
	(let ((product 1)
				(counter 1)) 
		(define (iter)
			(if (> counter n)
			product 
			(begin 	(set! product (* counter product))
							(set! counter (+ counter 1)) (iter))))

		(iter)
		))


; changing the order of the set variable chnages the way result will be calculated


(define (cons x y)
	(lambda(m) (m x y)))

(define (car z)
	( z (lambda (p q) p)))

(define (append! x y)
	(set-cdr! (last-pair x) y))

(define (last-pair x) 
	(if(null? (cdr x))
		x(last-pair (cdr x))))




;;infinite streams 



(define (intergers-starting-from n)
	(cons-stream  n (intergers-starting-from (+ n 1))))

	(define integers (intergers-starting-from 1))


	(define (divisible? x y)
		(= (remainder x y) 0))

	(define no-sevens (stream-filter (lambda(x) (not (divisible? x 7)))
		integers))

	(stream-ref no-sevens 100)
	117

	(define (fibgen a b)
		(cons-stream a (fibgen b (+ a b))))

	(define fibs (fibgen 0 1))

	(define (sieve stream)
		(cons-stream (stream-car stream) 
								 (sieve (stream-filter (lambda(x) (not (divisible? x (stream-car stream))))
								 	(stream-cdr stream)))))
	(define primes (sieve (intergers-starting-from 2)))

(define (scale-stream stream factor)
	(stream-map (lambda(x) (* x factor)) stream))


(define primes (cons-stream 2 (stream-filter prime? (intergers-starting-from 3))))


(define (prime? n)
	(define (iter ps)
		(cond ((> (square (stream-car ps)) n) true)
					((divisible? n (stream-car ps)) false)
					(else (iter (stream-cdr ps)))))
	(iter primes))