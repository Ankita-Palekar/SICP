 (define nil '())

(define list1 (list '()))

	 (define (find-all-pairs pair-list)
	 	(cond 
	 				((pair? pair-list)
	 						(cond ((not (or (pair? (car pair-list)) (pair? (cadr pair-list)))) (set! list1 (append list1 (list pair-list)) ))
	 									(else (cons (find-all-pairs (car pair-list)) (find-all-pairs (cdr pair-list))))
	 						))))

; (define (find-all-pairs pair-list)
; 	(define (dispatch p-l)
; 		(cond 
; 			((pair? p-l)
; 					(cond ((single? p-l) p-l)
; 								(else (cons (dispatch (car p-l)) (dispatch (cdr p-l))))))))
; 	(dispatch pair-list))
(set! list1 (reverse (cdr list1)))  ;final set of pairs 




(define (single? x)
	(and (not (pair? (car x))) (not (pair? (cdr x)))))

; to fetcht the distinct list of elements in the pairs form 

 (define map-list (map (lambda (i)
					(map (lambda (j) (list j i))
						(enumerate-interval 1 (- i 1))))
							(enumerate-interval 1 6)))



(define weight1 (lambda(x) (+ (car x) (cadr x))))

(define weight2 (lambda(x) (+ (square (car x)) (square (cadr x)))))

(define (sort-weight s1 s2 weight)
	(let ((s1car (if (null? s1) 0 (car s1)))
				(s2car (if (null? s2) 0 (car s2))))
		(cond ((null? s1) s2)
					((null? s2) s1)
					((= (weight s1car) (weight s2car)) (cons s1car (sort-weight (cdr s1) s2 weight)))
					((< (weight s1car) (weight s2car)) (cons s1car (sort-weight (cdr s1) s2 weight)))
					((> (weight s1car) (weight s2car)) (cons s2car (sort-weight s1 (Cdr s2) weight))))))



(define sort (sort-weight list1 (cdr list1) weight1))
(define int (enumerate-interval 1 6)) 
(define (tripplets pair-list int-stream)
	(let ((pair-i-j (if (null? pair-list) pair-list (car pair-list)))
				(k (if (null? int-stream) 0 (car int-stream))))

			(cond ((null? pair-i-j) "done")
						((= (square k) (weight2 pair-i-j)) (cons (list pair-i-j k) (tripplets (cdr pair-list) (cdr int-stream))))
						((>  (square k) (weight2 pair-i-j)) (tripplets (cdr pair-list) int-stream))
						((< (square k) (weight2 pair-i-j)) (tripplets pair-list (cdr int-stream))))))


(define trips (tripplets sort int))

