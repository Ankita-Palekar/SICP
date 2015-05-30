

(define (count-leaves x)
	(cond ((null? x) 0)
				((not (pair? x)) 1)
				(else (+ (count-leaves (car x))
								 (count-leaves (cdr x))))))

;=========
;1-> we need to convert tree in the form of sequence so that it will take all leaves only 
;Redefinning count leaves as the function of accumulation 


(define nil '())

(define (count-leaves tree)
	(accumulate modified-inc 0 (map identity (enumerate-tree tree))))
 
(define (identity x)
	x)

(define (modified-inc x y)
	(+  y 1))

(define (enumerate-tree tree)
	(cond ((null? tree) nil)
				((not (pair? tree)) (list tree))
				(else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree)) ))))

(define (accumulate op initial sequence)
	(if (null? sequence) initial	
		(op (car sequence) (accumulate op initial (cdr sequence)))))
