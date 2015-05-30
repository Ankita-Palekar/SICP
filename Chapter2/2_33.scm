;using accumulate function to define basic list operations


(define (map p sequence)
	(accumulate (lambda (x y)(cons (p x) y)) nil sequence))
 

(define (append seq1 seq2)
	(accumulate cons seq2 seq1))

==> Output 
(append (list (list 1 2 3) (list 6 8)) (list 4 8 2))
;Value 12: ((1 2 3) (6 8) 4 8 2)



(define (length sequence)
	(accumulate modified-inc   0 sequence))
 
(define (modified-inc x y)
	(+  y 1))


; function accumuate
(define (accumulate op initial sequence)
	(if (null? sequence) initial	
		(op (car sequence) (accumulate op initial (cdr sequence)))))
