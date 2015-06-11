(define nil '())

(define (encode message tree)
	(if (null? message)
		nil
		(append (encode-symbol (car messgae) tree) (encode (cdr message) tree))))

	 

	(define (encode-symbol x tree)
		(define (encode-symbol-1 x tree bits)
			(if(check-if-symbol-exist? x (symbols tree))
					(let ((left-branch-elements (symbols (left-branch tree)))
							(right-branch-elements (symbols (right-branch tree)))
							(left-branch-tree (left-branch tree))
							(right-branch-tree (right-branch tree)))
							(cond ((check-if-symbol-exist? x left-branch-elements)
											(cond ((leaf? left-branch-tree)  (append bits (list 0)))
														(else  (append (list 0) (encode-symbol-1 x left-branch-tree bits)) )))
											((check-if-symbol-exist? x right-branch-elements)
												(cond ((leaf? right-branch-tree) (append bits (list 1)))
															(else (append (list 1) (encode-symbol-1 x right-branch-tree bits)))))))
					(error "This symbol does not exist " x)))
		(encode-symbol-1 x tree '()))







(define (encode-symbol x tree)
	(define (encode-symbol-1 x tree bits))
	(if(null? tree)
		'()
		(let (start-point-tree tree))))




(define sample-tree 
	(make-code-tree (make-leaf 'A 4)
		(make-code-tree (make-leaf 'B 2)
										(make-code-tree (make-leaf 'D 1)
																		(make-leaf 'C 1)))))
; 
(define hybrid-tree 
	(make-code-tree  (make-leaf 'A 2) (make-code-tree (make-code-tree (make-leaf 'b 2) (make-leaf 'c 2)) (make-leaf 'd 2))))


; procedure made to check travesal and bits if left then 0 will be added and if right then 1 will be added 

  


(define (check-if-symbol-exist? x symbol-set)
	(cond ((null? symbol-set) false)
				((equal? x (car symbol-set)) true)
				(else  (check-if-symbol-exist? x (cdr symbol-set)))
				))



