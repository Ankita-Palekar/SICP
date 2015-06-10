(define (new-if predicate then-clause else-clause)
	(cond (predicate then-clause)
			(else else-clause)))

(define (sqrt-iter guess x)
	(new-if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))


(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))


(define (sqrt-iter guess x)
	(cond ((good-enough? guess x) guess)
				(else (sqrt-iter (improve guess x) x))))

(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.001))

(define (my-if predicate then-clause else-clause)
	(cond (predicate then-clause)
				(else else-clause)))

(define (proc x y)
	(new-if (= x y)
			(display " equal ")
			(display " not equal") ))

(define (call-me x)
	x)

(define (call-someone-else y)
 y)