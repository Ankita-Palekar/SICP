
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

(define (gcd a b)
	(if (= b 0)
		a
	(gcd b (remainder a b))))

;using the problem solved in the previous example i.e the abs-aminus-b

 (define (make-rat n d) 
   (let ((g ((if (< d 0) - +) (gcd n d)))) 
     (cons (/ n g) (/ d g)))) 
  





(define one-frac (make-rat 2 3))

(define two-frac (make-rat 1 3))

(print-rat (make-rat one-frac two-frac))


