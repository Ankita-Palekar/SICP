(define (make-mobile left right)
	(list left right))

(define (make-branch length structure)
	(list length structure))

(define (left-branch x)
	(cond ((null? x) 0)
				((not (pair? x)) x)
				(else (car x))))


(define (right-branch x)
	(cond ((null? x) 0)
				((not (pair? x)) x)
				(else (cdr x))))

(define (branch-length x)
	(cond ((null? x) 0)
				((not (pair? x)) x)
				(else (car x))))

(define (branch-structure x)
 	(cond ((null? x) 0)
				((not (pair? x)) x)
				(else (cdr x))))

(define (total-weight x)
	(cond ((not (pair? x)) x)
				((null? x) 0)
				((pair? x)   
					(+ (clean-list (total-weight (branch-structure	(left-branch x)))) 	
					(clean-list 
						(total-weight (branch-structure	(right-branch x))))
					
					))))


;clean list removes if there are any empty parms

(define (clean-list x)
	(cond ((not (pair? x)) x)
				((null? x) 0)
				((pair? x)(
					cond ((null? (car x)) (clean-list (cdr x)))
							 ((null? (cdr x)) (clean-list (car x)))))
				))



(define branch-c (make-branch 3 50))
(define branch-d (make-branch 3 60))
(define branch-e (make-branch 4 70))
(define branch-f (make-branch 4 80))
(define mobile-1 (make-mobile branch-c branch-d))
(define mobile-2 (make-mobile branch-e branch-f))
(define branch-a (make-branch 2 mobile-1))
(define branch-b (make-branch 2 mobile-2))
(define mobile-tree (make-mobile branch-a branch-b))


;definning a small tree
(define branch-1 (make-mobile 3 10))
(define branch-2 (make-mobile 3 80))

(define small-mobile (make-mobile branch-1 branch-2))



;back up 

(define (total-weight x)
	(cond ((not (pair? x)) x)
				((null? x) 0)
				((pair? x)   
					(+ (clean-list 
						(cond ((null? (branch-structure (left-branch x))) 0)
									((not (pair? (branch-structure (left-branch x)))) x)
									(else (total-weight (branch-structure	(left-branch x)))))) 	
					(clean-list 
						(cond ((null? (branch-structure (right-branch x))) 0)
								((not (pair? (branch-structure (right-branch x)))) x) 
								(else (total-weight (branch-structure	(right-branch x))))))
					
					))))
