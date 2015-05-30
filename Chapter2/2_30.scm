(define (square-tree tree)
	(cond ((null? tree) '())
				((not (pair? tree)) (square tree))
				(else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

 

(define (square-tree tree)
	(map (lambda (sub-tree) (if (pair? sub-tree) (square-tree sub-tree) (cube sub-tree ))) tree))



; In rhis perticular map function we use squaring sequentially that is each element is passed sequntially to the function as a sub tree
; since sub tree is in the form of the list we need to break it down in terms of the single element with the help of 
; anonymous function 
