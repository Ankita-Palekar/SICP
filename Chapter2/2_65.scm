2.63 

(define (entry tree)
	(car tree))

(define (left-branch tree)
	(cadr tree))

(define (right-branch tree)
	(caddr tree))

(define (make-tree entry left right)
	(list entry left right))


(define (element-of-set? x set)
	(cond ((null? set) false)
				((= x (entry set)) true)
				((< x (entry set)) (element-of-set? x (left-branch set)))
				((> x (entry set)) (element-of-set? x (right-branch set))) ))

(define (adjoin-set x set)
	(cond ((null? set) (make-tree x nil nil))
				((= x (entry set)) set)
				((< x (entry set)) (make-tree (entry set) (adjoin-set x (left-branch set)) (right-branch set)))
				((> x (entry set)) (make-tree (entry set) (left-branch set) (adjoin-set x (right-branch set))))))


(define (tree->list-1 tree)
	(if(null? tree)
		nil
		(append (tree->list-1 (left-branch tree)) (cons (entry tree) (tree->list-1 (right-branch tree))))))


(define (tree->list-2 tree)
	(define (copy-to-list tree result-list)
	(if (null? tree)
		result-list
		(copy-to-list (left-branch tree) 
			(cons (entry tree) (copy-to-list (right-branch tree) result-list)))))
		(copy-to-list tree nil))


;===========================================================================================
;2.64


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
;============================================================================================


;Intersection of two sets which are representesd in the form of a tree

(define nil '())

 
================================================================================================ 
; using method of tree traversal
(define (intersection-set set1 set2)
	( if(or (null? set1) (null? set2))
			nil
		(let ((X1 (entry set1))
					(x2 (entry set2)))
			(cond ((= x1 x2) (make-tree x1 (intersection-set (left-branch set1) (left-branch set2)) (intersection-set (right-branch set1) (right-branch set2))))
						((< x1 x2) (make-tree (intersection-set (right-branch set1) set2) 
																	(intersection-set (left-branch set1) (left-branch set2)) 
																	(intersection-set (right-branch set1) (right-branch set2))))
						((> x1 x2)(make-tree 	(intersection-set (left-branch set1) set2) 
																	(intersection-set (left-branch set1) (left-branch set2))
																	(intersection-set (right-branch set1) (right-branch set2))))))))

================================================================================================
;intersection using element of x? procedure
(define (intersection-set set1 set2)
	(if(or (null? set1) (null? set2))
		nil
		(let ((x1 (car set1)))
			(cond ((element-of-set? x1 set2)
									(make-tree x1 (intersection-set (left-branch set1) set2) 
																(intersection-set (right-branch set1) set2))) 
						(else (make-tree nil 	(intersection-set (left-branch set1) set2) 
																	(intersection-set (right-branch set1) set2)))))))	

;=======================================================================================================



(define (union-set tree1 tree2)
	(cond ((and (null? tree1) (null? tree2)) nil)
				((null? tree1) tree2)
				((null? tree2) tree1)
				(else (let ((left-union-tree (union-set (left-branch tree1) (adjoin-set (entry tree1) tree2))))
							(union-set (right-branch tree1) (adjoin-set (entry tree1) left-union-tree))))))

