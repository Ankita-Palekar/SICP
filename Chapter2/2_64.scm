(define (list->tree elements)
	(car (partial-tree elements (length elements))))

 

(define (partial-tree elts n)
	(if (= n 0)
		(cons '() elts)
		(let ((left-size (quotient (- n 1 ) 2)))
				(let ((left-result (partial-tree elts left-size)))
					(let ((left-tree (car left-result))
							 (non-left-elts (cdr left-result))
							 (right-size (- n (+ left-size 1))))
						(let ((this-entry (car non-left-elts))
									(right-result (partial-tree (cdr non-left-elts) right-size)))
							(let ((right-tree (car right-result))
										(remainning-elts (cdr right-result)))
									
										(cons (make-tree this-entry left-tree right-tree) remainning-elts))))))))



(define (length items)
	(if (null? items)
		0
		(+ 1 (length (cdr items)))))

===========================================================================================================

A ===> Tree produced by the list->tree fo (1 3 5 7 9 11)

 				5
 		/			\
 	1					9	
 		\			/		\
 			3	7				11


Explaination For the above procedure partial-tree 

Arguments provided to the partial-tree are elts -> lsit of the elements to be converted to tree n->lengthof the remainning tree elements

If the size of the tree to be produces is zero (= n 0) then the output will be ( nil , remainning-elements ) ; remainning-elements are the ones which cannot be accomodated in the tree 

else part 

left-size -> size of the left balanced tree which will be formed 
left-result -> will take the value of the recursive result which will help in eleminating the elements to the right half while concentrating ont the left half of the tree ; since it is an recusrsive call to the partial procedure it will again construct the object with tree and elements which cannot be accomodated in the tree (remainning elements )

left-tree -> (car (left-result))
non-left-elts -> will be again the left over elemets which will not be included 
right-size -> will be the size formed by the remainning elements
this-entry -> first element from the non-left elements int the list 


b  ==> order of growth will be (log n) since cons is divided into the two parts every time 


