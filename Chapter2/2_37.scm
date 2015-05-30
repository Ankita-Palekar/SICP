(define (accumulate op initial sequence)
	(if (null? sequence) initial	
		(op (car sequence) (accumulate op initial (cdr sequence)))))


(define (accumulate-n op init seqs)
	(if (null? (car seqs))
		nil 
		(cons (accumulate op init (map car seqs))
					(accumulate-n op init (map cdr seqs)))))


(define (dot-product v w)
	(accumulate + 0 (map * v w)))

 


(define (matrix-*-vector m v)
	(map (lambda(x) (dot-product (car m) v))  m))
