; procedure to find the square root using the damping conditions


(define tolerance 0.00001)

(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))

	(define (try guess)
		(let ((next (f guess)))
			(if (close-enough? guess next)
				next
			(try next))))
		(try first-guess))

(define (cube x)
	(* x x x))


(define (average-damp f)
	(lambda (x) (average x (f x))))

 
(define (average x y) 
 	(/ (+ x y) 2))

(define (fast-expt b n) 
 (define (iter a b n) 
   (cond ((= n 0) a) 
         ((even? n) (iter a (square b) (/ n 2))) 
         (else (iter (* a b) b (- n 1))))) 
 (iter 1 b n)) 

(define (sqrt x)
	(fixed-point (average-damp (lambda (y) (/ x y)))
		1.0))

(define (curt x)
	(fixed-point (average-damp (lambda (y) (/ x (square y)))) 1.0))

(define (fourth-root x)
	(fixed-point (average-damp (average-damp (lambda (y) (/ x (cube y))))) 1.0))

(define (nth-root x n no-avg-damps)
	(fixed-point (repeated (average-damp (lambda (y) (/ x (fast-expt y (- n 1))))) no-avg-damps) 1.0))  

(define (repeated f n)
	(if (= n 0)
		(lambda (x) x)
			(compose f (repeated f (- n 1)))))

(define (compose f g) 
	(lambda (x) (f (g x))))
