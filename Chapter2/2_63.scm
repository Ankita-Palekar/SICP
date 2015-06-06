

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

(define nil '())
(define tree (list 6 (list 5 (list 2 nil nil) (list 6 nil nil)) (list 9 nil nil)))

(define (adjoin-set x set)
	(cond ((null? set) (make-tree x nil nil))
				((= x (entry set)) set)
				((< x (entry set)) (make-tree (entry set) (adjoin-set x (left-branch set)) (right-branch set)))
				((> x (entry set)) (make-tree (entry set) (left-branch set) (adjoin-set x (right-branch set))))))

procedure converting the tree (formed by above procedure to the list) 

(define (tree->list-1 tree)
	(if(null? tree)
		nil
		(append (tree->list-1 (left-branch tree)) (cons (entry tree) (tree->list-1 (right-branch tree))))))

;using condition 

; (define (tree->list-1 tree)
; 	(cond ((null? tree) nil)
; 				(else (display "--- || ----") (append (tree->list-1 (left-branch tree)) (cons (entry tree) (tree->list-1 (right-branch tree)))))))




(define (tree->list-2 tree)
	(define (copy-to-list tree result-list)
	(if (null? tree)
		result-list
		(copy-to-list (left-branch tree) 
			(cons (entry tree) (copy-to-list (right-branch tree) result-list)))))
		(copy-to-list tree nil))


; implementing above procedure using the condition parameters

; (define (tree->list-2 tree)
; 	(define (copy-to-list tree result-list)

; 	( cond((null? tree) result-list)
; 				(else (display "---- || ----")(copy-to-list (left-branch tree) 
; 			(cons (entry tree) (copy-to-list (right-branch tree) result-list))))))
; 		(copy-to-list tree nil))



===========================================================================================================
A ==>
Two procedures produce the same output for any tree (it will give the tree in the form of list)

For trees in fig 2.16 

(define tree1 (list 7 (list 3 (list 1 nil nil) (list 5 nil nil)) (list 9 nil (list 11 nil nil))))
(define tree2 (list 3 (list 1 nil nil) (list 7 (list 5 nil nil) (list 9 nil (list 11 nil nil)))))
(define tree3 (list 5 (list 3 (list 1 nil  nil) nil) (list 9 (list 7 nil nil) (list 11 nil nil))))


===== Tree 1 =====

(tree->list-2 tree1)
 (1 3 5 7 9 11)
(tree->list-1 tree1)
 (1 3 5 7 9 11)

===== Tree 2 =====

(tree->list-1 tree2)
	(1 3 5 7 9 11)
(tree->list-2 tree2)
	(1 3 5 7 9 11)

===== Tree 3 =====

(tree->list-1 tree3)
	(1 3 5 7 9 11)
(tree->list-2 tree3)
	(1 3 5 7 9 11)

B ===> Order of growth for both procedures is same because the both use left-branch and the right-branch procedures which cuts down the groth 







		