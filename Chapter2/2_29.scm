(define (make-mobile left right)
	(list left right))

(define (make-branch length structure)
	(list length structure))

 
(define (left-branch x) 
	(Car x))

(define (right-branch x) 
	(car (cdr x)))


(define (branch-length x)
	(car x))

(define (branch-structure x)
	(car (cdr x)))


  
(define (total-weight x)
	(+  (cond ((not (pair? x)) x)
						((null? x) 0)
							(else (cond ((null? (left-branch x)) 0) 
													((not (pair? (left-branch x))) (left-branch x))
													(else (cond ((null? (branch-structure (left-branch x))) 0)
																			((not (pair? (branch-structure(left-branch x)))) (branch-structure (left-branch x)))
																			(else (total-weight (branch-structure (left-branch x)))))))))
	(cond ((not (pair? x)) x)
						((null? x) 0)
							(else (cond ((null? (right-branch x)) 0) 
													((not (pair? (right-branch x))) (right-branch x))
													(else (cond ((null? (branch-structure (right-branch x))) 0)
																			((not (pair? (branch-structure(right-branch x)))) (branch-structure (right-branch x)))
																			(else (total-weight (branch-structure (right-branch x)))))))))))

 (define (find-torque branch)
 	(* (branch-length branch) (total-weight (branch-structure branch))))


(define (balanced mobile)
	( 
		let 	( (left-torque (find-torque (left-branch mobile)))
						(right-torque (find-torque (right-branch mobile)))
						)
		(cond ((= left-torque right-torque) true)
					(else false))))


 

 
 (define mobile-1 (make-mobile (make-branch 2 3) (make-branch 1 9)))
 (define mobile-2 (make-mobile (make-branch 1 3) (make-branch 1 10)))
 (define mobile-3 (make-mobile (make-branch 3 mobile-1) (make-branch 1 mobile-2)))

 (define branch-l (make-branch 3 mobile-1))

; testing the generated programme 



d => Changes which needs to be done are 


(define (make-mobile left right)
	(cons left right))

(define (make-branch length structure)
	(cons length structure))

(define (left-branch x) 
	(Car x))

(define (right-branch x) 
	(cdr x))

(define (branch-length x)
	(car x))

(define (branch-structure x)
	(cdr x)))
