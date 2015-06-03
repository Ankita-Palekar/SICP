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
	(map (lambda (x) (dot-product x v))  m))

(define nil '())

(define (transpose mat) 
	(accumulate-n  cons  nil   mat))


;way 1
(define (matrix-*-matrix m n)
	(let ((cols (transpose n)))
			(map (lambda (x) (matrix-*-vector n x)) m)
		))
;x is the row of matrix m

;way 2
(define (matrix-*-matrix m n)
	(let ((cols (transpose n)))
			(map (lambda (x) (map (lambda (y) (dot-product y x))  cols)) m)
		))
;y x -> is the row and column vector of each matrix