Generic arithmatic procedures are defined as 

(define (add x y)(apply-generic 'add x y))
(define (sub x y)(apply-generic 'sub x y))
(define (mul x y)(apply-generic 'mul x y))
(define (div x y)(apply-generic 'div x y))
(define (=zero? x) (apply-generic '=zero? x))


(define (install-polynomial-package)
	(put '=zero? 'polynomial =zero?))



